/******************************************************************************
 *
 * Partition !g!
 *
 * Create partitioned tables and views.
 *
 ******************************************************************************/


/******************************************************************************
 *
 * Typed Strings: dtString_!g!
 *
 *****************************************************************************/

create table dtString_!g!
(
    Id                  int             not null    constraint pkString_!g!      primary key identity     (0,1),
    -- Type of the string
    TypeId              int             not null    constraint fkStringType_!g!  references dtType        (Id),
    -- SHA1 hash of string content
    DescHash            binary(20)      not null,
    -- Content of the string
    Description         nvarchar(max)   not null
)

create index ixString_!g!     on dtString_!g!   (TypeId, DescHash)
go


/******************************************************************************
 *
 * Principals: dtPrincipal_!g!
 *
 *****************************************************************************/

create table dtPrincipal_!g!
(
    Id                  int             not null    constraint pkPrincipal_!g!   primary key identity     (0,1),
    strSid              nvarchar(180)   not null,
    strUser             nvarchar(256)   not null,
    strDomain           nvarchar(256)   not null,
)
go


/******************************************************************************
 *
 * dtClaimString: dtClaimString_!g!
 *
 *****************************************************************************/

create table dtClaimString_!g!
(
    Id                       int             not null    constraint pkClaimString_!g!   primary key identity     (0,1),
    -- SHA1 hash of all string content
    Hash                     binary(20)      not null,
    strClaimId               nvarchar(max)   not null,
    strClaimDisplayName      nvarchar(max)   not null,
    strClaimValue            nvarchar(max)   not null,
    strClaimValueDisplayName nvarchar(max)   not null,
)
go


/******************************************************************************
 *
 * OldResourceAttributes: dtOldResourceAttribute_!g!
 *
 *****************************************************************************/

create table dtOldResourceAttribute_!g!
(
    EventId         bigint      not null,
    -- utc time of event creation
    CreationTime    datetime    not null,
    ClaimId         int         not null    constraint fkOldResourceAttributeClaimId_!g!  references dtClaimString_!g! (Id),
)
go


/******************************************************************************
 *
 * NewResourceAttributes: dtNewResourceAttribute_!g!
 *
 *****************************************************************************/

create table dtNewResourceAttribute_!g!
(
    EventId         bigint      not null,
    -- utc time of event creation
    CreationTime    datetime    not null,
    ClaimId         int         not null    constraint fkNewResourceAttributeClaimId_!g!  references dtClaimString_!g! (Id),
)
go


/******************************************************************************
 *
 * UserClaims: dtUserClaim_!g!
 *
 *****************************************************************************/

create table dtUserClaim_!g!
(
    EventId         bigint      not null,
    -- utc time of event creation
    CreationTime    datetime    not null,
    ClaimId         int         not null    constraint fkUserClaimClaimId_!g!  references dtClaimString_!g! (Id),
)
go


/******************************************************************************
 *
 * DeviceClaims: dtDeviceClaim_!g!
 *
 *****************************************************************************/

create table dtDeviceClaim_!g!
(
    EventId         bigint      not null,
    -- utc time of event creation
    CreationTime    datetime    not null,
    ClaimId         int         not null    constraint fkDeviceClaimClaimId_!g!  references dtClaimString_!g! (Id),
)
go


/******************************************************************************
 *
 * Events: dtEvent_!g!
 *
 *****************************************************************************/

create table dtEvent_!g!
(
    Id                  bigint          not null    constraint pkEvent_!g!       primary key identity     (1,1),

    -- data from the event log record header:

    -- event number
    EventNo             int             not null,

    -- the sequence number of the event from the event log record
    SequenceNo          int             not null,

    -- type of audit: success / failure
    TypeNo              int             not null,

    -- category index of the event
    CategoryNo          int             not null,

    -- utc time of event creation
    CreationTime        datetime        not null,

    -- utc time the event arrived at the collector
    CollectionTime      datetime        not null,

    -- ID of the machine that generated this event
    AgentMachineId      int             not null,

    -- ID of the machine in the event header
    EventMachineId      int             not null,

    -- source field of the event
    SourceId            int             not null,

    -- user from the event log record header
    UserId              int             not null,

    -- data from the variable part of the event log record:
    -- not all of the following fields are used for all events

    PrimaryUserId       int             not null,
    PrimaryUserLogonId  bigint          not null,

    ClientUserId        int             not null,
    ClientUserLogonId   bigint          not null,

    TargetUserId        int             not null,

    StringId01          int             not null,
    StringId02          int             not null,
    StringId03          int             not null,
    StringId04          int             not null,
    StringId05          int             not null,
    StringId06          int             not null,
    StringId07          int             not null,
    StringId08          int             not null,
    StringId09          int             not null,
    StringId10          int             not null,
    StringId11          int             not null,
    StringId12          int             not null,
    StringId13          int             not null,
    StringId14          int             not null,
    StringId15          int             not null,
    StringId16          int             not null,
    StringId17          int             not null,
    StringId18          int             not null,
    StringId19          int             not null,
    StringId20          int             not null,
    StringId21          int             not null,
    StringId22          int             not null
)

