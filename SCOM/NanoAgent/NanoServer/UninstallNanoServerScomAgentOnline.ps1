param (
[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [string]$ManagementServerFQDN, 
[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [string]$ManagementGroupName,
[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [string]$NanoServerFQDN,
[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [bool]$RemoveFromManagementServer
)

#region Logging variables
# Registry File Names
$UninstallRegistryFile = "UninstallVariableRegistryEntry.reg"
$StaticRegistryFile = ".\StaticRegistryEntry.reg"
$VariableRegistryFile = ".\VariableRegistryEntry.reg"

# Logging variables
$ERROR = 1
$INFORMATION = 2
$NanoServer = $NanoServerFQDN.Split(".")[0]
$UninstallLogFileName = $env:TEMP + "\UninstallLog"+$NanoServer+".txt"
$UninstallStateFileName = $env:TEMP + "\UninstallState"+$NanoServer+".txt"
# Logging the progress of the uninstall
$uninstallLog = New-Object System.Collections.ArrayList($null)

#State variables. Basically there are going to be 6 states during uninstallation:
#1. Removing the agent from the management server
#2. Stopping and deleting the HealthService
#3. Killing any running MonitoringHost(s)
#4. Unloading the performance counters
#5. Removing the registry changes
#6. Removing the MMA folder
$agentUninstalled = 0
$healthServiceDeleted = 0
$monitoringHostsDeleted = 0
$foldersDeleted = 0
$perfCountersUninstalled = 0
$registryRemoved = 0

# Basic strings that would be stored in the uninstall state file in case of failure so that the uninstallation
# can resume from where it left
$agentUninstalledSegmentName = "AgentUninstalled"
$healthServiceDeletedSegmentName = "HealthServiceDeleted"
$monitoringHostsDeletedSegmentName = "MonitoringHostsKilled"
$foldersDeletedSegmentName = "FoldersDeleted"
$perfCountersUninstalledSegmentName = "PerformanceCountersUninstalled"
$registryRemovedSegmentName = "RegistryRemoved"

#endregion

#region Helper Methods

# Saves the state of the installation so that we resume from here in case of retry
function StoreUnInstallationState
{
	$stateContent = New-Object System.Collections.ArrayList($null)
    [void]$stateContent.Add("Please do not delete this file. This file is used by the uninstaller to know about the state of the previous uninstallation. This file would be removed automatically once uninstall is successfull.")
    if($script:agentUninstalled -eq 1)
    {
        [void]$stateContent.Add($($script:agentUninstalledSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:agentUninstalledSegmentName + ":0"))
    }
    if($script:healthServiceDeleted -eq 1)
    {
        [void]$stateContent.Add($($script:healthServiceDeletedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:healthServiceDeletedSegmentName + ":0"))
    }
    if($script:monitoringHostsDeleted -eq 1)
    {
        [void]$stateContent.Add($($script:monitoringHostsDeletedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:monitoringHostsDeletedSegmentName + ":0"))
    }
    if($script:foldersDeleted -eq 1)
    {
        [void]$stateContent.Add($($script:foldersDeletedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:foldersDeletedSegmentName + ":0"))
    }
    if($script:perfCountersUninstalled -eq 1)
    {
        [void]$stateContent.Add($($script:perfCountersUninstalledSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:perfCountersUninstalledSegmentName + ":0"))
    }
    if($script:registryRemoved -eq 1)
    {
        [void]$stateContent.Add($($script:registryRemovedSegmentName + ":1"))
    }
    else
    {
        [void]$stateContent.Add($($script:registryRemovedSegmentName + ":0"))
    }
    $stateContent | out-file -filepath $script:UninstallStateFileName -Force -ErrorAction SilentlyContinue
}

# Sets the variable value as read from the current file line
function SetStateVariable($segment)
{
    $segmentName = $segment.Split(':')[0]
    $segmentValue = $segment.Split(':')[1]

    if($segmentName -eq $script:agentUninstalledSegmentName)
    {
		$script:agentUninstalled = $segmentValue
		return
    }
    if($segmentName -eq $script:healthServiceDeletedSegmentName)
    {
		$script:healthServiceDeleted = $segmentValue
		return 
    }
    if($segmentName -eq $script:monitoringHostsDeletedSegmentName)
    {
		$script:monitoringHostsDeleted = $segmentValue
		return
    }
    if($segmentName -eq $script:foldersDeletedSegmentName)
    {
		$script:foldersDeleted = $segmentValue
		return
    }
    if($segmentName -eq $script:perfCountersUninstalledSegmentName)
    {
		$script:perfCountersUninstalled = $segmentValue
		return
    }
    if($segmentName -eq $script:registryRemovedSegmentName)
    {
		$script:registryRemoved = $segmentValue
		return
    }
}

# Gets the state the installation was left in previously
function GetPreviousUninstallationState()
{
    $uninstallStateFileContents = (Get-Content $script:UninstallStateFileName)
    for($i = 0; $i -lt $uninstallStateFileContents.Length; $i++)
    {
        $segment = [string]$uninstallStateFileContents[$i]
        SetStateVariable $segment
    }
}


# Simple method used to log the progress of the installation
function LogMessage([string]$message, [int]$logLevel)
{
	$levelText = ""
	if($logLevel -eq $ERROR)
	{
		$levelText = "[ERROR]"
		Write-Error "There were errors during uninstallation. Please refer to the UninstallLog.txt for more details."
	}
	else
	{
		$levelText = "[INFO]"
	}
    Write-Host $message
	[void]$script:uninstallLog.Add((Get-Date).ToString() + ":" + $levelText + ":" + $message)
	if($logLevel -eq $ERROR)
	{
        #There was an error. Write it down and quit as there is no point in continuing
		$script:uninstallLog | out-file -filepath $script:UninstallLogFileName -Force -ErrorAction SilentlyContinue

        #This method is used so that we know where to resume the uninstallation from the next time
        StoreUnInstallationState
	}
}

# Checks to see if the uninstallation is a retry
function IsUninstallRetried()
{
    # If it is a retry
    if ((Test-Path $script:UninstallStateFileName) -eq $true)
    {
        return $true
    }
    return $false
}

#endregion


try
{
    # Init some common variables: Agent installation variables
    $NanoServerSystemDriveLetter = (Invoke-Command {$env:SystemDrive} -ComputerName $NanoServerFQDN -ErrorAction Stop)[0]
    $InstallLocation = "\\$NanoServerFQDN\$NanoServerSystemDriveLetter$\Program Files\Microsoft Monitoring Agent"

    try
    {
        LogMessage "Setting firewall rule" $INFORMATION
        # Used to open firewalls. 
        $openfirewallscript = {
            netsh.exe advf firewall set rule group="Remote Event Log Management" new enable=yes
        }
        Invoke-Command -ScriptBlock $openfirewallscript -ComputerName $NanoServerFQDN -ErrorAction Stop
    }
    catch
    {
        LogMessage $("There was an error opening the firewall port. " + $_.Exception.Message) $ERROR
    }

    # Check if it's a retry
    $uninstallRetried = IsUninstallRetried

    if($uninstallRetried -eq $true)
    {
        #Read the variables
        GetPreviousUninstallationState
    }

	#This is already taken care of by SCOM server. So in case of push uninstall we are skipping this.
	if($RemoveFromManagementServer)
	{	
		# Uninstalling agent from SCOM
		LogMessage "Removing the agent from the server " $INFORMATION
		try
		{
			if($script:agentUninstalled -eq 0)
			{
				$agent = Get-SCOMAgent -DNSHostName $NanoServerFQDN -ErrorAction Stop
				Uninstall-SCOMAgent -Agent $agent -ErrorAction Stop
				$script:agentUninstalled = 1
			}
		}
		catch
		{
			$script:agentUninstalled -eq 0
			LogMessage $("Removing the agent from the management server failed: " + $_.Exception.Message) $ERROR
            Exit
		}
	}

	# Stop and remove the HealthService for the Nano Server and kill any running monitoring host(s)		
    try
    {
		if($script:healthServiceDeleted -eq 0)
		{
			# Stopping the healthservice. 
			$service = Get-Service HealthService -ComputerName $NanoServerFQDN -ErrorAction Stop
			if($service -ne $null)
			{
				# Stop the HealthService
				if ($service.Status -ne "Stopped")
				{
					LogMessage "Stopping the HealthService on the Nano Server " $INFORMATION
					$service.Stop()
                    if($error.Count > 0)
                    {
                        Throw "There was an error trying to stop the HealthService on the Nano Server. " + $ERROR.ToString()
                    }
				}

				LogMessage "Deleting the HealthService from the Nano Server " $INFORMATION
			
				# Delete the HealthService
				$deleteservicescript = {
					sc.exe delete HealthService
				}
				Invoke-Command -ScriptBlock $deleteservicescript -ComputerName $NanoServerFQDN -ErrorAction Stop
				$script:healthServiceDeleted = 1
			}

			# Stopping the AdtAgent. 
			$service = Get-Service AdtAgent -ComputerName $NanoServerFQDN -ErrorAction Stop
			if($service -ne $null)
			{
				# Stop the AdtAgent
				if ($service.Status -ne "Stopped")
				{
					LogMessage "Stopping the AdtAgent on the Nano Server " $INFORMATION
					$service.Stop()
                    if($error.Count > 0)
                    {
                        Throw "There was an error trying to stop the AdtAgent on the Nano Server. " + $ERROR.ToString()
                    }
				}

				LogMessage "Deleting the AdtAgent from the Nano Server " $INFORMATION
			
				# Delete the AdtAgent
				$deleteAdtAgentservicescript = {
					sc.exe delete AdtAgent
				}
				Invoke-Command -ScriptBlock $deleteAdtAgentservicescript -ComputerName $NanoServerFQDN -ErrorAction Stop
			}
			else
			{
				$script:healthServiceDeleted = 1
				LogMessage "HealthService was not found on the Nano Server. Assuming that previous uninstall didn't complete. " $INFORMATION
			}
        }
    }
    catch
    {
        $script:healthServiceDeleted = 0
        LogMessage $("Unable to delete HealthService on Nano Server: " + $_.Exception.Message) $ERROR
        Exit
    }

    try
    {
        if($script:monitoringHostsDeleted -eq 0)
        {
            LogMessage "Deleting any running monitoring host(s) " $INFORMATION
    
            #Fetch the MonitoringHost(s).exe
            $monitoringHostProcesses = Get-Process -Name MonitoringHost -ComputerName $NanoServerFQDN -ErrorAction SilentlyContinue

            foreach($monitoringHostProcess in $monitoringHostProcesses)
            {
                # Delete any running MonitoringHost(s)
	    		$killMonitoringHostScript = {
    				kill $monitoringHostProcess -Force 
			    }
			    #Just to suppress the warning
			    Invoke-Command -ScriptBlock $killMonitoringHostScript -ComputerName $NanoServerFQDN -ErrorAction SilentlyContinue 
            }                  
            
            $script:monitoringHostsDeleted = 1
        }
    }
    catch
    {
        $script:monitoringHostsDeleted = 0
		LogMessage $("Unable to kill the running MonitoringHost(s) on the Nano Server: " + $_.Exception.Message) $ERROR
		Exit
    }
	
    # Unloading the performance counters
    try
    {
        if($perfCountersUninstalled -eq 0)
		{
            LogMessage "Unloading the performance counters " $INFORMATION
            $uninstallAgentPerformanceCounters = {
			    unlodctr MOMConnector
		    }
		    Invoke-Command -ScriptBlock $uninstallAgentPerformanceCounters -ComputerName $NanoServerFQDN -ErrorAction SilentlyContinue


		    $uninstallHealthServicePerformanceCounters = {
			    unlodctr HealthService
		    }
		    Invoke-Command -ScriptBlock $uninstallHealthServicePerformanceCounters -ComputerName $NanoServerFQDN -ErrorAction SilentlyContinue
            $perfCountersUninstalled = 1
        }
    }
    catch
    {
        $perfCountersUninstalled = 0
        $uninstallLog = LogMessage $uninstallLog "Unable to uninstall the performance counters.`r`n" $ERROR
        return
    }

	# Removing the registry entries
    try
    {
        if($script:registryRemoved -eq 0)
		{
            $SubKeyName = "SYSTEM\CurrentControlSet\Services\HealthService\Parameters\Management Groups\$ManagementGroupName"

			# In case of push uninstall the SCOM server gives us a dummy name for the management server instead of the correct name
			# Also we know that this code is running in the management server so we fetch the FQDN of the local machine.
			if(-not($RemoveFromManagementServer)){
				$ManagementServerFQDN = (Get-WmiObject win32_computersystem).DNSHostName+"."+(Get-WmiObject win32_computersystem).Domain
			}

            $ManagementServerId = Invoke-CimMethod -ComputerName $ManagementServerFQDN -ClassName StdRegProv -MethodName GetStringValue -Arguments @{sSubKeyName=$SubKeyName;sValueName="ID"} -ErrorAction Stop
            $VariableRegistry = Get-Content $script:VariableRegistryFile
            $VariableRegistry = $VariableRegistry -replace "{ManagementGroupName}", $script:ManagementGroupName
            $VariableRegistry = $VariableRegistry -replace "{ManagementServerFQDN}", $script:ManagementServerFQDN
            $VariableRegistry = $VariableRegistry -replace "{ManagementServerID}", $ManagementServerId.sValue
            $VariableRegistry |  out-file -filepath $script:UninstallRegistryFile -Force 
			
            LogMessage "Deleting the registry entries" $INFORMATION
            $registryEntries = New-Object System.Collections.ArrayList($null)
			$registryEntries.Add("Windows Registry Editor Version 5.00")
            $registryEntries.Add("")	   
			(Get-Content $script:UninstallRegistryFile) | Foreach-Object {if($_ -match '\[HKEY_'){[void]$registryEntries.Add($_)}}
		    (Get-Content $script:StaticRegistryFile) | Foreach-Object {if($_ -match '\[HKEY_'){[void]$registryEntries.Add($_)}}
            
		    for($i=0; $i -lt $registryEntries.Count; $i++)
		    {
				#Adding the - sign so that reg import will uninstall the same
				$registryEntries[$i] = $registryEntries[$i].Replace('[HKEY_', '[-HKEY_')
		    }
            # Write all keys to the uninstall reg file
            $registryEntries | out-file -FilePath $script:UninstallRegistryFile -Force

			# Copy this file to the Nano Server
			Copy-Item $script:UninstallRegistryFile $script:InstallLocation\Agent\$script:UninstallRegistryFile -Force

            $removeRegistryScript = {
				$InstallLocationOnNano = "$env:SystemDrive\Program Files\Microsoft Monitoring Agent\Agent"
                reg import $InstallLocationOnNano\UninstallVariableRegistryEntry.reg
            }

            Invoke-Command -ScriptBlock $removeRegistryScript -ComputerName $NanoServerFQDN -ErrorAction Stop

            # We are done, remove the temp uninstal registry file that was created
            Remove-Item -Path $script:UninstallRegistryFile  -Force
            $script:registryRemoved = 1
        }
    }
	# This is a known issue and also comes up in the install script. Would correct it for both the places together
    catch [System.Management.Automation.RemoteException]
    {
        $script:registryRemoved = 1
        # We are done, remove the temp uninstal registry file that was created
        Remove-Item -Path $script:UninstallRegistryFile  -Force       
    }
    catch
    {
        $script:registryRemoved = 0
        LogMessage $("Unable to remove registry changes done by the SCOM agent on Nano Server: " + $_.Exception.Message) $INFORMATION
        LogMessage "Will still continue with rest of the uninstallation." $INFORMATION	
    }

	LogMessage "Removing Agent folders on the Nano Server " $INFORMATION
	# Remove folders
    try
    {
        $RetryCount = 10
        while(($script:foldersDeleted -eq 0) -and ($RetryCount -ge 0))
		{
            $RetryCount -= 1
            try
            {
		        if ((Test-Path $script:InstallLocation) -eq $true)
		        {
                    Invoke-Command -ComputerName $NanoServerFQDN -ScriptBlock {Remove-Item $args[0] -Force -Recurse -ErrorAction Stop} -ArgumentList $script:InstallLocation
			    
                    # Bail out if Agent install folder still exists
                    Start-Sleep -Seconds 10
			        if ((Test-Path $script:InstallLocation) -eq $true)
			        {
				        LogMessage "Unable to delete the agent directory. " $INFORMATION
					    throw "Unable to delete the agent directory."
			        }
                    $script:foldersDeleted = 1
		        }
                else
                {
                    $script:foldersDeleted = 1
                    LogMessage "Unable to locate agent folder on the Nano Server. " $INFORMATION
                    break
                }
            }
            catch
            {
                $script:foldersDeleted = 0;
                LogMessage $("Unable to remove the agent directory. Full exception: " + $_.Exception.Message) $INFORMATION
                if ($RetryCount -ge 0)
                {
                    LogMessage $("Retrying folder delete after 10 sec") $INFORMATION
                    Start-Sleep -Seconds 10
                    continue
                }
		        throw $_.Exception
            }
        }
    }
    catch
    {
        $script:foldersDeleted = 0;
        LogMessage $("Unable to remove the agent directory. Try restarting the Nano Server and then re-run this script. Full exception: " + $_.Exception.Message) $ERROR
		Exit
    }

	LogMessage "Successfully un-installed the agent from Nano Server" $INFORMATION
	    
    # Delete uninstall state file if it exists
    if(Test-Path $script:UninstallStateFileName)
    {
        LogMessage "Removing uninstall state file"
        Remove-Item -Path $script:UninstallStateFileName  -Force
    }

    # We are done, saving the log file and remove the uninstall state file if exists
	$uninstallLog | out-file -filepath $script:UninstallLogFileName -Force
    
}
catch
{
    # Ideally the uninstaller should not come here. 
	LogMessage $_.Exception.Message $ERROR
	$uninstallLog | out-file -filepath $script:UninstallLogFileName -Force
}


<#
    .SYNOPSIS 
      Uninstalls the SCOM Nano Agent from the Nano Server and unregisters it from the Management Server

    .EXAMPLE
     UninstallNanoServerSCOMAgentOnline.ps1 -ManagementServerFQDN MySCOMManagementServerName -ManagementGroupName MySCOMManagementGroupName -NanoServerFQDN MyNanoServerFQDN -RemoveFromManagementServer $true

	.DESCRIPTION
	 This script uninstalls the SCOM Nano Agent from the given Nano Server machine. This script can run only from the management server
	 and should be run with administrative privileges. The user account which is used to run this script must also have administrative rights on the
	 Nano Server. Also make sure that the SCOM powershell module is imported before running the script.
     RemoveFromManagementServer: Set to false if you do not want\need to remove the Agent from the Management server

	 NOTE: If there are any issues while uninstallation, try restarting the Nano Server and re-runing the script.
	 
#>


# SIG # Begin signature block
# MIIdtgYJKoZIhvcNAQcCoIIdpzCCHaMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUNOYmQgOPqYW+jDK8rSRoA6iG
# H2OgghhwMIIEwzCCA6ugAwIBAgITMwAAAJgEWMt/IwmwngAAAAAAmDANBgkqhkiG
# 9w0BAQUFADB3MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSEw
# HwYDVQQDExhNaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EwHhcNMTYwMzMwMTkyMTI3
# WhcNMTcwNjMwMTkyMTI3WjCBszELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjENMAsGA1UECxMETU9QUjEnMCUGA1UECxMebkNpcGhlciBEU0UgRVNO
# OjdBRkEtRTQxQy1FMTQyMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBT
# ZXJ2aWNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1jclqAQB7jVZ
# CvOuH5jFixrRTGFtwMHws1sEZaA3ciobVIdWIejc5fBu3XdwRLfxjsmyou3JeTaa
# 8lqA929q2AyZ9A3ZBfxf8VqTxbu06wBj4o4g5YCsz0C/81N2ESsQZbjDxbW5sKzD
# hhT0nTzr82aepe1drjT5dvyU/AvEkCzaEDU0dZTq2Bm6NIif11GzA+OkD0bdZG+u
# 4EJRylQ4ijStGgXUpAapb0y2RtlAYvZSpLYzeFFcA/yRXacCnoD++h9r66he/Scv
# Gfd/J/5hPRCtgsbNr3vFJzBWgV9zVqmWOvZBPGpLhCLglTh0stPa/ZxZjTS/nKJL
# a7MZId131QIDAQABo4IBCTCCAQUwHQYDVR0OBBYEFPPCI5/SvSWNvaj1nBvoSHO7
# 6ZPBMB8GA1UdIwQYMBaAFCM0+NlSRnAK7UD7dvuzK7DDNbMPMFQGA1UdHwRNMEsw
# SaBHoEWGQ2h0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3Rz
# L01pY3Jvc29mdFRpbWVTdGFtcFBDQS5jcmwwWAYIKwYBBQUHAQEETDBKMEgGCCsG
# AQUFBzAChjxodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY3Jv
# c29mdFRpbWVTdGFtcFBDQS5jcnQwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZI
# hvcNAQEFBQADggEBAD+xPVIhFl30XEe39rlgUqCCr2fXR9o0aL0Oioap6LAUMXLK
# 4B+/L2c+BgV32joU6vMChTaA+7XEw7pXCRN+uD8ul4ifHrdAOEEqOTBD7N5203u2
# LN667/WY71purP2ezNB1y+YAgjawEt6VjjQcSGZ9bTPRtS2JPS5BS868paym355u
# 16HMxwmhlv1klX6nfVOs1DYK5cZUrPAblCZEWzGab8j9d2ZIGLQmTEmStdslOq79
# vujEI0nqDnJBusUGi28Kh3Hz1QIHM5UZg/F5sWgt0EobFGHmk4KH2vreGZArtCIB
# amDc5cIJ48na9GfA2jqJLWsbvNcwC486g5cauwkwggYHMIID76ADAgECAgphFmg0
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU11XiaexVdNEI5N5VWiV7
# g1AafsswZAYKKwYBBAGCNwIBDDFWMFSgNoA0AE0AaQBjAHIAbwBzAG8AZgB0ACAA
# TQBvAG4AaQB0AG8AcgBpAG4AZwAgAEEAZwBlAG4AdKEagBhodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAcdO7RNCqYLPW7Oze9At6Otdr
# 1i0baRnAACgh8fmKsPdop0HQax/ST14IrfDfYHOzB0x5MlGqa0gBTVDDzs8/f71N
# Iz/hFgUdmepQdXf3WIlpoEFaM3Qg4SG7XoG/XF1L0eAjv4B3aT5oljmiiTkSenLE
# lPe5bbn3aWPkxthcCzE3GddLfI72e2Ri0xkCN8VUcOMY55GTmO56VllAUWtLgD7Z
# k7IIzMt8uYKLJNuyVx3RNTE8ycyAPIZo3FcV7jnh71bZ28eF6k+sn7adWOXEBULz
# Ls7jM79egKzf5CfzHM0CD0hih2p9d0sf29YJn14UR0t9O5LD/uxy7eAQ53ampKGC
# AigwggIkBgkqhkiG9w0BCQYxggIVMIICEQIBATCBjjB3MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSEwHwYDVQQDExhNaWNyb3NvZnQgVGltZS1T
# dGFtcCBQQ0ECEzMAAACYBFjLfyMJsJ4AAAAAAJgwCQYFKw4DAhoFAKBdMBgGCSqG
# SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE2MDcwNjEwMjUz
# MlowIwYJKoZIhvcNAQkEMRYEFHRvl4nV7r1W/hBT6kxieLKyVEHvMA0GCSqGSIb3
# DQEBBQUABIIBAEZqgMNu5wuFxw9PmUnrc0HGtLAeFFPH2M7qMeoUeRO9xpXIbgZh
# Oa098Nfm4nUk3AEna4bbB8N8PB6ciJRyaIiThcTOGCucOEV5myR4VPsUO95XMTMb
# cgBjFnEB7S0hECW6qjcQYD8sgO91CKMjhTQPt7gDqy2HyQEWtCsQHjx2e/6M/WAP
# p99YCd0RWGpFURR1RReqY2e4tFMyJPj6T52axlANywiUmo1Zn2AfHws6VWkgnUTU
# iskGPefRqqhC5/xn3m2wMldTU+01KOBxOAMzQ745Knk8gMM3G9IUC4P7b7gdA0uH
# +lnnGQo3sj1YkYd0ucep+lko4j/M9sve2R4=
# SIG # End signature block
