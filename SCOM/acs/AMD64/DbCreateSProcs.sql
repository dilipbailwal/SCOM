
/******************************************************************************
 *
 * Partition !g!
 *
 * Delete and recreate stored procedures accessing partitioned tables.
 *
 ******************************************************************************/


/******************************************************************************
 *
 * spCheckPoint
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spCheckPoint') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spCheckPoint
go
create procedure spCheckPoint
    @iMachineId             int,
    @iSourceId              int,
    @iRecordNo              int,
    @stCreation             datetime
as

set nocount on

insert into dtEvent_!g!
    (
        EventNo,
        SequenceNo,
        TypeNo,
        CategoryNo,
        CreationTime,
        CollectionTime,
        AgentMachineId,
        EventMachineId,
        SourceId,
        UserId,
        PrimaryUserId,
        PrimaryUserLogonId,
        ClientUserId,
        ClientUserLogonId,
        TargetUserId,
        StringId01,
        StringId02,
        StringId03,
        StringId04,
        StringId05,
        StringId06,
        StringId07,
        StringId08,
        StringId09,
        StringId10,
        StringId11,
        StringId12,
        StringId13,
        StringId14,
        StringId15,
        StringId16,
        StringId17,
        StringId18,
        StringId19,
        StringId20,
        StringId21,
        StringId22
    )
    values
    (
        0,
        @iRecordNo,
        0,
        0,
        @stCreation,
        @stCreation,
        @iMachineId,
        0,
        @iSourceId,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
    )

    --checkpoint
go


/******************************************************************************
 *
 * spInsertEvent
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertEvent') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertEvent
go
create procedure spInsertEvent
    @iId                    bigint output,
    @iEventNo               int,
    @iSequenceNo            int,
    @iTypeNo                int,
    @iCategoryNo            int,
    @stCreation             datetime,
    @stCollection           datetime,
    @iAgentMachineId        int,
    @iEventMachineId        int,
    @iSourceId              int,
    @iUserId                int,
    @iPrimaryUserId         int,
    @iPrimaryUserLogonId    bigint,
    @iClientUserId          int,
    @iClientUserLogonId     bigint,
    @iTargetUserId          int,
    @iStringId01            int,
    @iStringId02            int,
    @iStringId03            int,
    @iStringId04            int,
    @iStringId05            int,
    @iStringId06            int,
    @iStringId07            int,
    @iStringId08            int,
    @iStringId09            int,
    @iStringId10            int,
    @iStringId11            int,
    @iStringId12            int,
    @iStringId13            int,
    @iStringId14            int,
    @iStringId15            int,
    @iStringId16            int,
    @iStringId17            int,
    @iStringId18            int,
    @iStringId19            int,
    @iStringId20            int,
    @iStringId21            int,
    @iStringId22            int
as

set nocount on

insert into dtEvent_!g!
    (
        EventNo,
        SequenceNo,
        TypeNo,
        CategoryNo,
        CreationTime,
        CollectionTime,
        AgentMachineId,
        EventMachineId,
        SourceId,
        UserId,
        PrimaryUserId,
        PrimaryUserLogonId,
        ClientUserId,
        ClientUserLogonId,
        TargetUserId,
        StringId01,
        StringId02,
        StringId03,
        StringId04,
        StringId05,
        StringId06,
        StringId07,
        StringId08,
        StringId09,
        StringId10,
        StringId11,
        StringId12,
        StringId13,
        StringId14,
        StringId15,
        StringId16,
        StringId17,
        StringId18,
        StringId19,
        StringId20,
        StringId21,
        StringId22
    )
    values
    (
        @iEventNo,
        @iSequenceNo,
        @iTypeNo,
        @iCategoryNo,
        @stCreation,
        @stCollection,
        @iAgentMachineId,
        @iEventMachineId,
        @iSourceId,
        @iUserId,
        @iPrimaryUserId,
        @iPrimaryUserLogonId,
        @iClientUserId,
        @iClientUserLogonId,
        @iTargetUserId,
        @iStringId01,
        @iStringId02,
        @iStringId03,
        @iStringId04,
        @iStringId05,
        @iStringId06,
        @iStringId07,
        @iStringId08,
        @iStringId09,
        @iStringId10,
        @iStringId11,
        @iStringId12,
        @iStringId13,
        @iStringId14,
        @iStringId15,
        @iStringId16,
        @iStringId17,
        @iStringId18,
        @iStringId19,
        @iStringId20,
        @iStringId21,
        @iStringId22
    )

    set @iId = @@identity
go


/******************************************************************************
 *
 * spInfoEvent
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInfoEvent') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInfoEvent
go
create procedure spInfoEvent
    @dtOldest               datetime    output,
    @dtNewest               datetime    output
as

set nocount on

set @dtOldest = (select min(CreationTime) from dtEvent_!g!)
set @dtNewest = (select max(CreationTime) from dtEvent_!g!)

if @dtOldest is null or @dtNewest is null
begin
    set @dtOldest = '20000101 00:00:00.000'
    set @dtNewest = '20000101 00:00:00.000'
end

go


/******************************************************************************
 *
 * spInsertUserClaim
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertUserClaim') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertUserClaim
go
create procedure spInsertUserClaim
    @iEventId               bigint,
    @stCreationTime         datetime,
    @iClaimId               int
as

set nocount on

insert into dtUserClaim_!g!
    (
        EventId,
        CreationTime,
        ClaimId
    )
    values
    (
        @iEventId,
        @stCreationTime,
        @iClaimId
    )
go


/******************************************************************************
 *
 * spInsertDeviceClaim
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertDeviceClaim') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertDeviceClaim
go
create procedure spInsertDeviceClaim
    @iEventId               bigint,
    @stCreationTime         datetime,
    @iClaimId               int
as

set nocount on

insert into dtDeviceClaim_!g!
    (
        EventId,
        CreationTime,
        ClaimId
    )
    values
    (
        @iEventId,
        @stCreationTime,
        @iClaimId
    )
go


/******************************************************************************
 *
 * spInsertOldResourceAttribute
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertOldResourceAttribute') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertOldResourceAttribute
go
create procedure spInsertOldResourceAttribute
    @iEventId               bigint,
    @stCreationTime         datetime,
    @iClaimId               int
as

set nocount on

insert into dtOldResourceAttribute_!g!
    (
        EventId,
        CreationTime,
        ClaimId
    )
    values
    (
        @iEventId,
        @stCreationTime,
        @iClaimId
    )
go


/******************************************************************************
 *
 * spInsertNewResourceAttribute
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertNewResourceAttribute') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertNewResourceAttribute
go
create procedure spInsertNewResourceAttribute
    @iEventId               bigint,
    @stCreationTime         datetime,
    @iClaimId               int
as

set nocount on

insert into dtNewResourceAttribute_!g!
    (
        EventId,
        CreationTime,
        ClaimId
    )
    values
    (
        @iEventId,
        @stCreationTime,
        @iClaimId
    )
go


/******************************************************************************
 *
 * spInsertString
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertString') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertString
go
create procedure spInsertString
    @iId                    int  output,
    @iTypeId                int,
    @rbDescHash             binary(20),
    @vchDesc                nvarchar(max)
as

set nocount on

-- create a new string or update an existing one
set @iId = (select max(Id) from dtString_!g!
                where TypeId = @iTypeId and DescHash = @rbDescHash and Description = @vchDesc)
if @iId is null
begin
    insert into dtString_!g!
            (TypeId, DescHash, Description)
        values
            (@iTypeId, @rbDescHash, @vchDesc)
    set @iId = @@identity
end
go


/******************************************************************************
 *
 * spInsertClaimString
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertClaimString') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertClaimString
go
create procedure spInsertClaimString
    @iId                      int  output,
    @rbHash                   binary(20),
    @vchClaimId               nvarchar(max),
    @vchClaimDisplayName      nvarchar(max),
    @vchClaimValue            nvarchar(max),
    @vchClaimValueDisplayName nvarchar(max)
as

set nocount on

-- create a new string or update an existing one
set @iId = (select max(Id) from dtClaimString_!g!
                where Hash = @rbHash and
                      strClaimId = @vchClaimId and
                      strClaimDisplayName = @vchClaimDisplayName and
                      strClaimValue = @vchClaimValue and
                      strClaimValueDisplayName = @vchClaimValueDisplayName)
if @iId is null
begin
    insert into dtClaimString_!g!
            (Hash, strClaimId, strClaimDisplayName, strClaimValue, strClaimValueDisplayName)
        values
            (@rbHash, @vchClaimId, @vchClaimDisplayName, @vchClaimValue, @vchClaimValueDisplayName)
    set @iId = @@identity
end
go


/******************************************************************************
 *
 * spInsertPrincipal
 *
 ******************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertPrincipal') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertPrincipal
go
create procedure spInsertPrincipal
    @vchSid                 nvarchar(180),
    @vchUser                nvarchar(256),
    @vchDomain              nvarchar(256)
as

set nocount on

declare @iId int

set @iId = (select max(Id) from dtPrincipal_!g!
                where
                    strDomain = @vchDomain and
                    strSid = @vchSid and
                    strUser = @vchUser)
if @iId is null
begin
    insert into dtPrincipal_!g!
            (strSid, strUser, strDomain)
        values
            (@vchSid, @vchUser, @vchDomain)
    set @iId = @@identity
end
return @iId
go


/******************************************************************************
 *
 * Grant execute permission to the 'AdtServer' user account
 * for partition !g!
 *
 ******************************************************************************/

grant execute on spCheckPoint           to AdtServer
grant execute on spInsertEvent          to AdtServer
grant execute on spInfoEvent            to AdtServer
grant execute on spInsertString         to AdtServer
grant execute on spInsertPrincipal      to AdtServer
go