create index ixEventNo_!g!    on dtEvent_!g!    (EventNo)
create index ixCreation_!g!   on dtEvent_!g!    (CreationTime)
create index ixCollection_!g! on dtEvent_!g!    (CollectionTime)
go


/******************************************************************************
 *
 * Binary Event Data: dtEventData_!g!
 *
 *****************************************************************************/

create table dtEventData_!g!
(
    EventId             bigint          not null    constraint pkEventData_!g!     primary key,

    -- binary data portion of the event
    EventData           image           not null
)
go


/******************************************************************************
 *
 * Initial Values for partition !g!
 *
 *****************************************************************************/

if not exists (select * from dtType where Id = 0)
    insert into dtType          (Id, Description)           values (0, N'<no type>')

insert into dtString_!g!        (TypeId, DescHash, Description) values (0, hashbytes('SHA1', N'n/a'), N'n/a')
insert into dtClaimString_!g!   (Hash, strClaimId, strClaimDisplayName, strClaimValue, strClaimValueDisplayName) values (hashbytes('SHA1', N''), N'', N'', N'', N'')
insert into dtPrincipal_!g!     (strSid, strUser, strDomain)    values (N'n/a', N'n/a', N'n/a')
go


/******************************************************************************
 *
 * dvAll_!g!
 *
 ******************************************************************************/

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'dvAll_!g!') and
        objectproperty(id, N'IsView') = 1)
    drop view dvAll_!g!
go

create view dvAll_!g!
as
select
          e.Id,
          e.EventNo         as EventId,
          e.SequenceNo      as SequenceNo,
        'S/F' =
            case e.TypeNo
            when 8  then 'S'
            when 16 then 'F'
            else '?'
            end,
          c.Description     as Category,
          e.CreationTime    as CreationTime,
          e.CollectionTime  as CollectionTime,
          m.Description     as AgentMachine,
         sm.Description     as EventMachine,
          s.SourceName      as Source,
         p1.strSid          as HeaderSid,
         p1.strUser         as HeaderUser,
         p1.strDomain       as HeaderDomain,
         p2.strSid          as PrimarySid,
         p2.strUser         as PrimaryUser,
         p2.strDomain       as PrimaryDomain,
          e.PrimaryUserLogonId as PrimaryLogonId,
         p3.strSid          as ClientSid,
         p3.strUser         as ClientUser,
         p3.strDomain       as ClientDomain,
          e.ClientUserLogonId as ClientLogonId,
         p4.strSid          as TargetSid,
         p4.strUser         as TargetUser,
         p4.strDomain       as TargetDomain,
        s01.Description     as String01,
        s02.Description     as String02,
        s03.Description     as String03,
        s04.Description     as String04,
        s05.Description     as String05,
        s06.Description     as String06,
        s07.Description     as String07,
        s08.Description     as String08,
        s09.Description     as String09,
        s10.Description     as String10,
        s11.Description     as String11,
        s12.Description     as String12,
        s13.Description     as String13,
        s14.Description     as String14,
        s15.Description     as String15,
        s16.Description     as String16,
        s17.Description     as String17,
        s18.Description     as String18,
        s19.Description     as String19,
        s20.Description     as String20,
        s21.Description     as String21,
        s22.Description     as String22
    from
        dtEvent_!g! e
        left outer join dtCategory c on e.CategoryNo = c.Id
        left outer join dtMachine m on e.AgentMachineId = m.Id
        left outer join dtString_!g! sm on e.EventMachineId = sm.Id
        left outer join dtSource s on e.SourceId = s.Id
        left outer join dtPrincipal_!g! p1 on e.UserId = p1.Id
        left outer join dtPrincipal_!g! p2 on e.PrimaryUserId = p2.Id
        left outer join dtPrincipal_!g! p3 on e.ClientUserId = p3.Id
        left outer join dtPrincipal_!g! p4 on e.TargetUserId = p4.Id
        left outer join dtString_!g! s01 on e.StringId01 = s01.Id
        left outer join dtString_!g! s02 on e.StringId02 = s02.Id
        left outer join dtString_!g! s03 on e.StringId03 = s03.Id
        left outer join dtString_!g! s04 on e.StringId04 = s04.Id
        left outer join dtString_!g! s05 on e.StringId05 = s05.Id
        left outer join dtString_!g! s06 on e.StringId06 = s06.Id
        left outer join dtString_!g! s07 on e.StringId07 = s07.Id
        left outer join dtString_!g! s08 on e.StringId08 = s08.Id
        left outer join dtString_!g! s09 on e.StringId09 = s09.Id
        left outer join dtString_!g! s10 on e.StringId10 = s10.Id
        left outer join dtString_!g! s11 on e.StringId11 = s11.Id
        left outer join dtString_!g! s12 on e.StringId12 = s12.Id
        left outer join dtString_!g! s13 on e.StringId13 = s13.Id
        left outer join dtString_!g! s14 on e.StringId14 = s14.Id
        left outer join dtString_!g! s15 on e.StringId15 = s15.Id
        left outer join dtString_!g! s16 on e.StringId16 = s16.Id
        left outer join dtString_!g! s17 on e.StringId17 = s17.Id
        left outer join dtString_!g! s18 on e.StringId18 = s18.Id
        left outer join dtString_!g! s19 on e.StringId19 = s19.Id
        left outer join dtString_!g! s20 on e.StringId20 = s20.Id
        left outer join dtString_!g! s21 on e.StringId21 = s21.Id
        left outer join dtString_!g! s22 on e.StringId22 = s22.Id

