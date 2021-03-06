
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'ConfigServiceMonitoringUsers')
BEGIN
  EXEC sp_addrole 'ConfigServiceMonitoringUsers'
END
GO

IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'ConfigService')
BEGIN
  EXEC sp_addrole 'ConfigService'
END
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE [name] = 'CS')
BEGIN
  EXECUTE('CREATE SCHEMA CS')
END
GO

ALTER AUTHORIZATION ON SCHEMA::CS TO ConfigService
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE [name] = 'CSStage')
BEGIN
  EXECUTE('CREATE SCHEMA CSStage')
END
GO

ALTER AUTHORIZATION ON SCHEMA::CSStage TO ConfigService
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE [name] = 'CSLog')
BEGIN
  EXECUTE('CREATE SCHEMA CSLog')
END
GO

ALTER AUTHORIZATION ON SCHEMA::CSLog TO ConfigService
GO
