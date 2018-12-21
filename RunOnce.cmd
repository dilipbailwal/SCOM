@ECHO OFF
setlocal

set ERRORNUM=0

if {%1} equ {} (goto :Usage)
if {%1} equ {?} (goto :Usage)
if {%1} equ {-?} (goto :Usage)
if {%1} equ {/?} (goto :Usage)
	
set WORKDIR=%SYSTEMDRIVE%\RunOnce
set LOGDIR=%WORKDIR%\Logs

if NOT EXIST "%LOGDIR%" (md "%LOGDIR%")

REM =======================================================================
REM initializaton parameters / Constants
REM =======================================================================
set ACTION=%1
set DOMNAME=%2
set DOMUSER=%3
set DOMPASS=%4

set DWDB=OperationsManagerDW

echo.
echo *************************
echo Starting '%ACTION%' phase
echo *************************
echo.

if /i {%ACTION%} equ {domain} goto :Domain
if /i {%ACTION%} equ {initial} goto :Initial
if /i {%ACTION%} equ {install} goto :Install
if /i {%ACTION%} equ {Removeautologon} goto :Removeautologon
set ERRORNUM=-1
goto :End

:Domain
set DOMIP1=%5
set DOMIP2=%6

if /i {%DOMIP1%} neq {0} (
	call :LogMsg Adding primary DNS Server...
	netsh interface ip add dnsserver name="Ethernet" address=%DOMIP1% index=1
	if {%ERRORLEVEL%} neq {0} (
		call :LogMsg WARNING - %ERRORLEVEL% - Primary DNS server could not be added
	)
)

if /i {%DOMIP2%} neq {0} (
	call :LogMsg Adding secondary DNS Server...
	netsh interface ip add dnsserver name="Ethernet" address=%DOMIP2% index=2
	if {%ERRORLEVEL%} neq {0} (
		call :LogMsg WARNING - %ERRORLEVEL% - Secondary DNS server could not be added
	)
)

call :LogMsg Joining domain
netdom join %computername% /Domain:%DOMNAME% /UserD:%DOMUSER% /PasswordD:%DOMPASS%
if {%ERRORLEVEL%} neq {0} (
	call :LogMsg FATAL ERROR - %ERRORLEVEL% - Domain join failed
	cmd.exe /k echo Please revert to the previously saved snapshot,check to ensure that the Domain Name,User Name and password are typed correctly
	set ERRORNUM=%ERRORLEVEL%
	goto :EchoAndEnd
)

call :LogMsg Scheduling runonce "INITIAL %DOMNAME% %DOMUSER% ****** %7 %8"
call :ScheduleRunOnce INITIAL %DOMNAME% %DOMUSER% %DOMPASS% %7 %8

call :LogMsg Restarting for domain join to take effect
shutdown /r /t 5

goto :EchoAndEnd

:Initial
set AAUSER=%5
set AAPASS=%6
echo **********************
echo  SQL Evaluation currently being installed...
echo  Don't close any windows during this installation
echo **********************
Netsh firewall set opmode DISABLE
ping 127.0.0.1 -n 60 >nul
start /wait C:\RunOnce\SQL2016\setup.exe /Q /QUIET=True /ACTION=CompleteImage /IAcceptSQLServerLicenseTerms=true /X86="False" /InstanceName=MSSQLSERVER /InstanceId="MSSQLSERVER" /AGTSVCACCOUNT="NT AUTHORITY\SYSTEM" /AGTSVCSTARTUPTYPE="Automatic" /SqlSvcAccount="NT AUTHORITY\SYSTEM" /RsSvcAccount="NT AUTHORITY\SYSTEM" /RSINSTALLMODE="DefaultNativeMode" /SQLSYSADMINACCOUNTS="BUILTIN\ADMINISTRATORS" /ASSYSADMINACCOUNTS="BUILTIN\ADMINISTRATORS"
 
call :LogMsg Adding domain account to local admin group
if /i {%AAUSER%} equ {} (
	net localgroup "Administrators" "%DOMNAME%\%DOMUSER%" /add
) else (
	net localgroup "Administrators" "%DOMNAME%\%AAUSER%" /add
)
if {%ERRORLEVEL%} neq {0} (
	call :LogMsg FATAL ERROR - %ERRORLEVEL% - Could not add domain account to Administrator group.
	set ERRORNUM=%ERRORLEVEL%
	goto :EchoAndEnd
)
call :LogMsg Start SQLAgent Service
net start SQLSERVERAGENT