go


/******************************************************************************
 *
 * dvUserClaims_!g!
 *
 ******************************************************************************/

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'dvUserClaims_!g!') and
        objectproperty(id, N'IsView') = 1)
    drop view dvUserClaims_!g!
go

create view dvUserClaims_!g!
as
select
    uc.EventId as EventId,
    uc.CreationTime as CreationTime,
    ucs.strClaimId as UserClaimId,
    ucs.strClaimDisplayName as UserClaimDisplayName,
    ucs.strClaimValue as UserClaimValue,
    ucs.strClaimValueDisplayName as UserClaimValueDisplayName
FROM
    dtUserClaim_!g! as uc
    inner join dtClaimString_!g! ucs on ucs.Id = uc.ClaimId

go

/******************************************************************************
 *
 * dvDeviceClaims_!g!
 *
 ******************************************************************************/

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'dvDeviceClaims_!g!') and
        objectproperty(id, N'IsView') = 1)
    drop view dvDeviceClaims_!g!
go

create view dvDeviceClaims_!g!
as
select
    dc.EventId as EventId,
    dc.CreationTime as CreationTime,
    dcs.strClaimId as DeviceClaimId,
    dcs.strClaimDisplayName as DeviceClaimDisplayName,
    dcs.strClaimValue as DeviceClaimValue,
    dcs.strClaimValueDisplayName as DeviceClaimValueDisplayName
FROM
    dtDeviceClaim_!g! as dc
    inner join dtClaimString_!g! dcs on dcs.Id = dc.ClaimId

go

/******************************************************************************
 *
 * dvNewResourceAttributes_!g!
 *
 ******************************************************************************/

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'dvNewResourceAttributes_!g!') and
        objectproperty(id, N'IsView') = 1)
    drop view dvNewResourceAttributes_!g!
go

create view dvNewResourceAttributes_!g!
as
select
    nra.EventId as EventId,
    nra.CreationTime as CreationTime,
    ncs.strClaimId as NewClaimId,
    ncs.strClaimDisplayName as NewClaimDisplayName,
    ncs.strClaimValue as NewClaimValue,
    ncs.strClaimValueDisplayName as NewClaimValueDisplayName
FROM
    dtNewResourceAttribute_!g! as nra
    inner join dtClaimString_!g! ncs on ncs.Id = nra.ClaimId

go

/******************************************************************************
 *
 * dvOldResourceAttributes_!g!
 *
 ******************************************************************************/

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'dvOldResourceAttributes_!g!') and
        objectproperty(id, N'IsView') = 1)
    drop view dvOldResourceAttributes_!g!
go

