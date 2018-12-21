/******************************************************************************
 *
 * Partition !g!
 *
 ******************************************************************************/


/******************************************************************************
 *
 * Call user defined stored procedure.
 *
 *****************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'Delete') and
            objectproperty(id, N'IsProcedure') = 1)
    execute spOnDeletePartition N'!g!'
go


/******************************************************************************
 *
 * Drop partitioned tables.
 *
 *****************************************************************************/

if exists (select * from dbo.sysobjects
            where id = object_id(N'dvAll_!g!') and
            objectproperty(id, N'IsView') = 1)
    drop view dvAll_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dvOldResourceAttributes_!g!') and
            objectproperty(id, N'IsView') = 1)
    drop view dvOldResourceAttributes_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dvNewResourceAttributes_!g!') and
            objectproperty(id, N'IsView') = 1)
    drop view dvNewResourceAttributes_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dvUserClaims_!g!') and
            objectproperty(id, N'IsView') = 1)
    drop view dvUserClaims_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dvDeviceClaims_!g!') and
            objectproperty(id, N'IsView') = 1)
    drop view dvDeviceClaims_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dvAll5_!g!') and
            objectproperty(id, N'IsView') = 1)
    drop view dvAll5_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dvHeader_!g!') and
            objectproperty(id, N'IsView') = 1)
    drop view dvHeader_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dtEventData_!g!') and
            objectproperty(id, N'IsUserTable') = 1)
    drop table dtEventData_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dtEvent_!g!') and
            objectproperty(id, N'IsUserTable') = 1)
    drop table dtEvent_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dtPrincipal_!g!') and
            objectproperty(id, N'IsUserTable') = 1)
    drop table dtPrincipal_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dtOldResourceAttribute_!g!') and
            objectproperty(id, N'IsUserTable') = 1)
    drop table dtOldResourceAttribute_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dtNewResourceAttribute_!g!') and
            objectproperty(id, N'IsUserTable') = 1)
    drop table dtNewResourceAttribute_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dtUserClaim_!g!') and
            objectproperty(id, N'IsUserTable') = 1)
    drop table dtUserClaim_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dtDeviceClaim_!g!') and
            objectproperty(id, N'IsUserTable') = 1)
    drop table dtDeviceClaim_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dtClaimString_!g!') and
            objectproperty(id, N'IsUserTable') = 1)
    drop table dtClaimString_!g!
go

if exists (select * from dbo.sysobjects
            where id = object_id(N'dtString_!g!') and
            objectproperty(id, N'IsUserTable') = 1)
    drop table dtString_!g!
go


/******************************************************************************
 *
 * Delete entry from dtPartition for partition !g!
 *
 *****************************************************************************/

delete from dtPartition where PartitionId = N'!g!'
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

