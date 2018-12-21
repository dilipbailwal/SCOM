<#  
.SYNOPSIS  
    Microsoft Corporation
    This script Updates an existing OperationsManager Web Console Environment in the OperationsManager Web Console Environments List in the SharePoint Admin farm root.
.DESCRIPTION  
    Use this script to Update an existing OperationsManager Web Console Environment to the OperationsManager Web Console Environments List.
.NOTES  
    File Name  : Update-OperationsManager-WebConsole-Environment.ps1
    Requires   : PowerShell Version 2.0  
.PARAMETER webconsoleUnc
    The optional UNC to the Operations Manager Web Console installation folder.
.PARAMETER title
    An optional specifier for the friendly name of the Environment. 
    If not specified, and the webconsoleUnc parameter is, the Title is the machine name that the web.config file was read from.
.PARAMETER hostUri
    An optional specifier for the host name that will provide the Dashboard to the SharePoint page.
    If not specified, the hostUri is http://machinename/OperationsManager where the machine name matches the machine that the web.config file was read from.
.PARAMETER targetApplicationID
    An optional specifier for specifying the targetApplicationID in the SharePoint Secure Store.
    This value creates a link between the targetApplicationID and the SharePoint Secure Store for using a single set of credentials to Authenticate against Operations Manager.
 .PARAMETER hostErrorTimeout
    An optional integer in milliseconds. 
    This is the amount of time for the Web Part to connect to the Web Console, before showing an error.
    The range of valid values is 1000 ms. to 60000 ms.
.PARAMETER encryptionKey
    An optional specifier for specifying the Override Encryption Key.
    Cannot be used when -webconsoleUnc is specified. Values are read from web.config instead.
.PARAMETER encryptionAlgorithm
    An optional specifier for specifying the Algorithm for the Override Encryption Key.
    The value used for this must be a valid algorithm.
    Cannot be used when -webconsoleUnc is specified. Values are read from web.config instead.
.PARAMETER encryptionValidationKey
    An optional specifier for specifying the Override Encryption Validation Key.
    Cannot be used when -webconsoleUnc is specified. Values are read from web.config instead.
.PARAMETER encryptionValidationAlgorithm
    An optional specifier for specifying the Validation Algorithm used Override Encryption Key.
    The value used for this must be a valid algorithm.
    Cannot be used when -webconsoleUnc is specified. Values are read from web.config instead.
.EXAMPLE  
    Update an existing OperationsManager Web Console Environment to the SharePoint server using a UNC to the source Operations Manager Web Console.
    Update-OperationsManager-WebConsole-Environment "\\machineName\c$\Program Files\System Center Operations Manager 2012\WebConsole\WebHost" [ENTER]
    
    Update an existing OperationsManager Web Console Environment to the SharePoint server using a UNC to the source Operations Manager Web Console and give it a friendly name.
    Update-OperationsManager-WebConsole-Environment -webconsoleUnc "\\machineName\c$\Program Files\System Center Operations Manager 2012\WebConsole\WebHost" -title "Operations Manager Web Console" [ENTER]
#>      
param(
 [Parameter(Position=0, Mandatory=$false, HelpMessage="A UNC path to the Operations Manager Web Console installation folder.")]
 [string]$webconsoleUnc,
 [Parameter(Position=1, Mandatory=$false, HelpMessage="The Title/Name for the Operations Manager Environment.")]
 [string]$title, 
 [ValidatePattern("(http|https)://([\w-]+\.)*[\w-]+(/[\w- ./?%&=]*)?")]
 [Parameter(Position=2, Mandatory=$false, HelpMessage="The URL to the Operations Manager Web Server Environment")]
 [string]$hostUri, 
 [Parameter(Position=3, Mandatory=$false, HelpMessage="The targetApplicationID in the SharePoint Secure Store for Shared Credentials")]
 [string]$targetApplicationID,
 [ValidateRange(1000, 60000)]
 [Parameter(Position=4, Mandatory=$false, HelpMessage="The host error timeout value in milliseconds.  This is the amount of time the Web Part will wait to connect to the Web Console. Valid Range 1000-60000")]
 [int]$hostErrorTimeout,
 [Parameter(Position=5, Mandatory=$false, HelpMessage="The Encryption key for Shared Credentials")]
 [string]$encryptionKey, 
 [Parameter(Position=6, Mandatory=$false, HelpMessage="The Encryption algorithm for Shared Credentials")]
 [string]$encryptionAlgorithm, 
 [Parameter(Position=7, Mandatory=$false, HelpMessage="The Encryption validation key for Shared Credentials")]
 [string]$encryptionValidationKey, 
 [Parameter(Position=8, Mandatory=$false, HelpMessage="The Encryption validation algorithm for Shared Credentials")]
 [string]$encryptionValidationAlgorithm
 )