create view dvOldResourceAttributes_!g!
as
select
    nra.EventId as EventId,
    nra.CreationTime as CreationTime,
    ncs.strClaimId as OldClaimId,
    ncs.strClaimDisplayName as OldClaimDisplayName,
    ncs.strClaimValue as OldClaimValue,
    ncs.strClaimValueDisplayName as OldClaimValueDisplayName
FROM
    dtOldResourceAttribute_!g! as nra
    inner join dtClaimString_!g! ncs on ncs.Id = nra.ClaimId

go

/******************************************************************************
 *
 * dvAll5_!g!
 *
 ******************************************************************************/

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'dvAll5_!g!') and
        objectproperty(id, N'IsView') = 1)
    drop view dvAll5_!g!
go

create view dvAll5_!g!
as
select
          e.Id,
          e.EventNo         as EventId,
          e.SequenceNo      as SequenceNo,
        'S/F' =
            case e.TypeNo
            when 8  then 'S'
            when 16 then 'F'
            else '?'
            end,
          c.Description     as Category,
          e.CreationTime    as CreationTime,
          e.CollectionTime  as CollectionTime,
          m.Description     as AgentMachine,
         sm.Description     as EventMachine,
          s.SourceName      as Source,
         p1.strSid          as HeaderSid,
         p1.strUser         as HeaderUser,
         p1.strDomain       as HeaderDomain,
         p2.strSid          as PrimarySid,
         p2.strUser         as PrimaryUser,
         p2.strDomain       as PrimaryDomain,
          e.PrimaryUserLogonId as PrimaryLogonId,
         p3.strSid          as ClientSid,
         p3.strUser         as ClientUser,
         p3.strDomain       as ClientDomain,
          e.ClientUserLogonId as ClientLogonId,
         p4.strSid          as TargetSid,
         p4.strUser         as TargetUser,
         p4.strDomain       as TargetDomain,
        s01.Description     as String01,
        s02.Description     as String02,
        s03.Description     as String03,
        s04.Description     as String04,
        s05.Description     as String05
    from
        dtEvent_!g! e
        left outer join dtCategory c on e.CategoryNo = c.Id
        left outer join dtMachine m on e.AgentMachineId = m.Id
        left outer join dtString_!g! sm on e.EventMachineId = sm.Id
        left outer join dtSource s on e.SourceId = s.Id
        left outer join dtPrincipal_!g! p1 on e.UserId = p1.Id
        left outer join dtPrincipal_!g! p2 on e.PrimaryUserId = p2.Id
        left outer join dtPrincipal_!g! p3 on e.ClientUserId = p3.Id
        left outer join dtPrincipal_!g! p4 on e.TargetUserId = p4.Id
        left outer join dtString_!g! s01 on e.StringId01 = s01.Id
        left outer join dtString_!g! s02 on e.StringId02 = s02.Id
        left outer join dtString_!g! s03 on e.StringId03 = s03.Id
        left outer join dtString_!g! s04 on e.StringId04 = s04.Id
        left outer join dtString_!g! s05 on e.StringId05 = s05.Id

go

/******************************************************************************
 *
 * dvHeader_!g!
 *
 ******************************************************************************/

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'dvHeader_!g!') and
        objectproperty(id, N'IsView') = 1)
    drop view dvHeader_!g!
go

create view dvHeader_!g!
as
select
          e.Id,
          e.EventNo         as EventId,
          e.SequenceNo      as SequenceNo,
        'S/F' =
            case e.TypeNo
            when 8  then 'S'
            when 16 then 'F'
            else '?'
            end,
          c.Description     as Category,
          e.CreationTime    as CreationTime,
          e.CollectionTime  as CollectionTime,
          m.Description     as AgentMachine,
         sm.Description     as EventMachine,
          s.SourceName      as Source,
         p1.strSid          as HeaderSid,
         p1.strUser         as HeaderUser,
         p1.strDomain       as HeaderDomain,
         p2.strSid          as PrimarySid,
         p2.strUser         as PrimaryUser,
         p2.strDomain       as PrimaryDomain,
          e.PrimaryUserLogonId as PrimaryLogonId,
         p3.strSid          as ClientSid,
         p3.strUser         as ClientUser,
         p3.strDomain       as ClientDomain,
          e.ClientUserLogonId as ClientLogonId,
         p4.strSid          as TargetSid,
         p4.strUser         as TargetUser,
         p4.strDomain       as TargetDomain
     from
        dtEvent_!g! e
        left outer join dtCategory c on e.CategoryNo = c.Id
        left outer join dtMachine m on e.AgentMachineId = m.Id
        left outer join dtString_!g! sm on e.EventMachineId = sm.Id
        left outer join dtSource s on e.SourceId = s.Id
        left outer join dtPrincipal_!g! p1 on e.UserId = p1.Id
        left outer join dtPrincipal_!g! p2 on e.PrimaryUserId = p2.Id
        left outer join dtPrincipal_!g! p3 on e.ClientUserId = p3.Id
        left outer join dtPrincipal_!g! p4 on e.TargetUserId = p4.Id

