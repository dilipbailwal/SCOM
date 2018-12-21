/******************************************************************************
 *
 * DbSetupSProcs.sql
 *
 * Creates the set of stored procedures necessary for inserting
 * data into the audit database. These SPs are all called by AdtServer.
 *
 ******************************************************************************/



/******************************************************************************
 *
 * spSelectConfig
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spSelectConfig') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spSelectConfig
go
create procedure spSelectConfig
    @iIndex                 int     -- Index of value to retrieve
as

set nocount on

declare @iValue     int

set @iValue = (select top 1 Value from dtConfig where Id = @iIndex)

return @iValue
go


/******************************************************************************
 *
 * spUpdateConfig
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spUpdateConfig') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spUpdateConfig
go
create procedure spUpdateConfig
    @iIndex                 int,    -- Index of value to set
    @iValue                 int     -- New value
as

set nocount on

update dtConfig set Value = @iValue where Id = @iIndex
go


/******************************************************************************
 *
 * spSelectPartitions
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spSelectPartitions') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spSelectPartitions
go
create procedure spSelectPartitions
as

set nocount on

select
        PartitionId,
        Status,
        PartitionStartTime,
        PartitionCloseTime,
        FirstCreationTime,
        LastCreationTime,
        FirstCollectionTime,
        LastCollectionTime
    from
        dtPartition
    order by
        PartitionStartTime asc
go


/******************************************************************************
 *
 * spInsertType
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertType') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertType
go
create procedure spInsertType
    @iId                    int,
    @vchDesc                nvarchar(64)
as

set nocount on

declare @vchDescription    nvarchar(64)

set @vchDescription = (select Description from dtType where Id = @iId)
if @vchDescription is null
begin
    insert into dtType (Id, Description) values (@iId, @vchDesc)
end
else if @vchDescription <> @vchDesc
begin
    update dtType set Description = @vchDesc where Id = @iId
end
go


/******************************************************************************
 *
 * spInsertCategory
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertCategory') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertCategory
go
create procedure spInsertCategory
    @iCategoryNo            int
as

set nocount on

declare @iCategoryId int

if not exists (select Id from dtCategory where Id = @iCategoryNo)
begin
    insert into dtCategory (Id, Description) values (@iCategoryNo, N'UNKNOWN CATEGORY ' + cast(@iCategoryNo as varchar(20)))
end
go


/******************************************************************************
 *
 * spInsertMachine
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertMachine') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertMachine
go
create procedure spInsertMachine
    @dtCreation             datetime,
    @vchSid                 nvarchar(256),
    @vchDescription         nvarchar(256),
    @vchDistinguishedName   nvarchar(512)
as

set nocount on

declare @iId int

set @iId = (select max(Id) from dtMachine where Sid = @vchSid)
if @iId is null
begin
    insert into dtMachine
            (CreationTime, Sid,     Description,     DistinguishedName)
        values
            (@dtCreation,  @vchSid, @vchDescription, @vchDistinguishedName)
    set @iId = @@identity
end
else
begin
    update dtMachine
        set
            Description = @vchDescription,
            DistinguishedName = @vchDistinguishedName
        where Id = @iId
end
return @iId
go


/******************************************************************************
 *
 * spSelectMachines
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spSelectMachines') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spSelectMachines
go
create procedure spSelectMachines
as

set nocount on

select
        Id,
        CreationTime,
        Sid,
        Description,
        DistinguishedName
    from
        dtMachine
    order by
        CreationTime asc
go


/******************************************************************************
 *
 * spInsertSource
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertSource') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertSource
go
create procedure spInsertSource
    @vchSourceName          nvarchar(64),
    @vchLogName             nvarchar(64)
as

set nocount on

declare @iId int

set @iId = (select max(Id) from dtSource
                where
                    SourceName = @vchSourceName and
                    LogName    = @vchLogName)
if @iId is null
begin
    insert into dtSource
            (    SourceName,     LogName)
        values
            (@vchSourceName, @vchLogName)
    set @iId = @@identity
end
return @iId
go


/******************************************************************************
 *
 * spSelectSources
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spSelectSources') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spSelectSources
go
create procedure spSelectSources
as

set nocount on

select
        Id,
        SourceName,
        LogName
    from
        dtSource
    order by
        Id
go


/******************************************************************************
 *
 * spOnCreatePartition
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spOnCreatePartition') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spOnCreatePartition
go
create procedure spOnCreatePartition
    @chPartitionId          nchar(36)
as

set nocount on

-- default action is to do nothing

go


/******************************************************************************
 *
 * spOnClosePartition
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spOnClosePartition') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spOnClosePartition
go
create procedure spOnClosePartition
    @chPartitionId          nchar(36)
as

set nocount on

-- default action is to set the status of the partition to 2,
-- meaning the partition has been archived

update dtPartition
    set Status = 2
    where PartitionId = @chPartitionId
go
