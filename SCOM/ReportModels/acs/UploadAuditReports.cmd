@echo off

@if .%1 == "?" goto usage
@if .%1 == "/?" goto usage

REM Set defaults for optional parameters
set SRSFolder="Audit Reports"
set DataSourceName="DB Audit"

@if .%1 == . goto errormissingvariable
@if .%2 == . goto errormissingvariable
@if .%3 == . goto errormissingvariable

ReportingConfig.exe /DoAction:CreateDataSource /DBServerName:%1 /DBName:"OperationsManagerAC" /SRSUrl:%2 /SRSFolder:%SRSFolder% /DataSourceName:%DataSourceName% /WindowsIntegrated /LoadReportsFromFolder:%3\Models

ReportingConfig.exe /DoAction:CreateDataSource /DBServerName:%1 /DBName:"OperationsManagerAC" /SRSUrl:%2 /SRSFolder:%SRSFolder% /DataSourceName:%DataSourceName% /WindowsIntegrated /LoadReportsFromFolder:%3\Reports

@goto end

:errormissingvariable
@echo Error: Parameter Missing
@goto usage

:usage
@echo UploadAuditReports {DatabaseServerAndInstance} {ReportingServiceURL} {ReportFolder}
@echo Example (database with instance):
@echo UploadAuditReports MyDBServer\Instance1 http://MyDbServer/ReportServer$Instance1 C:\MyReports
@echo Example (database with no instance):
@echo UploadAuditReports MyDBServer http://MyDbServer/ReportServer C:\MyReports

@goto end

:end