go

/******************************************************************************
 *
 * Set active partitions to 'ready to archive' and
 * create an entry in dtPartition for the new partition !g!.
 *
 *****************************************************************************/

-- executing 'update' on an empty table returns a 'no data' error
if (select count(*) from dtPartition where Status = 0) > 0
    update dtPartition set Status = 2 where Status = 0
go

declare @dtTime datetime

if 0 = (select max(Value) from dtConfig where Id = 1)
    set @dtTime = getutcdate()
else
    set @dtTime = getdate()

insert into dtPartition
        (
        PartitionId,
        Status,
        PartitionStartTime,
        PartitionCloseTime,
        FirstCreationTime,
        LastCreationTime,
        FirstCollectionTime,
        LastCollectionTime
        )
    values
        (
        N'!g!',
        0,      -- 0: active
        @dtTime,
        @dtTime,
        '20000101 00:00:00.000',
        '20000101 00:00:00.000',
        '20000101 00:00:00.000',
        '20000101 00:00:00.000'
        )
go


/******************************************************************************
 *
 * Create or update dvAll, the view across all partition views
 *
 *****************************************************************************/

declare @iIsFirst int
declare @vchStmt nvarchar(max)
declare @vchPartitionId nchar(36)
declare cPartition cursor for
	select PartitionId from dtPartition order by PartitionCloseTime desc

set @iIsFirst = 1
set @vchStmt = N'create view [AdtServer].dvAll as'

open cPartition
fetch next from cPartition into @vchPartitionId
while @@fetch_status = 0
begin
    if @iIsFirst = 0
        set @vchStmt =  @vchStmt + N' union all'
    set @vchStmt =  @vchStmt + N' select * from dvAll_' + @vchPartitionId
    set @iIsFirst = 0
    fetch next from cPartition into @vchPartitionId
end
close cPartition
deallocate cPartition

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'[AdtServer].dvAll') and
        objectproperty(id, N'IsView') = 1)
    drop view [AdtServer].dvAll

exec (@vchStmt)
go

/******************************************************************************
 *
 * Create or update dvAll5, the view across all partition views limited to the first 5 strings
 *
 *****************************************************************************/

declare @iIsFirst int
declare @vchStmt nvarchar(max)
declare @vchPartitionId nchar(36)
declare cPartition cursor for
	select PartitionId from dtPartition order by PartitionCloseTime desc

set @iIsFirst = 1
set @vchStmt = N'create view [AdtServer].dvAll5 as'

open cPartition
fetch next from cPartition into @vchPartitionId
while @@fetch_status = 0
begin
    if @iIsFirst = 0
        set @vchStmt =  @vchStmt + N' union all'
    set @vchStmt =  @vchStmt + N' select * from dvAll5_' + @vchPartitionId
    set @iIsFirst = 0
    fetch next from cPartition into @vchPartitionId
end
close cPartition
deallocate cPartition

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'[AdtServer].dvAll5') and
        objectproperty(id, N'IsView') = 1)
    drop view [AdtServer].dvAll5

exec (@vchStmt)
go


/******************************************************************************
 *
 * Create or update dvHeader, the view across all partition views with no dtString joins
 *
 *****************************************************************************/

declare @iIsFirst int
declare @vchStmt nvarchar(max)
declare @vchPartitionId nchar(36)
declare cPartition cursor for
	select PartitionId from dtPartition order by PartitionCloseTime desc

set @iIsFirst = 1
set @vchStmt = N'create view [AdtServer].dvHeader as'

open cPartition
fetch next from cPartition into @vchPartitionId
while @@fetch_status = 0
begin
    if @iIsFirst = 0
        set @vchStmt =  @vchStmt + N' union all'
    set @vchStmt =  @vchStmt + N' select * from dvHeader_' + @vchPartitionId
    set @iIsFirst = 0
    fetch next from cPartition into @vchPartitionId
end
close cPartition
deallocate cPartition

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'[AdtServer].dvHeader') and
        objectproperty(id, N'IsView') = 1)
    drop view [AdtServer].dvHeader

exec (@vchStmt)
go