# Adds the Path Char to the Solution File
function AddPathChar()
{
  param([string]$source)
  if (  $source.EndsWith("\") )
  {
  }
  else
  {
    $source = $source + "\";
  }
  return $source;
}

# Gets the Machine Name from the UNC
function GetMachineNameFromUnc()
{
   param([string]$webconsoleUnc)
   
   [int]$index = $webconsoleUnc.IndexOf("\\")
   if ( $index -ne -1 )
   {
     [string]$temp = $webconsoleUnc.Substring(2)
     $index = $temp.IndexOf("\")
     if ( $index -ne -1 )
     {
        $temp = $temp.Substring(0,$index)
        return $temp
     }
  }
  else
  {
      Write-Host -f Red "ERROR: Invalid UNC specified"
  }
  return ""
}

# Validates the CryptoAlgorithm
function ValidateCryptoAlgorithm()
{
  param([string]$algorithm)
  try
  {
    $config = [System.Security.Cryptography.CryptoConfig]::CreateFromName($algorithm)
    if ( !$config )
    {
       return $false
    }
    else
    {
      return $true
    }
  }
  catch
  {
     return $false
  }
}

#if no webconfig unc is specified, we must have title
if ( !$webconsoleUnc )
{
    if ( !$title )
    {
       Write-Host -f Red "ERROR: title when not specifying a webconsoleUnc"
       return;
    }
    # validate the encryption settings
    if ( $encryptionAlgorithm )
    {
      $valid = ValidateCryptoAlgorithm($encryptionAlgorithm)
      if ( !$valid )
      {
          Write-Host -f Red ERROR: The encryptionAlgorithm [$encryptionAlgorithm] is invalid.
          return;
      }
    }
    if ( $encryptionValidationAlgorithm )
    {
      $valid = ValidateCryptoAlgorithm($encryptionValidationAlgorithm)
      if ( !$valid )
      {
          Write-Host -f Red ERROR: The encryptionValidationAlgorithm [$encryptionValidationAlgorithm] is invalid.
          return;
      }
    }
}
else
{
  $webconsoleUnc = AddPathChar($webconsoleUnc)
  [string] $machineName = ""
  $machineName = GetMachineNameFromUnc($webconsoleUnc)
  if ($title -eq "" )
  {
    $title = $machineName
  }
  # Never execute without a valid Title
  if ( !$title)
  {
     Write-Host -f Red "ERROR: title was not set from the machineName derived from the webconsoleUnc"
     return
  }
  # validate that no encryption settings are specified
  if ( $encryptionKey -or $encryptionValidationKey -or $encryptionAlgorithm -or $encryptionValidationAlgorithm )
  {
      Write-Host ""
      Write-Host -f Red "ERROR: Can not use the encryption overrides when specifying -webconsoleUnc. The keys will be read from web.config.";
      return;
  }
}

#rem Set the Host Uri if Not Specified
if ( $webconsoleUnc -AND !$hostUri)
{
   $hostUri = "http://" + $machineName + "/OperationsManager/"
}

Write-Host ""

#if no encryption key was found
if ( $webconsoleUnc -AND !$encryptionKey )
{
  #Read the Xml File
  [string]$fileName = $webconsoleUnc + "web.config"
  $fileExists = test-path $fileName
  if ( $fileExists-ne "True" )
  {
    Write-Host -f Red ERROR: Cannot locate Web Console files in $filename
    return
  }
  # Read in the Xml File
  $xmldata = [xml](Get-Content -path $fileName)
  # Read the keys from the file.
  try
  {
    $overrideEncryptionKey = $xmldata.SelectSingleNode("//configuration/enterpriseManagement/encryption/keys/key[@name='OverrideTicketEncryptionKey']").GetAttribute("value")
    $overrideEncryptionAlg = $xmldata.SelectSingleNode("//configuration/enterpriseManagement/encryption/keys/key[@name='OverrideTicketEncryptionKey']").GetAttribute("algorithm")
    $overrideEncryptionValidationKey = $xmldata.SelectSingleNode("//configuration/enterpriseManagement/encryption/keys/key[@name='OverrideTicketEncryptionKey']/validation").GetAttribute("value")
    $overrideEncryptionValidationAlg = $xmldata.SelectSingleNode("//configuration/enterpriseManagement/encryption/keys/key[@name='OverrideTicketEncryptionKey']/validation").GetAttribute("algorithm")    
    $encryptionKey = $overrideEncryptionKey
    $encryptionAlgorithm = $overrideEncryptionAlg    
    $encryptionValidationKey = $overrideEncryptionValidationKey
    $encryptionValidationAlgorithm = $overrideEncryptionValidationAlg    
    Write-Host Got keys from $fileName
    Write-Host ""
  }
  catch
  {
      Write-Host -f Red Cannot locate Operations Manager Web Console information in $filename.
      Write-Host ""
      return;
  }
}

# Validate that we have inputs 
if ( !$hostUri -AND !$targetApplicationID -AND $hostErrorTimeout -eq 0 -AND !$encryptionKey -AND !$encryptionValidationKey -AND !$encryptionAlgorithm -AND !$encryptionValidationAlgorithm)
{
    Write-Host ""
    Write-Host -f Red "ERROR: No values specified. You must specify one of the values for an Update to occur."
    return;
}

#find the SharePoint Admin Site on this machine
[system.reflection.assembly]::LoadWithPartialName("Microsoft.SharePoint") > $null
$ca = [Microsoft.SharePoint.Administration.SPAdministrationWebApplication]::Local
$spWeb = $ca.Sites[0].OpenWeb()
Write-Host Connecting to Admin Site at: $spWeb.Url
Write-Host ""
try
{
  $spList = $spWeb.GetList("/Lists/Operations Manager Web Console Environments") 
  #build up our query
  $caml = "<Where><Eq><FieldRef Name='Title' /><Value Type='Text'>" + $title + "</Value></Eq></Where>"
  $query=new-object Microsoft.SharePoint.SPQuery
  $query.Query=$caml
  $queriedItems = $spList.GetItems($query)
  if ( $queriedItems.Count -gt 0 )
  {
    $spListItem = $queriedItems[0]
    # Set the values supplied 
    if ( $hostUri )
    {
      $spListItem["HostUri"] = $hostUri
    }
    if ( $targetApplicationID )
    {
      $spListItem["TargetApplicationID"] = $targetApplicationID
    }
    if ( $hostErrorTimeout -ne 0 )
    {
      $spListItem["HostErrorTimeout"] = $hostErrorTimeout
    }
    if ( $encryptionKey  )
    {
      $spListItem["EncryptionAlgorithmKey"] = $encryptionKey
    }
    if ( $encryptionAlgorithm)
    {
      $spListItem["EncryptionAlgorithm"] = $encryptionAlgorithm
    }
    if ( $encryptionValidationKey )
    {
      $spListItem["EncryptionValidationAlgorithmKey"] = $encryptionValidationKey
    }
    if ( $encryptionValidationAlgorithm )
    {
      $spListItem["EncryptionValidationAlgorithm"] = $encryptionValidationAlgorithm
    }
    $spListItem.Update() 
    Write-Host ""
    Write-Host -f Green SUCCESS: Updated the Operations Manager Web Console Environment named [$title] with values: 
    if ( $hostUri ) 
    {
      Write-Host -f Yellow HostUri=$hosturi
    }
    if ( $targetApplicationID )
    {
      Write-Host -f Yellow TargetApplicationID=$targetApplicationID
    }
    if ( $hostErrorTimeout -ne 0 )
    {
      Write-Host -f Yellow HostErrorTimeout=$hostErrorTimeout
    }
    if ( $encryptionKey )
    {
      Write-Host -f Yellow EncryptionAlgorithmKey=$encryptionKey
    }
    if ( $encryptionAlgorithm )
    {
      Write-Host -f Yellow EncryptionAlgorithm=$encryptionAlgorithm
    }
    if ( $encryptionValidationKey )
    {
      Write-Host -f Yellow EncryptionValidationAlgorithmKey=$encryptionValidationKey
    }
    if ( $encryptionValidationAlgorithm )
    {
      Write-Host -f Yellow EncryptionValidationAlgorithm=$encryptionValidationAlgorithm
    }
  }
  else
  {
    Write-Host -f Red ERROR: Could not locate the environment $title 
   }
}
catch
{
  Write-Host -f Red $_
  return;
}



# SIG # Begin signature block
# MIIdzQYJKoZIhvcNAQcCoIIdvjCCHboCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUinZouq+eZZ8V2jCu3gU8XM3P
# iiygghhkMIIEwzCCA6ugAwIBAgITMwAAAJzu/hRVqV01UAAAAAAAnDANBgkqhkiG
# 9w0BAQUFADB3MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSEw
# HwYDVQQDExhNaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EwHhcNMTYwMzMwMTkyMTMw
# WhcNMTcwNjMwMTkyMTMwWjCBszELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjENMAsGA1UECxMETU9QUjEnMCUGA1UECxMebkNpcGhlciBEU0UgRVNO
# OjU4NDctRjc2MS00RjcwMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBT
# ZXJ2aWNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzCWGyX6IegSP
# ++SVT16lMsBpvrGtTUZZ0+2uLReVdcIwd3bT3UQH3dR9/wYxrSxJ/vzq0xTU3jz4
# zbfSbJKIPYuHCpM4f5a2tzu/nnkDrh+0eAHdNzsu7K96u4mJZTuIYjXlUTt3rilc
# LCYVmzgr0xu9s8G0Eq67vqDyuXuMbanyjuUSP9/bOHNm3FVbRdOcsKDbLfjOJxyf
# iJ67vyfbEc96bBVulRm/6FNvX57B6PN4wzCJRE0zihAsp0dEOoNxxpZ05T6JBuGB
# SyGFbN2aXCetF9s+9LR7OKPXMATgae+My0bFEsDy3sJ8z8nUVbuS2805OEV2+plV
# EVhsxCyJiQIDAQABo4IBCTCCAQUwHQYDVR0OBBYEFD1fOIkoA1OIvleYxmn+9gVc
# lksuMB8GA1UdIwQYMBaAFCM0+NlSRnAK7UD7dvuzK7DDNbMPMFQGA1UdHwRNMEsw
# SaBHoEWGQ2h0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3Rz
# L01pY3Jvc29mdFRpbWVTdGFtcFBDQS5jcmwwWAYIKwYBBQUHAQEETDBKMEgGCCsG
# AQUFBzAChjxodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY3Jv
# c29mdFRpbWVTdGFtcFBDQS5jcnQwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZI
# hvcNAQEFBQADggEBAFb2avJYCtNDBNG3nxss1ZqZEsphEErtXj+MVS/RHeO3TbsT
# CBRhr8sRayldNpxO7Dp95B/86/rwFG6S0ODh4svuwwEWX6hK4rvitPj6tUYO3dkv
# iWKRofIuh+JsWeXEIdr3z3cG/AhCurw47JP6PaXl/u16xqLa+uFLuSs7ct7sf4Og
# kz5u9lz3/0r5bJUWkepj3Beo0tMFfSuqXX2RZ3PDdY0fOS6LzqDybDVPh7PTtOwk
# QeorOkQC//yPm8gmyv6H4enX1R1RwM+0TGJdckqghwsUtjFMtnZrEvDG4VLA6rDO
# lI08byxadhQa6k9MFsTfubxQ4cLbGbuIWH5d6O4wggYHMIID76ADAgECAgphFmg0
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
# 9wFlb4kLfchpyOZu6qeXzjEp/w7FW1zYTRuh2Povnj8uVRZryROj/TCCBhAwggP4
# oAMCAQICEzMAAABkR4SUhttBGTgAAAAAAGQwDQYJKoZIhvcNAQELBQAwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMTAeFw0xNTEwMjgyMDMxNDZaFw0xNzAx
# MjgyMDMxNDZaMIGDMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MQ0wCwYDVQQLEwRNT1BSMR4wHAYDVQQDExVNaWNyb3NvZnQgQ29ycG9yYXRpb24w
# ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCTLtrY5j6Y2RsPZF9NqFhN
# FDv3eoT8PBExOu+JwkotQaVIXd0Snu+rZig01X0qVXtMTYrywPGy01IVi7azCLiL
# UAvdf/tqCaDcZwTE8d+8dRggQL54LJlW3e71Lt0+QvlaHzCuARSKsIK1UaDibWX+
# 9xgKjTBtTTqnxfM2Le5fLKCSALEcTOLL9/8kJX/Xj8Ddl27Oshe2xxxEpyTKfoHm
# 5jG5FtldPtFo7r7NSNCGLK7cDiHBwIrD7huTWRP2xjuAchiIU/urvzA+oHe9Uoi/
# etjosJOtoRuM1H6mEFAQvuHIHGT6hy77xEdmFsCEezavX7qFRGwCDy3gsA4boj4l
# AgMBAAGjggF/MIIBezAfBgNVHSUEGDAWBggrBgEFBQcDAwYKKwYBBAGCN0wIATAd
# BgNVHQ4EFgQUWFZxBPC9uzP1g2jM54BG91ev0iIwUQYDVR0RBEowSKRGMEQxDTAL
# BgNVBAsTBE1PUFIxMzAxBgNVBAUTKjMxNjQyKzQ5ZThjM2YzLTIzNTktNDdmNi1h
# M2JlLTZjOGM0NzUxYzRiNjAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzcitW2oynUC
# lTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtp
# b3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEGCCsGAQUF
# BwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0MAwGA1Ud
# EwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBAIjiDGRDHd1crow7hSS1nUDWvWas
# W1c12fToOsBFmRBN27SQ5Mt2UYEJ8LOTTfT1EuS9SCcUqm8t12uD1ManefzTJRtG
# ynYCiDKuUFT6A/mCAcWLs2MYSmPlsf4UOwzD0/KAuDwl6WCy8FW53DVKBS3rbmdj
# vDW+vCT5wN3nxO8DIlAUBbXMn7TJKAH2W7a/CDQ0p607Ivt3F7cqhEtrO1Rypehh
# bkKQj4y/ebwc56qWHJ8VNjE8HlhfJAk8pAliHzML1v3QlctPutozuZD3jKAO4WaV
# qJn5BJRHddW6l0SeCuZmBQHmNfXcz4+XZW/s88VTfGWjdSGPXC26k0LzV6mjEaEn
# S1G4t0RqMP90JnTEieJ6xFcIpILgcIvcEydLBVe0iiP9AXKYVjAPn6wBm69FKCQr
# IPWsMDsw9wQjaL8GHk4wCj0CmnixHQanTj2hKRc2G9GL9q7tAbo0kFNIFs0EYkbx
# Cn7lBOEqhBSTyaPS6CvjJZGwD0lNuapXDu72y4Hk4pgExQ3iEv/Ij5oVWwT8okie
# +fFLNcnVgeRrjkANgwoAyX58t0iqbefHqsg3RGSgMBu9MABcZ6FQKwih3Tj0DVPc
# gnJQle3c6xN3dZpuEgFcgJh/EyDXSdppZzJR4+Bbf5XA/Rcsq7g7X7xl4bJoNKLf
# cafOabJhpxfcFOowMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkqhkiG9w0B
# AQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAG
# A1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTEw
# HhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
# q/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03a8YS2Avw
# OMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akrrnoJr9eW
# WcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0RrrgOGSsbmQ1
# eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy4BI6t0le
# 2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9sbKvkjh+
# 0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAhdCVfGCi2
# zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8kA/DRelsv
# 1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTBw3J64HLn
# JN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmnEyimp31n
# gOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90lfdu+Hgg
# WCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0wggHpMBAG
# CSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2oynUClTAZ
# BgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/
# BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBaBgNVHR8E
# UzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9k
# dWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsGAQUFBwEB
# BFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9j
# ZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNVHSAEgZcw
# gZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNy
# b3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsGAQUFBwIC
# MDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABlAG0AZQBu
# AHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKbC5YR4WOS
# mUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11lhJB9i0ZQ
# VdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6I/MTfaaQ
# dION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0wI/zRive
# /DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560STkKxgrC
# xq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQamASooPoI/
# E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGaJ+HNpZfQ
# 7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ahXJbYANah
# Rr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA9Z74v2u3
# S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33VtY5E90Z1W
# Tk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr/Xmfwb1t
# bWrJUnMTDXpQzTGCBNMwggTPAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcg
# UENBIDIwMTECEzMAAABkR4SUhttBGTgAAAAAAGQwCQYFKw4DAhoFAKCB5zAZBgkq
# hkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGC
# NwIBFTAjBgkqhkiG9w0BCQQxFgQUe/+wBJe6C6Gma/ayCmgrZdNKA84wgYYGCisG
# AQQBgjcCAQwxeDB2oFiAVgBTAHkAcwB0AGUAbQAgAEMAZQBuAHQAZQByACAAMgAw
# ADEANgAgAFIAVABNACAALQAgAE8AcABlAHIAYQB0AGkAbwBuAHMAIABNAGEAbgBh
# AGcAZQByoRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTANBgkqhkiG9w0BAQEF
# AASCAQCJDUVcgBnEJeANdw2xOvyj73Btae6ZldQJApnN12E1Q91EtVdC32JGxYt8
# kHs+M7rgAW/H0iiB1hBKU/0Ot7Nn2hMJDuCe1LOTpkFvju5/CPAiF57i/OIrVqAW
# bMFBE6pEzVuKn6uA77BsB8RzU4e6WkoRGlVUJHShqxlus8gt/R+w0MnwiqqL47+u
# egf+huQn29aHHwbYKWk25ugLwKzb5+ui64es+PR0mg0zKhdRcUoP+ffijbFUjfgj
# kNCc9xJnchFVnyHgvao+lKd61dc3VOzqyIPRoXZb7oTmopPhA9XEQAFR0SE4HPaC
# E1zRnq/QnILvW6VDEeBlfFpJ7gifoYICKDCCAiQGCSqGSIb3DQEJBjGCAhUwggIR
# AgEBMIGOMHcxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xITAf
# BgNVBAMTGE1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQQITMwAAAJzu/hRVqV01UAAA
# AAAAnDAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
# hkiG9w0BCQUxDxcNMTYwNzI3MTMwODA2WjAjBgkqhkiG9w0BCQQxFgQUT9pnYLIe
# K6DqETr/ehCU7kc0PWowDQYJKoZIhvcNAQEFBQAEggEASp9j/N0yTzHErYOQRUGd
# 2D0m9s3StkLwk+Kd6DkNRiYB/ABxOX5EmReVwRYtGRZxbfS+PgRKfEkXn0YA3pd3
# yVcc3bz17dObA3jBaDYjKr06zTv6r1z7ecICJrh7o3NqTVlQnMGVV6z6xZdvgXgg
# n3QVeJG5DzfVQZvhucuPzAqxCi1hm8/cWrBWvtfWcVjBGjrmkBErEOUfVjh76JBw
# mBWSQVJ6N1nSTOJnQp3Q748faALNPVjzG69SVCkOUtrrPlLeSNbjbtf88JVDnJc2
# 9wtDXnFoUIwiCNIU2tsy8eYiRzXupoLqfTIX8hMxtJF2AdYMP/VHKBUjQMRyYBzx
# PQ==
# SIG # End signature block