call :LogMsg Scheduling runonce "INSTALL %DOMNAME% %DOMUSER% ****** %AAUSER% ******
call :ScheduleRunOnce INSTALL %DOMNAME% %DOMUSER% %DOMPASS% %AAUSER% %AAPASS%

shutdown /l

goto :EchoAndEnd

:Install
echo.
ping 127.0.0.1 -n 30 >nul
echo.
echo ----------------------------------------------
echo Please DO NOT close this window
echo ----------------------------------------------
echo.
echo SCOM currently being installed...
echo.

set DOMUSER=%3
set DOMPASS=%4
set AAUSER=%5
set AAPASS=%6

call :LogMsg Installing SCOM ...

REM HTTPActivation45 seems cause rereq check failed, but if you run it again, it works.
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\ServicingStorage\ServerComponentCache\NET-WCF-HTTP-Activation45 /v InstallState /t REG_DWORD /d 1 /F

if /i {%AAUSER%} neq {} (
	call :LogMsg start /wait C:\RunOnce\SCOM\setup.exe /AcceptEndUserLicenseAgreement:1 /silent /install /components:omserver,omconsole,omreporting,omwebconsole /EnableErrorReporting:Never /SendCEIPReports:1 /UseMicrosoftUpdate:0 /ManagementGroupName:%COMPUTERNAME% /DatabaseName:OperationsManager /DatabaseSize:1000 /SqlServerInstance:%COMPUTERNAME% /DWDatabaseName:OperationsManagerDW /DWDatabaseSize:1000 /DWSqlServerInstance:%COMPUTERNAME% /ActionAccountUser:%userdomain%\%AAUSER% /ActionAccountPassword:****** /UseLocalSystemDASAccount /DatareaderUser:%userdomain%\%AAUSER% /DatareaderPassword:****** /DataWriterUser:%userdomain%\%AAUSER% /DataWriterPassword:****** /SRSInstance:%COMPUTERNAME% /SendODRReports:1 /WebConsoleAuthorizationMode:Mixed /WebSiteName:"Default Web Site"	
	start /wait C:\RunOnce\SCOM\setup.exe /AcceptEndUserLicenseAgreement:1 /silent /install /components:omserver,omconsole,omreporting,omwebconsole /EnableErrorReporting:Never /SendCEIPReports:1 /UseMicrosoftUpdate:0 /ManagementGroupName:%COMPUTERNAME% /DatabaseName:OperationsManager /DatabaseSize:1000 /SqlServerInstance:%COMPUTERNAME% /DWDatabaseName:OperationsManagerDW /DWDatabaseSize:1000 /DWSqlServerInstance:%COMPUTERNAME% /ActionAccountUser:%userdomain%\%AAUSER% /ActionAccountPassword:%AAPASS% /UseLocalSystemDASAccount /DatareaderUser:%userdomain%\%AAUSER% /DatareaderPassword:%AAPASS% /DataWriterUser:%userdomain%\%AAUSER% /DataWriterPassword:%AAPASS% /SRSInstance:%COMPUTERNAME% /SendODRReports:1 /WebConsoleAuthorizationMode:Mixed /WebSiteName:"Default Web Site"

) else (
	call :LogMsg start /wait C:\RunOnce\SCOM\setup.exe /AcceptEndUserLicenseAgreement:1 /silent /install /components:omserver,omconsole,omreporting,omwebconsole /EnableErrorReporting:Never /SendCEIPReports:1 /UseMicrosoftUpdate:0 /ManagementGroupName:%COMPUTERNAME% /DatabaseName:OperationsManager /DatabaseSize:1000 /SqlServerInstance:%COMPUTERNAME% /DWDatabaseName:OperationsManagerDW /DWDatabaseSize:1000 /DWSqlServerInstance:%COMPUTERNAME% /UseLocalSystemActionAccount /UseLocalSystemDASAccount /DatareaderUser:%userdomain%\%DOMUSER% /DatareaderPassword:****** /DataWriterUser:%userdomain%\%DOMUSER% /DataWriterPassword:****** /SRSInstance:%COMPUTERNAME% /SendODRReports:1 /WebConsoleAuthorizationMode:Mixed /WebSiteName:"Default Web Site"	
	start /wait C:\RunOnce\SCOM\setup.exe /AcceptEndUserLicenseAgreement:1 /silent /install /components:omserver,omconsole,omreporting,omwebconsole /EnableErrorReporting:Never /SendCEIPReports:1 /UseMicrosoftUpdate:0 /ManagementGroupName:%COMPUTERNAME% /DatabaseName:OperationsManager /DatabaseSize:1000 /SqlServerInstance:%COMPUTERNAME% /DWDatabaseName:OperationsManagerDW /DWDatabaseSize:1000 /DWSqlServerInstance:%COMPUTERNAME% /UseLocalSystemActionAccount /UseLocalSystemDASAccount /DatareaderUser:%userdomain%\%DOMUSER% /DatareaderPassword:%DOMPASS% /DataWriterUser:%userdomain%\%DOMUSER% /DataWriterPassword:%DOMPASS% /SRSInstance:%COMPUTERNAME% /SendODRReports:1 /WebConsoleAuthorizationMode:Mixed /WebSiteName:"Default Web Site"

)

