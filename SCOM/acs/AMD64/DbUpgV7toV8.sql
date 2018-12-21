/******************************************************************************
 *
 * DbUpgV7toV8.sql
 *
 * Updates ACS DB schema from V7 to V8
 *
 ******************************************************************************/

declare @iVersion    int -- current schema version

set @iVersion = (select Value from dtConfig where Id = 2)

if (@iVersion = 7)
begin
    begin tran

    -- update description for existing category
    if exists (select * from dtCategory where Id = 0)
        update dtCategory set Description = N'ACS' where Id = 0
    else
        insert into dtCategory  (Id, Description)                   values (0, N'ACS')

    -- insert new category entries
    if not exists (select * from dtCategory where Id = 101)
        insert into dtCategory  (Id, Description)                   values (   101, N'Event processing')
    if not exists (select * from dtCategory where Id = 103)
        insert into dtCategory  (Id, Description)                   values (   103, N'Service shutdown')
    if not exists (select * from dtCategory where Id = 0x3109)
        insert into dtCategory  (Id, Description)                   values (0x3109, N'User / Device Claims')
    if not exists (select * from dtCategory where Id = 0x320D)
        insert into dtCategory  (Id, Description)                   values (0x320D, N'Central Access Policy Staging')

    -- create empty dtClaimString_!g! dtOldResourceAttribute_!g! dtNewResourceAttribute_!g! dtUserClaim_!g! dtDeviceClaim_!g! tables
    declare @vchStmt nvarchar(max)
    declare @vchPartitionId nchar(36)
    declare cPartition cursor for
        select PartitionId from dtPartition order by PartitionCloseTime desc

    open cPartition
    fetch next from cPartition into @vchPartitionId
    while @@fetch_status = 0
    begin
        set @vchStmt =  N'create table dtClaimString_' + @vchPartitionId + N' '
        set @vchStmt =  @vchStmt + N'('
        set @vchStmt =  @vchStmt + N'Id int not null constraint pkClaimString_' + @vchPartitionId + ' primary key identity     (0,1),'
        set @vchStmt =  @vchStmt + N'Hash                     binary(20)      not null,'
        set @vchStmt =  @vchStmt + N'strClaimId               nvarchar(max)   not null,'
        set @vchStmt =  @vchStmt + N'strClaimDisplayName      nvarchar(max)   not null,'
        set @vchStmt =  @vchStmt + N'strClaimValue            nvarchar(max)   not null,'
        set @vchStmt =  @vchStmt + N'strClaimValueDisplayName nvarchar(max)   not null'
        set @vchStmt =  @vchStmt + N')'

        exec (@vchStmt)

        set @vchStmt =  N'create table dtOldResourceAttribute_' + @vchPartitionId + N' '
        set @vchStmt =  @vchStmt + N'('
        set @vchStmt =  @vchStmt + N'EventId         bigint      not null,'
        set @vchStmt =  @vchStmt + N'CreationTime    datetime    not null,'
        set @vchStmt =  @vchStmt + N'ClaimId         int         not null    constraint fkOldResourceAttributeClaimId_' + @vchPartitionId + N' references dtClaimString_' + @vchPartitionId + N' (Id),'
        set @vchStmt =  @vchStmt + N')'

        exec (@vchStmt)

        set @vchStmt =  N'create table dtNewResourceAttribute_' + @vchPartitionId + N' '
        set @vchStmt =  @vchStmt + N'('
        set @vchStmt =  @vchStmt + N'EventId         bigint      not null,'
        set @vchStmt =  @vchStmt + N'CreationTime    datetime    not null,'
        set @vchStmt =  @vchStmt + N'ClaimId         int         not null    constraint fkNewResourceAttributeClaimId_' + @vchPartitionId + N' references dtClaimString_' + @vchPartitionId + N' (Id),'
        set @vchStmt =  @vchStmt + N')'

        exec (@vchStmt)

        set @vchStmt =  N'create table dtUserClaim_' + @vchPartitionId + N' '
        set @vchStmt =  @vchStmt + N'('
        set @vchStmt =  @vchStmt + N'EventId         bigint      not null,'
        set @vchStmt =  @vchStmt + N'CreationTime    datetime    not null,'
        set @vchStmt =  @vchStmt + N'ClaimId         int         not null    constraint fkUserClaimClaimId_' + @vchPartitionId + N' references dtClaimString_' + @vchPartitionId + N' (Id),'
        set @vchStmt =  @vchStmt + N')'

        exec (@vchStmt)

        set @vchStmt =  N'create table dtDeviceClaim_' + @vchPartitionId + N' '
        set @vchStmt =  @vchStmt + N'('
        set @vchStmt =  @vchStmt + N'EventId         bigint      not null,'
        set @vchStmt =  @vchStmt + N'CreationTime    datetime    not null,'
        set @vchStmt =  @vchStmt + N'ClaimId         int         not null    constraint fkDeviceClaimClaimId_' + @vchPartitionId + N' references dtClaimString_' + @vchPartitionId + N' (Id),'
        set @vchStmt =  @vchStmt + N')'

        exec (@vchStmt)

        fetch next from cPartition into @vchPartitionId
    end

    close cPartition
    deallocate cPartition

    -- create empty dvUserClaims_!g! dvDeviceClaims_!g! dvNewResourceAttribute_!g! dvOldResourceAttribute_!g! views
    declare cPartition cursor for
        select PartitionId from dtPartition order by PartitionCloseTime desc

    open cPartition
    fetch next from cPartition into @vchPartitionId
    while @@fetch_status = 0
    begin
        set @vchStmt =  N'create view dvUserClaims_' + @vchPartitionId + N' '
        set @vchStmt =  @vchStmt + N'as '
        set @vchStmt =  @vchStmt + N'select '
        set @vchStmt =  @vchStmt + N'    uc.EventId as EventId, '
        set @vchStmt =  @vchStmt + N'    uc.CreationTime as CreationTime, '
        set @vchStmt =  @vchStmt + N'    ucs.strClaimId as UserClaimId, '
        set @vchStmt =  @vchStmt + N'    ucs.strClaimDisplayName as UserClaimDisplayName, '
        set @vchStmt =  @vchStmt + N'    ucs.strClaimValue as UserClaimValue, '
        set @vchStmt =  @vchStmt + N'    ucs.strClaimValueDisplayName as UserClaimValueDisplayName '
        set @vchStmt =  @vchStmt + N'FROM '
        set @vchStmt =  @vchStmt + N'    dtUserClaim_' + @vchPartitionId + ' as uc '
        set @vchStmt =  @vchStmt + N'    inner join dtClaimString_' + @vchPartitionId + ' ucs on ucs.Id = uc.ClaimId '

        exec (@vchStmt)

        set @vchStmt =  N'create view dvDeviceClaims_' + @vchPartitionId + N' '
        set @vchStmt =  @vchStmt + N'as '
        set @vchStmt =  @vchStmt + N'select '
        set @vchStmt =  @vchStmt + N'    dc.EventId as EventId, '
        set @vchStmt =  @vchStmt + N'    dc.CreationTime as CreationTime, '
        set @vchStmt =  @vchStmt + N'    dcs.strClaimId as DeviceClaimId, '
        set @vchStmt =  @vchStmt + N'    dcs.strClaimDisplayName as DeviceClaimDisplayName, '
        set @vchStmt =  @vchStmt + N'    dcs.strClaimValue as DeviceClaimValue, '
        set @vchStmt =  @vchStmt + N'    dcs.strClaimValueDisplayName as DeviceClaimValueDisplayName '
        set @vchStmt =  @vchStmt + N'FROM '
        set @vchStmt =  @vchStmt + N'    dtDeviceClaim_' + @vchPartitionId + ' as dc '
        set @vchStmt =  @vchStmt + N'    inner join dtClaimString_' + @vchPartitionId + ' dcs on dcs.Id = dc.ClaimId '

        exec (@vchStmt)

        set @vchStmt =  N'create view dvNewResourceAttributes_' + @vchPartitionId + N' '
        set @vchStmt =  @vchStmt + N'as '
        set @vchStmt =  @vchStmt + N'select '
        set @vchStmt =  @vchStmt + N'    nra.EventId as EventId, '
        set @vchStmt =  @vchStmt + N'    nra.CreationTime as CreationTime, '
        set @vchStmt =  @vchStmt + N'    ncs.strClaimId as NewClaimId, '
        set @vchStmt =  @vchStmt + N'    ncs.strClaimDisplayName as NewClaimDisplayName, '
        set @vchStmt =  @vchStmt + N'    ncs.strClaimValue as NewClaimValue, '
        set @vchStmt =  @vchStmt + N'    ncs.strClaimValueDisplayName as NewClaimValueDisplayName '
        set @vchStmt =  @vchStmt + N'FROM '
        set @vchStmt =  @vchStmt + N'    dtNewResourceAttribute_' + @vchPartitionId + ' as nra '
        set @vchStmt =  @vchStmt + N'    inner join dtClaimString_' + @vchPartitionId + ' ncs on ncs.Id = nra.ClaimId '

        exec (@vchStmt)

        set @vchStmt =  N'create view dvOldResourceAttributes_' + @vchPartitionId + N' '
        set @vchStmt =  @vchStmt + N'as '
        set @vchStmt =  @vchStmt + N'select '
        set @vchStmt =  @vchStmt + N'    nra.EventId as EventId, '
        set @vchStmt =  @vchStmt + N'    nra.CreationTime as CreationTime, '
        set @vchStmt =  @vchStmt + N'    ncs.strClaimId as OldClaimId, '
        set @vchStmt =  @vchStmt + N'    ncs.strClaimDisplayName as OldClaimDisplayName, '
        set @vchStmt =  @vchStmt + N'    ncs.strClaimValue as OldClaimValue, '
        set @vchStmt =  @vchStmt + N'    ncs.strClaimValueDisplayName as OldClaimValueDisplayName '
        set @vchStmt =  @vchStmt + N'FROM '
        set @vchStmt =  @vchStmt + N'    dtOldResourceAttribute_' + @vchPartitionId + ' as nra '
        set @vchStmt =  @vchStmt + N'    inner join dtClaimString_' + @vchPartitionId + ' ncs on ncs.Id = nra.ClaimId '

        exec (@vchStmt)

        fetch next from cPartition into @vchPartitionId
    end

    close cPartition
    deallocate cPartition

    -- mark all active partitions for closing
    if (select count(*) from dtPartition where Status = 0) > 0
        update dtPartition set Status = 1 where Status = 0

    -- update schema version
    update dtConfig set Value = 8 where Id = 2
    commit tran
end
go
