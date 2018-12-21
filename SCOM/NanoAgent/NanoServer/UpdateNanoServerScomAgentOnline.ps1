
param (
[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [string]$NanoServerFQDN,
[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [string]$BinaryFolder,
[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [bool]$IsCabExpanded,
[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [bool]$RemoveBackup)


#region Logging variables
$ERROR = 1
$INFORMATION = 2
$NanoServer = $NanoServerFQDN.Split(".")[0]
$updateLogFileName = $env:TEMP + "\UpdateLog_" + $NanoServer + ".txt"
$updateStateFileName = $env:TEMP + "\UpdateState_" + $NanoServer + ".txt"

#State variables. Basically there are going to be 6 states during update:
#1. Applicability checks for the update
#2. Stop health service
#3. Backup the current agent binaries
#4. Replace the binaries with new agent update
#5. Update agent version
#6. start healthservice
#7. Remove backup and any other installer binaries not needed
$cabExpanded = 0
$updateApplicable = 0
$serviceStopped = 0
$backupCreated = 0
$binaryReplaced = 0
$agentVerUpdated = 0
$serviceStarted = 0
$backupRemoved = 0

$installPerfCtrs = $false
$installSucessfull = $false


# Basic strings that would be stored in the state file
$cabExpandedSegmentName = "CabExpanded"
$updateApplicableSegmentName = "UpdateApplicable"
$serviceStoppedSegmentName = "ServiceStopped"
$backupCreatedSegmentName = "AgentBinariesBackedUp"
$binaryReplacedSegmentName = "AgentBinariesReplaced"
$agentVerUpdatedSegmentName = "AgentVersionUpdated"
$serviceStartedSegmentName = "ServiceStarted"
$backupRemovedSegmentName = "BackupFolderRemoved"

# Logging the progress of the install
$installLog = New-Object System.Collections.ArrayList($null)

#endregion

#region Helper Methods

#region Logging and Recovery helper methods

# Saves the state of the installation so that we resume from here in case of retry
function StoreUpdateState
{
	$stateContent = New-Object System.Collections.ArrayList($null)
    [void]$stateContent.Add("Please do not delete this file. This file is used by the installer to know about the state of the previous installation. This file would be removed automatically once install is successfull.")    
    if($script:cabExpanded -eq 1)
    {
        [void]$stateContent.Add($($script:cabExpandedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:cabExpandedSegmentName + ":0"))
    }
    if($script:updateApplicable -eq 1)
    {
        [void]$stateContent.Add($($script:updateApplicableSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:updateApplicableSegmentName + ":0"))
    }
    if($script:serviceStopped -eq 1)
    {
        [void]$stateContent.Add($($script:serviceStoppedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:serviceStoppedSegmentName + ":0"))
    }
    if($script:backupCreated -eq 1)
    {
        [void]$stateContent.Add($($script:backupCreatedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:backupCreatedSegmentName + ":0"))
    }
    if($script:binaryReplaced -eq 1)
    {
        [void]$stateContent.Add($($script:binaryReplacedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:binaryReplacedSegmentName + ":0"))
    }
    if($script:agentVerUpdated -eq 1)
    {
        [void]$stateContent.Add($($script:agentVerUpdatedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:agentVerUpdatedSegmentName + ":0"))
    }
    if($script:serviceStarted -eq 1)
    {
        [void]$stateContent.Add($($script:serviceStartedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:serviceStartedSegmentName + ":0"))
    }
    if($script:backupRemoved -eq 1)
    {
        [void]$stateContent.Add($($script:backupRemovedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:backupRemovedSegmentName + ":0"))
    }
    $stateContent | out-file -filepath $script:updateStateFileName -Force -ErrorAction SilentlyContinue
}

# Simple method used to log the progress of the installation
function LogMessage([string]$message, [int]$logLevel)
{
	$levelText = ""
	if($logLevel -eq $ERROR)
	{
		$levelText = "[ERROR]"
		Write-Error "There were errors during installation. Please refer to the $script:updateLogFileName for more details."
	}
	else
	{
		$levelText = "[INFO]"
	}
    Write-Host $message
	[void]$script:installLog.Add((Get-Date).ToString() + ":" + $levelText + ":" + $message)
	if($logLevel -eq $ERROR)
	{
        # There was an error. Write it down and quit as there is no point in continuing
		$script:installLog | out-file -filepath $script:updateLogFileName -Force -ErrorAction SilentlyContinue

        # This method is used so that we know where to resume the installation from the next time
        StoreUpdateState
	}
}

# Recover from failure to restore the old state and exit
function RecoverAndExit()
{
    
    if($script:installSucessfull -eq $false)
    {
        LogMessage "Agent install failed. Recovering to older Agent state." $ERROR

        # if backup was created, restore agent binaries from backup (as they might be replaced with updated binaries fully\partially)
        if($script:backupCreated -eq 1)
        {
            # Copy all agent files from backup location (except the agent state folder)
            Copy-Item $script:BackupLocationUNC\*.* $script:InstallLocationUNC -Force
            Copy-Item $script:BackupLocationUNC\Tools $script:InstallLocationUNC -Recurse -Force

            # Restore Performance counters if those were replaced earlier
            if($script:installPerfCtrs -eq $true)
            {
                InstallPerfCounters
            }

        }

        # if agent version was updated, revert it back
        if($script:agentVerUpdated -eq 1)
        {
            # revert version
            SetAgentRegistryVersion $currentAgentVersion
        }

        # try to remove backup folder (we may choose to leave this as is if install fails)
        if((Test-Path $script:BackupLocationUNC) -eq $true)
        {
            RemoveBackupFolder
        }

        # Remove expanded cab folder if it was created in this script
        RemoveExpandedCabFolder

        # start the healthservice
        StartHealthService

    }
    Exit
}

# Removes backup folder. Does not delete if the parameters for script ask to leave backup folder
function RemoveBackupFolder()
{
    if($RemoveBackup -eq $true)
    {
        LogMessage "Removing backup for old agent directory" $INFORMATION
        Invoke-Command -ComputerName $NanoServerFQDN -ScriptBlock {Remove-Item $args[0] -Recurse} -ArgumentList $script:BackupLocationUNC
        $script:backupRemoved = 1
    }
    else
    {
        LogMessage $("Backup files not removed as per the parameters") $INFORMATION
    }
}

#endregion

#region Applicability helper methods

# Returns the version of the update targetted to be installed
function GetUpdateAgentVersion()
{
    $versionDLLName = "OMVersion.dll" 
    if((Test-Path $script:updateFolderExpanded\$versionDLLName) -eq $false)
    {
        LogMessage "Update files not found in input folder" $ERROR
        throw [System.IO.FileNotFoundException] "Update files not found"
    }
    $updateObject = Get-Item $script:updateFolderExpanded\$versionDLLName
    $updateVersion = $updateObject.VersionInfo.ProductVersion
    LogMessage $("Product Update Version:" + $updateVersion) $INFORMATION

    return $updateVersion
}


# Compares the version of agent installed and agent update (version is like 7.2)
function IsProductVersionMatched()
{
    $versionDLLName = "OMVersion.dll"
    $installedObject = Get-Item $script:InstallLocationUNC\Tools\TMF\$versionDLLName
    $updateObject = Get-Item $script:updateFolderExpanded\$versionDLLName

    LogMessage $("Product Installed Version:" + $installedObject.VersionInfo.ProductVersion) $INFORMATION
    LogMessage $("Product Update Version:" + $updateObject.VersionInfo.ProductVersion) $INFORMATION

    $ProductMajorPartCurrent = $installedObject.VersionInfo.ProductMajorPart
    $ProductMinorPartCurrent = $installedObject.VersionInfo.ProductMinorPart

    $ProductMajorPartUpdate = $updateObject.VersionInfo.ProductMajorPart
    $ProductMinorPartUpdate = $updateObject.VersionInfo.ProductMinorPart

    return (($ProductMajorPartCurrent -eq $ProductMajorPartUpdate) -and ($ProductMinorPartCurrent -eq $ProductMinorPartUpdate))
}


# Compares the build of agent installed and agent update (version is like 10374.0)
function IsUpdateBuildHigher()
{
    $versionDLLName = "OMVersion.dll"
    $installedObject = Get-Item $script:InstallLocationUNC\Tools\TMF\$versionDLLName
    $updateObject = Get-Item $script:updateFolderExpanded\$versionDLLName

    $ProductBuildPartCurrent = $installedObject.VersionInfo.ProductBuildPart
    $ProductPrivatePartCurrent = $installedObject.VersionInfo.ProductPrivatePart

    $ProductBuildPartUpdate = $updateObject.VersionInfo.ProductBuildPart
    $ProductPrivatePartUpdate = $updateObject.VersionInfo.ProductPrivatePart

    return (($ProductBuildPartUpdate -gt $ProductBuildPartCurrent) -or 
                (($ProductBuildPartUpdate -eq $ProductBuildPartCurrent) -and ($ProductPrivatePartUpdate -gt $ProductPrivatePartCurrent)))
}


# Checks to see if update is applicable for the current machine
# This checks applicability based on rule that update version's last 2 parts (build and private part), should be greater than the installed agent.
# And the update should for the same product version as installed (i.e. the first 2 parts should match exactly)
function IsUpdateApplicable()
{
    # check agent present on machine
    if((IsAgentInstalled) -eq $false)
    {
        LogMessage "Agent not present on machine" $ERROR
        return $false
    }

    # check agent of same product version and lower build than update
    if((IsProductVersionMatched) -eq $false)
    {
        LogMessage "Targetted product not present on system." $INFORMATION
        return $false
    }

    if((IsUpdateBuildHigher) -eq $false)
    {
        LogMessage "Same or higher version of product already installed on system." $INFORMATION
        return $false
    }

    return $true
}

#endregion

#region Service helper methods

# Checks if healthservice is running or not
function IsHealthServiceRunning()
{
    $healthService = Get-Service -Name HealthService -ComputerName $NanoServerFQDN
    if($healthService.Status -ne "Running")
    {
        return $false
    }
    return $true
}

# Starts the healthservice
function StartHealthService()
{
    LogMessage "Attempting to start the service...!" $INFORMATION
    Get-Service -Name HealthService -ComputerName $NanoServerFQDN | Set-Service -Status Running
}

# Stops the healthservice (and also AdtAgent service)
function StopHealthService()
{
    LogMessage "Attempting to stop the service...!" $INFORMATION
    Get-Service -Name HealthService -ComputerName $NanoServerFQDN | Stop-Service -Force
    
    # stop the adtagent service
    Get-Service -Name AdtAgent -ComputerName $NanoServerFQDN | Stop-Service -Force
}

#endregion

#region Cab helper methods

# Returns true if it finds at-least one cab file in the input folder
function IsAnyUpdateCabPresent()
{
    return (Test-Path $BinaryFolder\$updateCabNamePattern)
}

# Gets the version of the cab from the cab name. Cab name is expected in format: KB3117586-7.2.11644.0-NanoAgent.cab 
function GetCabVersion($cabname)
{
    $version = $cabname.Split("-")[1]
    return $version
}

# Returns true if version2 is higher than version1
function IsVersionHigher([string]$version1, [string]$version2, [string]$cabname)
{
    $v1Parts = $version1.Split(".")
    $v2Parts = $version2.Split(".")
    
    if($v2Parts.Length -ne 4)
    {
        # Build number not in expected format. Ignore this cab file
        LogMessage $("Cab name not in expected format: " + $cabName + " .Ignoring this cab file") $INFORMATION
        return $false
    }

    #Compare every part of the version starting from left
    for ($i=0; $i -lt $v1Parts.Length; $i++)
    {
        if($v2Parts[$i] -lt $v1Parts[$i])
        {
            return $false
        }
        if($v2Parts[$i] -gt $v1Parts[$i])
        {
            return $true
        }
    }
    
    # This means both versions are same
    return $false
}

# Get latest cab in input folder
function GetLatestCabName()
{
    $cabList = Get-ChildItem -Path $BinaryFolder\$updateCabNamePattern
    $latestVersion = "0.0.0.0"
    $latestCabName = ""

    foreach ($cab In $cabList)
    {
        $cabName = $cab.Name
        $cabCurVersion = GetCabVersion($cabName)
        if((IsVersionHigher $latestVersion $cabCurVersion $cabName) -eq $true)
        {
            $latestCabName = $cabName
            $latestVersion = $cabCurVersion
        }
    }
    return $latestCabName
}

# Expands the specified cab in input folder, to subfolder of cabname in the input update folder
function CopyAndExpandCabAndGetFolder($cabName)
{
    # Copy cab to install location and expand inside install location
    if ((Test-Path $InstallLocationUNC\$cabName) -eq $false)
    {
        Copy-Item $BinaryFolder\$cabName $InstallLocationUNC
    }
    
    $kbNum = $cabName.Split("-")[0]
    $folderName = $kbNum + "_" + $NanoServer + "_" + (Get-Date).ToString('yyMMdd_hhmmss')
    $folder = Join-Path $InstallLocationUNC $folderName
    mkdir $folder
    
    $sourceCab = Join-Path $InstallLocationUNC $cabName
    Invoke-Command -ComputerName $NanoServerFQDN -ScriptBlock {expand.exe $args[0] -F:* $args[1]} -ArgumentList $sourceCab,$folder

    # Cab expansion completed. Assign folder name
    $script:updateFolderExpanded = $folder
}

# Removes the expanded cab folder if it was created by the script and is not same as the user input folder
function RemoveExpandedCabFolder()
{
    if($cabExpanded -eq 1)
    {
        #verify folder we are removing should not be same as the input folder
        if($BinaryFolder -ne $script:updateFolderExpanded)
        {
            LogMessage "Removing the expanded cab folder" $INFORMATION
            Invoke-Command -ComputerName $NanoServerFQDN -ScriptBlock {Remove-Item -Path $args[0] -Recurse} -ArgumentList $script:updateFolderExpanded
        }
    }
}

#endregion

#region Agent helper methods

# Returns true if it finds agent install directory on the agent machine
function IsAgentInstalled()
{
    try
    {
        $service = Get-Service -Name HealthService -ComputerName $NanoServerFQDN
        if($service -ne $null)
        {
            return $true
        }
    }
    catch
    {
        return $false
    }
    return $false
}


# Returns the version of the agent installed on this machine (from registry key)
function GetAgentRegistryVersion()
{
    $versionSubKey = "SOFTWARE\\Microsoft\\Microsoft Operations Manager\\3.0\\Setup"
    $versionRegValueName = "AgentVersion"

    $reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $NanoServerFQDN)
    $regKey = $reg.OpenSubKey($versionSubKey)
    $version = $regKey.GetValue($versionRegValueName)

    return $version
}

# Sets the version of agent installed in the registry key
function SetAgentRegistryVersion($newVersionValue)
{
    $versionSubKey = "SOFTWARE\\Microsoft\\Microsoft Operations Manager\\3.0\\Setup"
    $versionRegValueName = "AgentVersion"

    $reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $NanoServerFQDN)
    $regKey = $reg.OpenSubKey($versionSubKey, $true)
    $regKey.SetValue($versionRegValueName, $newVersionValue, [Microsoft.Win32.RegistryValueKind]::String)
}


# Installs the MomConnector and healthservice performance counters
function InstallPerfCounters()
{
    LogMessage "Installing performance counters" $INFORMATION

    # Installing connector performance counters	    
    $installAgentPerformanceCounters = {
	    lodctr "$env:SystemDrive\Program Files\Microsoft Monitoring Agent\Agent\MOMConnectorCounters.ini"
	}
	Invoke-Command -ScriptBlock $installAgentPerformanceCounters -ComputerName $NanoServerFQDN -ErrorAction Stop

	# Installing health service performance counters
	$installHealthServicePerformanceCounters = {
	    lodctr "$env:SystemDrive\Program Files\Microsoft Monitoring Agent\Agent\HealthServiceCounters.ini"
    }
	Invoke-Command -ScriptBlock $installHealthServicePerformanceCounters -ComputerName $NanoServerFQDN -ErrorAction Stop
}

#endregion

#endregion

# Initialize Agent Install directories.
try
{
    $updateCabNamePattern = "*-NanoAgent.cab"
    $ResourceCabName = "Resources.cab"
    $script:updateFolderExpanded = $BinaryFolder
    
    $NanoServerSystemDriveLetter = (Invoke-Command {$env:SystemDrive} -ComputerName $NanoServerFQDN)[0]
    $AgentSubFolder = "Program Files\Microsoft Monitoring Agent\Agent"

    $InstallLocationUNC = "\\$NanoServerFQDN\$NanoServerSystemDriveLetter$\$AgentSubFolder"
    $InstallLocationAgentLocal = "$NanoServerSystemDriveLetter" + ":\" + $AgentSubFolder
    $BackupFolder = "BackupFolder_" + (Get-Date).ToString('yyMMdd_hhmmss')
    $BackupLocationUNC = "$InstallLocationUNC\$BackupFolder"
}
catch
{
	LogMessage $("Error in initialization. " + $_.Exception.Message) $ERROR
    Exit
}


# Find and expand the latest cab file if the cab is not already expanded
if($IsCabExpanded -eq $false)
{
    LogMessage "Finding the latest cab file to expand and install" $INFORMATION
    try
    {
        if((IsAnyUpdateCabPresent) -eq $false)
        {
            LogMessage "No cab found in the input folder path. Please check that the Nano agent update cab is present in the folder specified and start again." $ERROR
            Exit
        }
        
        # Get latest cab
        $latestUpdateCabName = GetLatestCabName
        LogMessage $("Latest nano agent update cab: " + $latestUpdateCabName + " . Will try expanding and installing this.") $INFORMATION
        
        # Expand cab and set the expanded folder as the source folder
        CopyAndExpandCabAndGetFolder $latestUpdateCabName
        $script:cabExpanded = 1
    }
    catch
    {
        LogMessage $("Error in expanding the cab file. " + $_.Exception.Message) $ERROR
        Exit
    }
}

# The updates should now be expanded already. Get agent versions
try
{
    $currentAgentVersion = GetAgentRegistryVersion
    $updateAgentVersion = GetUpdateAgentVersion
}
catch
{
    LogMessage $("Error getting agent versions. Check input folder has the update and retry." + $_.Exception.Message) $ERROR
    RemoveExpandedCabFolder
    Exit
}

# Check if update package is applicable for the current machine
LogMessage "Verifying update applicability" $INFORMATION
$isUpdateApplicable = IsUpdateApplicable

if($isUpdateApplicable -eq $false)
{
    $script:updateApplicable = 0
    LogMessage $("Update NOT applicable.") $ERROR
    RemoveExpandedCabFolder
    Exit
}
$script:updateApplicable = 1


# Attempt to stop the service (healthservice and ADTAgent services)
StopHealthService

# Bail out if healthservice still running
Start-Sleep -Seconds 10
$healthServiceRunning = IsHealthServiceRunning
if($healthServiceRunning -eq $true)
{
    $script:serviceStopped = 0
    LogMessage $("Unable to stop health service. Please stop service and retry.") $ERROR
    RemoveExpandedCabFolder
    Exit
}
$script:serviceStopped = 1


# Backup current binaries
LogMessage "Creating backup for agent directory and populating it with binaries" $INFORMATION
try
{   
	# Creating backup folder in agent directory
    mkdir $script:BackupLocationUNC

    # Copy all agent files to backup location (except the agent state folder)
    $srcPattern = Join-Path $InstallLocationUNC "*.*"
    Invoke-Command -ComputerName $NanoServerFQDN -ScriptBlock {Copy-Item $args[0] $args[1]} -ArgumentList $srcPattern,$BackupLocationUNC

    $srcPattern = Join-Path $InstallLocationUNC "Tools"
    Invoke-Command -ComputerName $NanoServerFQDN -ScriptBlock {Copy-Item $args[0] $args[1] -Recurse} -ArgumentList $srcPattern,$BackupLocationUNC

    $script:backupCreated = 1
}
catch
{
	$script:backupCreated = 0
	LogMessage $("Error in creating backup for agent directory." + $_.Exception.Message) $ERROR
    RecoverAndExit
}


# Replace the updated binaries
LogMessage "Replacing the new agent binaries" $INFORMATION
try
{
	$BinaryList = Get-Content $script:updateFolderExpanded\UpdateBinaryFileList.txt
    $expandTmfCab = $false
    
	# Replacing the agent directory with the new binaries
	foreach ($line in $BinaryList)
	{
        if($line.Contains("OpsMgrTraceTMF.cab"))
        {
            $expandTmfCab = $true            
        }
        if($line.Contains("MOMConnectorCounters.ini") -OR $line.Contains("HealthServiceCounters.ini"))
        {
            $script:installPerfCtrs = $true
        }
		if ($line.StartsWith("<Directory>"))
		{
			$SubDirectory = $line.Split(' ')[1]
            if ((Test-Path $InstallLocationUNC\$SubDirectory) -eq $false)
            {
			    mkdir $InstallLocationUNC\$SubDirectory
            }
		}
		else
		{
			$BinaryFile = $line.Split(' ')[0]
			$DestinationSubDirectory = $line.Split(' ')[1]
			Copy-Item $script:updateFolderExpanded\$BinaryFile $InstallLocationUNC\$DestinationSubDirectory -Force
		}
	}
    if($expandTmfCab -eq $true)
    {
        LogMessage "Expanding TMF" $INFORMATION
        $sourceTMFCab = Join-Path $InstallLocationUNC "Tools\TMF\OpsMgrTraceTMF.cab"
        $destTMF = Join-Path $InstallLocationUNC "Tools\TMF\OpsMgrTraceTMF.tmf"
	    Invoke-Command -ComputerName $NanoServerFQDN -ScriptBlock {expand.exe $args[0] -F:* $args[1]} -ArgumentList $sourceTMFCab,$destTMF
    }
    # If new resources.cab was present in the update, expand the resources as well.
    if ((Test-Path $script:updateFolderExpanded\$ResourceCabName) -eq $true)
    {
        LogMessage "Expanding Resources" $INFORMATION
        $sourceResCab = Join-Path $InstallLocationUNC $ResourceCabName
        Invoke-Command -ComputerName $NanoServerFQDN -ScriptBlock {expand.exe $args[0] -F:* $args[1]} -ArgumentList $sourceResCab,$InstallLocationUNC        
    }

    if($script:installPerfCtrs -eq $true)
    {
        InstallPerfCounters
    }

	$script:binaryReplaced = 1
}
catch
{
    $script:binaryReplaced = 0
	LogMessage $("Error replacing the new agent binaries." + $_.Exception.Message) $ERROR
    RecoverAndExit
}


# Update the agent version
try
{
    LogMessage $("Updating agent version to:" + $updateAgentVersion) $INFORMATION
    $script:agentVerUpdated = 1
    SetAgentRegistryVersion $updateAgentVersion
}
catch
{
    #agent version may be partially changed or tampered. Let the recovery take care of reverting it back
    LogMessage $("Error updating agent version" + $_.Exception.Message) $ERROR
    RecoverAndExit
}

# Attempt to start the service
try
{
    StartHealthService
    
    # Bail out if healthservice still not running
    Start-Sleep -Seconds 10
    $healthServiceStarted = IsHealthServiceRunning
    if($healthServiceStarted -eq $false)
    {
        $script:serviceStarted = 0
        LogMessage $("Unable to start health service.") $ERROR
        RecoverAndExit
    }
    $script:serviceStarted = 1
}
catch
{
    $script:serviceStarted = 0
    LogMessage $("Error starting service." + $_.Exception.Message) $ERROR
    RecoverAndExit
}

$script:installSucessfull = $true
LogMessage "Update installation successful" $INFORMATION

# Cleanup
try
{  
    RemoveBackupFolder

    # We are done, remove the state file if exists   
    if(Test-Path $script:updateStateFileName)
    {
        LogMessage "Removing state file"
        Remove-Item -Path $script:updateStateFileName  -Force
    }

    # Remove the expanded cab folder if it was created by the script
    RemoveExpandedCabFolder
}
catch
{
    $script:backupRemoved = 0
	LogMessage $("Agent installation successful but error removing backup files. You can delete the rest of backup folder\files manually." + $_.Exception.Message) $ERROR   
}

# We are done, saving the log file
$installLog | out-file -filepath $script:updateLogFileName -Force

########################end

<#
    .SYNOPSIS 
      Installs the given update for the SCOM Nano Agent if applicable. 

    .EXAMPLE
     UpdateNanoServerScomAgentOnline.ps1 -NanoServerFQDN MyNanoServerFQDN -BinaryFolder "C:\MyNanoPatch\amd64" -IsCabExpanded $false -RemoveBackup $true

	.DESCRIPTION
	 This script installs the given update for the SCOM Nano Agent RTM version on the given Nano Server machine. In case of multiple update cabs present inside NanoServer, it identifies the latest update to install.
     This script can work with both, an expanded Nano agent patch as input path and instead just the path to the .cab file(s).
     If there is no update found or a higher version of Nano agent is already installed on the Nano machine, it does not do anything and gives Update not applicable. 
     This script can run from both the management server and the nano server. This script has to be run with administrative privileges. 
     The user account which is used to run this script must also have administrative rights on the Nano Server (if running remotely). Also make sure that the SCOM powershell module is imported before running the script.

     .INPUTS
     NanoServerFQDN: The FQDN of Nano Server on which the SCOM Nano Agent is to be updated
     BinaryFolder  : Folder path to the update cab either already expanded to a folder, OR folder path to one or more nano-agent update cab(s)
	 IsCabExpanded : $true OR $false depending on the input path is to an expanded cab or only to a packed cab file(s) respectively
     RemoveBackup  : $true OR $false depending on whether to remove the backup files from the agent machine or not. $true would be the most common choice here.

    .ASSUMPTIONS
    1. Agent is installed to directory : '<systemdrive>\Program Files\Microsoft Monitoring Agent\Agent', which is same as the one used by install scripts
    2. Expects the update cab either already expanded to a folder, OR one or more nano-agent update cab(s) is\are present in the folder specified.
       Expects this folder path as input, as $BinaryFolder. 
    3. Expects a file:UpdateBinaryFileList in the UpdateFolder (should come from .cab), which lists all binaries in the update cab to be replaced alongwith destination path info. 
       Same format as the binaryfilelist file used in install script. 
    4. Expects all binaries\files in update cab to be unpacked to root of the update folder. The destination directory structure is read from the UpdateBinaryFileList.
    5. If it contains any resources.cab, expands the resources, replacing the existing resources.

#>
# SIG # Begin signature block
# MIIdtgYJKoZIhvcNAQcCoIIdpzCCHaMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUmj5qijBfzoS6f+bM2rUf5dHV
# 3gCgghhwMIIEwzCCA6ugAwIBAgITMwAAAJ1CaO4xHNdWvQAAAAAAnTANBgkqhkiG
# 9w0BAQUFADB3MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSEw
# HwYDVQQDExhNaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EwHhcNMTYwMzMwMTkyMTMw
# WhcNMTcwNjMwMTkyMTMwWjCBszELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjENMAsGA1UECxMETU9QUjEnMCUGA1UECxMebkNpcGhlciBEU0UgRVNO
# OjE0OEMtQzRCOS0yMDY2MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBT
# ZXJ2aWNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy8PvNqh/8yl1
# MrZGvO1190vNqP7QS1rpo+Hg9+f2VOf/LWTsQoG0FDOwsQKDBCyrNu5TVc4+A4Zu
# vqN+7up2ZIr3FtVQsAf1K6TJSBp2JWunjswVBu47UAfP49PDIBLoDt1Y4aXzI+9N
# JbiaTwXjos6zYDKQ+v63NO6YEyfHfOpebr79gqbNghPv1hi9thBtvHMbXwkUZRmk
# ravqvD8DKiFGmBMOg/IuN8G/MPEhdImnlkYFBdnW4P0K9RFzvrABWmH3w2GEunax
# cOAmob9xbZZR8VftrfYCNkfHTFYGnaNNgRqV1rEFt866re8uexyNjOVfmR9+JBKU
# FbA0ELMPlQIDAQABo4IBCTCCAQUwHQYDVR0OBBYEFGTqT/M8KvKECWB0BhVGDK52
# +fM6MB8GA1UdIwQYMBaAFCM0+NlSRnAK7UD7dvuzK7DDNbMPMFQGA1UdHwRNMEsw
# SaBHoEWGQ2h0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3Rz
# L01pY3Jvc29mdFRpbWVTdGFtcFBDQS5jcmwwWAYIKwYBBQUHAQEETDBKMEgGCCsG
# AQUFBzAChjxodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY3Jv
# c29mdFRpbWVTdGFtcFBDQS5jcnQwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZI
# hvcNAQEFBQADggEBAD9dHEh+Ry/aDJ1YARzBsTGeptnRBO73F/P7wF8dC7nTPNFU
# qtZhOyakS8NA/Zww74n4gvm1AWfHGjN1Ao8NiL3J6wFmmON/PEUdXA2zWFYhgeRe
# CPmATbwNN043ecHiGjWO+SeMYpvl1G4ma0NIUJau9DmTkfaMvNMK+/rNljr3MR8b
# xsSOZxx2iUiatN0ceMmIP5gS9vUpDxTZkxVsMfA5n63j18TOd4MJz+G0I62yqIvt
# Yy7GTx38SF56454wqMngiYcqM2Bjv6xu1GyHTUH7v/l21JBceIt03gmsIhlLNo8z
# Ii26X6D1sGCBEZV1YUyQC9IV2H625rVUyFZk8f4wggYHMIID76ADAgECAgphFmg0
# AAAAAAAcMA0GCSqGSIb3DQEBBQUAMF8xEzARBgoJkiaJk/IsZAEZFgNjb20xGTAX
# BgoJkiaJk/IsZAEZFgltaWNyb3NvZnQxLTArBgNVBAMTJE1pY3Jvc29mdCBSb290
# IENlcnRpZmljYXRlIEF1dGhvcml0eTAeFw0wNzA0MDMxMjUzMDlaFw0yMTA0MDMx
# MzAzMDlaMHcxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xITAf
# BgNVBAMTGE1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQTCCASIwDQYJKoZIhvcNAQEB
# BQADggEPADCCAQoCggEBAJ+hbLHf20iSKnxrLhnhveLjxZlRI1Ctzt0YTiQP7tGn
# 0UytdDAgEesH1VSVFUmUG0KSrphcMCbaAGvoe73siQcP9w4EmPCJzB/LMySHnfL0
# Zxws/HvniB3q506jocEjU8qN+kXPCdBer9CwQgSi+aZsk2fXKNxGU7CG0OUoRi4n
# rIZPVVIM5AMs+2qQkDBuh/NZMJ36ftaXs+ghl3740hPzCLdTbVK0RZCfSABKR2YR
# JylmqJfk0waBSqL5hKcRRxQJgp+E7VV4/gGaHVAIhQAQMEbtt94jRrvELVSfrx54
# QTF3zJvfO4OToWECtR0Nsfz3m7IBziJLVP/5BcPCIAsCAwEAAaOCAaswggGnMA8G
# A1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFCM0+NlSRnAK7UD7dvuzK7DDNbMPMAsG
# A1UdDwQEAwIBhjAQBgkrBgEEAYI3FQEEAwIBADCBmAYDVR0jBIGQMIGNgBQOrIJg
# QFYnl+UlE/wq4QpTlVnkpKFjpGEwXzETMBEGCgmSJomT8ixkARkWA2NvbTEZMBcG
# CgmSJomT8ixkARkWCW1pY3Jvc29mdDEtMCsGA1UEAxMkTWljcm9zb2Z0IFJvb3Qg
# Q2VydGlmaWNhdGUgQXV0aG9yaXR5ghB5rRahSqClrUxzWPQHEy5lMFAGA1UdHwRJ
# MEcwRaBDoEGGP2h0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1
# Y3RzL21pY3Jvc29mdHJvb3RjZXJ0LmNybDBUBggrBgEFBQcBAQRIMEYwRAYIKwYB
# BQUHMAKGOGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljcm9z
# b2Z0Um9vdENlcnQuY3J0MBMGA1UdJQQMMAoGCCsGAQUFBwMIMA0GCSqGSIb3DQEB
# BQUAA4ICAQAQl4rDXANENt3ptK132855UU0BsS50cVttDBOrzr57j7gu1BKijG1i
# uFcCy04gE1CZ3XpA4le7r1iaHOEdAYasu3jyi9DsOwHu4r6PCgXIjUji8FMV3U+r
# kuTnjWrVgMHmlPIGL4UD6ZEqJCJw+/b85HiZLg33B+JwvBhOnY5rCnKVuKE5nGct
# xVEO6mJcPxaYiyA/4gcaMvnMMUp2MT0rcgvI6nA9/4UKE9/CCmGO8Ne4F+tOi3/F
# NSteo7/rvH0LQnvUU3Ih7jDKu3hlXFsBFwoUDtLaFJj1PLlmWLMtL+f5hYbMUVbo
# nXCUbKw5TNT2eb+qGHpiKe+imyk0BncaYsk9Hm0fgvALxyy7z0Oz5fnsfbXjpKh0
# NbhOxXEjEiZ2CzxSjHFaRkMUvLOzsE1nyJ9C/4B5IYCeFTBm6EISXhrIniIh0EPp
# K+m79EjMLNTYMoBMJipIJF9a6lbvpt6Znco6b72BJ3QGEe52Ib+bgsEnVLaxaj2J
# oXZhtG6hE6a/qkfwEm/9ijJssv7fUciMI8lmvZ0dhxJkAj0tr1mPuOQh5bWwymO0
# eFQF1EEuUKyUsKV4q7OglnUa2ZKHE3UiLzKoCG6gW4wlv6DvhMoh1useT8ma7kng
# 9wFlb4kLfchpyOZu6qeXzjEp/w7FW1zYTRuh2Povnj8uVRZryROj/TCCBhwwggQE
# oAMCAQICEzMAAAB1jqiVpC+KZ5YAAAAAAHUwDQYJKoZIhvcNAQELBQAwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMTAeFw0xNjA1MDkyMjA2NDNaFw0xNzA4
# MDkyMjA2NDNaMIGDMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MQ0wCwYDVQQLEwRNT1BSMR4wHAYDVQQDExVNaWNyb3NvZnQgQ29ycG9yYXRpb24w
# ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCQT9vZFCAUjfz7MBFlwUfp
# ZR0A8yIksUdiG+AbJQM+pb54q0LS2Cwk3U7NUPoT4TpaLx/rI0X35vwfmQS+L0cg
# F5hzXrjbZOGZ89Dafcycy1V7LI9OGOPAYBK4HdSotajrC/iAtYNbi35DwYhdiEpa
# 6RL2/+vdfTSahzBECVeM3RkPi/DCnbqcutFYRe2QBHFmgiHvnyNDyCkTUeoijUI3
# feU4p5iaDqpIuweRF36qccaSn2W1oeVpVlSXFPGGmIfa822cIZUIdPyPZBYtT60V
# ytsZa24D2yYucaUnhpeKiZEkOkJIOikR4OWTIC6TYTDGi+Ejnm//orSmuTmbBA1Z
# AgMBAAGjggGLMIIBhzArBgNVHSUEJDAiBggrBgEFBQcDAwYKKwYBBAGCN0wIAQYK
# KwYBBAGCN0wUATAdBgNVHQ4EFgQUhOVssrNQGAQkDzIMmFIAB6fCy4IwUQYDVR0R
# BEowSKRGMEQxDTALBgNVBAsTBE1PUFIxMzAxBgNVBAUTKjU0ODIyK2NmOTU1Yzk0
# LTRlM2QtNDNhNi04M2YzLWFjMWE1ZTZjMDlhNTAfBgNVHSMEGDAWgBRIbmTlUAXT
# gqoXNzcitW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDgu
# Y3JsMGEGCCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNy
# b3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDct
# MDguY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBAG4s7itCZwil
# gYuAvw+2GGAE0woflXoUN8K/iUCBhCWmCYkn6NbvgxvZHx4yzXN3oSeT9WscuNFI
# nhN0xzHiFeznp8k/niWCss6PIioMYox0ibYqnZAi7ILJrengTUK5q87JJ2GJ2uT4
# kPt3+WYHbRIvJ/2Tztxb4tAIoUkaRZ6RXbTGvSTtK2JRydH/NUvucsdtoZArwLsu
# PndHB+6ZjjDXsLJX7YvdkQEQbcwEm4NuFiXa7krTEnAM5C1DcyIBvbiEpIIBt8Mo
# Mm4/xypZmEKRdAwtiTYqVuA/b74XAlynylJzJVzoFN6yQa+Pai2iLRWGdJNDagrZ
# rKvekxRgZOS5Ap7wCezd7zHPid1EVr2KOJBXi+nbPRCagmX0Zm8+TdUyxmmMiuEZ
# uwC9WBFyc6qHxenWy+KGOWLB7QUetCj+/ptu5TKp65DRTWXOp6ZIP9g2cqlMqxxO
# jVY/dGj286/2GjxYnQHyImE6fr4l0AbkXpS9V8iRUidLwzno/dzZABbgQMtWGDzf
# 7rOdn0E3wz3FvG7tL762Q8jZZIi3y3i928kd+cP7lcIMccgS3v4GriKb22h3ECQo
# 6r7cdlDNlVo9UN5bJxnp0RdSntjpUWhd4cx0GV4B2PDiqaGTnFAB+OL1ga3KF5mX
# MtOZqxejJNxyMaP0lIuyNquoeMDocrl6MIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAA
# AzANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0
# aG9yaXR5IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNy
# b3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOC
# Ag8AMIICCgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6
# f8MMHt03a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IK
# LMOv2akrrnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpc
# oRb0RrrgOGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAf
# TVYoonpy4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+
# /jLTswM9sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/
# jJSHvMAhdCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+
# UsS1Vz8kA/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwY
# uER8ReTBw3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W
# 7UvnSSmnEyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlM
# xdSlQy90lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEA
# AaOCAe0wggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoX
# NzcitW2oynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMC
# AYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx
# 0SOJNDBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20v
# cGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3Js
# MF4GCCsGAQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0
# MIGfBgNVHSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0
# cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRt
# MEAGCCsGAQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0
# AGEAdABlAG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou
# 09h0ZyKbC5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/
# IjWll11lhJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLp
# ZMlEPXh6I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWlu
# WpiW5IP0wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLw
# xS3OW560STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3
# dMNABQamASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a
# 8/jyFqGaJ+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7e
# ZS/sl/ahXJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiV
# H6v7RyOA9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0E
# TI7f33VtY5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmb
# dlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCBLAwggSsAgEBMIGVMH4xCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBD
# b2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAB1jqiVpC+KZ5YAAAAAAHUwCQYFKw4D
# AhoFAKCBxDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUqMNGFjYoggeYV3wlg8WY
# WiX5IecwZAYKKwYBBAGCNwIBDDFWMFSgNoA0AE0AaQBjAHIAbwBzAG8AZgB0ACAA
# TQBvAG4AaQB0AG8AcgBpAG4AZwAgAEEAZwBlAG4AdKEagBhodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEASeWCI1nNQyanojLoTAzpt37x
# wh0fl8VEN5yWW72FrBKMnOf+Prt3bGdFEy0HMHupxl2cNs4FiUkrCyNhpBc/4G2F
# 3/XbUTFUA4/sh63bp2hvSCN2A6+Q0Iy8U0g32DjoF3dEZBO8PXKprN58Dx8yvaCV
# NdWw9hlH6huh1UStINB6vm6HLIwAXIL2UOQImyNZilxbCqLPTy5CIFd1X6o+GGGJ
# TkJ+A48DQYTExpvLgEWzckKdjJjvnSKqudrTh86sqv8fszouDuM+svDMBW4v1PJP
# 8yh/NbrD9e+EZJBgiONCUlNnNs1WSg3gcsCgFNVSYPBWF/NXnNcvJzM71z5sXqGC
# AigwggIkBgkqhkiG9w0BCQYxggIVMIICEQIBATCBjjB3MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSEwHwYDVQQDExhNaWNyb3NvZnQgVGltZS1T
# dGFtcCBQQ0ECEzMAAACdQmjuMRzXVr0AAAAAAJ0wCQYFKw4DAhoFAKBdMBgGCSqG
# SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE2MDcwNjEwMjUz
# MlowIwYJKoZIhvcNAQkEMRYEFES8C0/3hBXRM8fH9rStF3bh9C2DMA0GCSqGSIb3
# DQEBBQUABIIBAFqIZAnfKjcUGMym9bMr3YwBKFDfVLASmkOs4MvTle/6Yo7Ryx5u
# ag+w137Vs1pIcZYx7an2FFB/ZrVwo/uvTxzG6P2N7nq4/p85geVL2AiU8eMbVclQ
# R5pvM0J51TqQ5g9BxJBmrWqccdDxSEjl/Lq9uUHLbWWDMmglTe92Hu5MrrYo+A1s
# wVifJjAmbvk8vPTRWlSfP2n1i3fYYEmsRwqMY+4hnWkwa/v19Wq+3ksNgeDx+ekh
# hq0iURVEOHvyZUKukVQJyfL1DX9uYAJuNDIczHTopnFNklWZ2nV3j49kTIOHsvhq
# CIBXNZZHNH/b6DYNXKYdZYgEN7MTu6frmf4=
# SIG # End signature block