if {%ERRORLEVEL%} neq {0} (
	call :LogMsg FATAL ERROR - %ERRORLEVEL% - Server installation failed
	set ERRORNUM=%ERRORLEVEL%
	goto :EchoAndEnd
)



call :LogMsg Scheduling runonce "Removeautologon"
call :ScheduleRunOnce Removeautologon
shutdown /l
goto :EchoAndEnd

:Removeautologon
echo.
call :LogMsg Removing auto logon settings
call :RemoveAutoLogon

goto :EchoAndEnd

:ScheduleRunOnce
set PARAMS=%*

REM Enable domain account auto logon for INSTALL phase
if /i {%1} equ {install} (
	REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /t REG_SZ /d %2 /f
	if /i {%5} neq {} (
		REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d %5 /f
		REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d %6 /f
	) else (
		REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d %3 /f
		REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d %4 /f
	)
)

REM Force auto logon
call :LogMsg Forcing autologon
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v ForceAutoLogon /t REG_SZ /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoLogonCount /t REG_SZ /d 1 /f

REM if /i {%1} equ {} (
	REM Delete at next logon as this will cause instant disconnection to users when using remote desktop
REM REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v DisableForcedAutoLogon /t REG_EXPAND_SZ /d "cmd /c REG DELETE """HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon""" /v ForceAutoLogon /f"
REM )

REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v RunCommand /t REG_EXPAND_SZ /d "cmd /c %WORKDIR%\RunOnce.cmd %PARAMS%" /f
goto :EOF

:RemoveAutoLogon
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v ForceAutoLogon /t REG_SZ /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoLogonCount /t REG_SZ /d 0 /f
goto :EOF

REM ======================================================================
REM Logging Function - log to screen and file
REM ======================================================================
:LogMsg
setlocal
set STRMSG=%TIME% - %*
echo %STRMSG% > CON
echo %STRMSG% >> %LOGDIR%\RunOnce.log
endlocal
goto :EOF

REM ======================================================================
REM Usage
REM ======================================================================
:Usage
echo.
echo Usage:
echo.
echo RunOnce.cmd [Option]
echo.
echo Prepares the VM and restarts the machine.
echo.
echo Optional Parameters:
echo    Initial		Optional. Renames the computer and restarts the machine.
echo    Domain		Optional. Joins the machine to the given domain and restarts the machine.
echo    Install		Optional. Installs all SCOM features including cumulative update.
echo.
goto :End

:EchoAndEnd
if {%ERRORNUM%} neq {0} (
	echo.
	echo ******************************************************
	echo A fatal error occurred. Terminating '%ACTION%' phase...
	echo ******************************************************
	echo.
) else (
	echo.
	echo *********************************************
	echo Completed '%ACTION%' phase
	echo *********************************************
	echo.
)

:End
exit /b %ERRORNUM%
endlocal