/******************************************************************************
 *
 * Create or update dvUserClaims, the view across all partition views
 *
 *****************************************************************************/

declare @iIsFirst int
declare @vchStmt nvarchar(max)
declare @vchPartitionId nchar(36)
declare cPartition cursor for
	select PartitionId from dtPartition order by PartitionCloseTime desc

set @iIsFirst = 1
set @vchStmt = N'create view [AdtServer].dvUserClaims as'

open cPartition
fetch next from cPartition into @vchPartitionId
while @@fetch_status = 0
begin
    if @iIsFirst = 0
        set @vchStmt =  @vchStmt + N' union all'
    set @vchStmt =  @vchStmt + N' select * from dvUserClaims_' + @vchPartitionId
    set @iIsFirst = 0
    fetch next from cPartition into @vchPartitionId
end
close cPartition
deallocate cPartition

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'[AdtServer].dvUserClaims') and
        objectproperty(id, N'IsView') = 1)
    drop view [AdtServer].dvUserClaims

exec (@vchStmt)
go


/******************************************************************************
 *
 * Create or update dvDeviceClaims, the view across all partition views
 *
 *****************************************************************************/

declare @iIsFirst int
declare @vchStmt nvarchar(max)
declare @vchPartitionId nchar(36)
declare cPartition cursor for
	select PartitionId from dtPartition order by PartitionCloseTime desc

set @iIsFirst = 1
set @vchStmt = N'create view [AdtServer].dvDeviceClaims as'

open cPartition
fetch next from cPartition into @vchPartitionId
while @@fetch_status = 0
begin
    if @iIsFirst = 0
        set @vchStmt =  @vchStmt + N' union all'
    set @vchStmt =  @vchStmt + N' select * from dvDeviceClaims_' + @vchPartitionId
    set @iIsFirst = 0
    fetch next from cPartition into @vchPartitionId
end
close cPartition
deallocate cPartition

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'[AdtServer].dvDeviceClaims') and
        objectproperty(id, N'IsView') = 1)
    drop view [AdtServer].dvDeviceClaims

exec (@vchStmt)
go


/******************************************************************************
 *
 * Create or update dvOldResourceAttributes, the view across all partition views
 *
 *****************************************************************************/

declare @iIsFirst int
declare @vchStmt nvarchar(max)
declare @vchPartitionId nchar(36)
declare cPartition cursor for
	select PartitionId from dtPartition order by PartitionCloseTime desc

set @iIsFirst = 1
set @vchStmt = N'create view [AdtServer].dvOldResourceAttributes as'

open cPartition
fetch next from cPartition into @vchPartitionId
while @@fetch_status = 0
begin
    if @iIsFirst = 0
        set @vchStmt =  @vchStmt + N' union all'
    set @vchStmt =  @vchStmt + N' select * from dvOldResourceAttributes_' + @vchPartitionId
    set @iIsFirst = 0
    fetch next from cPartition into @vchPartitionId
end
close cPartition
deallocate cPartition

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'[AdtServer].dvOldResourceAttributes') and
        objectproperty(id, N'IsView') = 1)
    drop view [AdtServer].dvOldResourceAttributes

exec (@vchStmt)
go

/******************************************************************************
 *
 * Create or update dvNewResourceAttributes, the view across all partition views
 *
 *****************************************************************************/

declare @iIsFirst int
declare @vchStmt nvarchar(max)
declare @vchPartitionId nchar(36)
declare cPartition cursor for
	select PartitionId from dtPartition order by PartitionCloseTime desc

set @iIsFirst = 1
set @vchStmt = N'create view [AdtServer].dvNewResourceAttributes as'

open cPartition
fetch next from cPartition into @vchPartitionId
while @@fetch_status = 0
begin
    if @iIsFirst = 0
        set @vchStmt =  @vchStmt + N' union all'
    set @vchStmt =  @vchStmt + N' select * from dvNewResourceAttributes_' + @vchPartitionId
    set @iIsFirst = 0
    fetch next from cPartition into @vchPartitionId
end
close cPartition
deallocate cPartition

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'[AdtServer].dvNewResourceAttributes') and
        objectproperty(id, N'IsView') = 1)
    drop view [AdtServer].dvNewResourceAttributes

exec (@vchStmt)
go

/******************************************************************************
 *
 * Call user defined stored procedure.
 *
 *****************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'spOnCreatePartition') and
            objectproperty(id, N'IsProcedure') = 1)
    execute spOnCreatePartition N'!g!'
go
