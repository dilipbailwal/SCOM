/******************************************************************************
 *
 * Partition !g!
 *
 * Handle closing of active partition.
 * This should only be called if the status is neither 0 or 2
 * Valid status values are 1, 100-109
 *
 ******************************************************************************/

/******************************************************************************
 *
 * Start the closing process
 *
 ******************************************************************************/

declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 100)
    begin
        declare @dtTime datetime

        if 0 = (select max(Value) from dtConfig where Id = 1)
            set @dtTime = getutcdate()
        else
            set @dtTime = getdate()
        update dtPartition
            set
                Status              = 100, -- 100: ready to index
                PartitionCloseTime  = @dtTime
            where
                PartitionId = N'!g!'
    end
go

/******************************************************************************
 *
 * Set times for oldest and newest event in dtPartition and
 * add time constraints in dtEvent.
 * We always check for this
 *
 ******************************************************************************/

declare @dtCreationMin datetime
declare @dtCreationMax datetime
declare @dtCollectionMin datetime
declare @dtCollectionMax datetime

declare @dtCurrentCreationMin datetime
declare @dtCurrentCreationMax datetime
declare @dtCurrentCollectionMin datetime
declare @dtCurrentCollectionMax datetime

set @dtCurrentCreationMin = (select FirstCreationTime from dtPartition where PartitionId = N'!g!')
set @dtCurrentCreationMax = (select LastCreationTime from dtPartition where PartitionId = N'!g!')
set @dtCurrentCollectionMin = (select FirstCollectionTime from dtPartition where PartitionId = N'!g!')
set @dtCurrentCollectionMax = (select LastCollectionTime from dtPartition where PartitionId = N'!g!')

if (@dtCurrentCreationMin is null or @dtCurrentCreationMin = '20000101 00:00:00.000')
    begin
        set @dtCreationMin = (select min(CreationTime) from dtEvent_!g!)
        if @dtCreationMin is null
            set @dtCreationMin = '20000101 00:00:00.000'
    end
else
    set @dtCreationMin = @dtCurrentCreationMin

if (@dtCurrentCreationMax is null or @dtCurrentCreationMax = '20000101 00:00:00.000')
    begin
        set @dtCreationMax = (select max(CreationTime) from dtEvent_!g!)
        if @dtCreationMax is null
            set @dtCreationMax = '20000101 00:00:00.000'
    end
else
    set @dtCreationMax = @dtCurrentCreationMax

if (@dtCurrentCollectionMin is null or @dtCurrentCollectionMin = '20000101 00:00:00.000')
    begin
        set @dtCollectionMin = (select min(CollectionTime) from dtEvent_!g!)
        if @dtCollectionMin is null
            set @dtCollectionMin = '20000101 00:00:00.000'
    end
else
    set @dtCollectionMin = @dtCurrentCollectionMin

if (@dtCurrentCollectionMax is null or @dtCurrentCollectionMax = '20000101 00:00:00.000')
    begin
        set @dtCollectionMax = (select max(CollectionTime) from dtEvent_!g!)
        if @dtCollectionMax is null
            set @dtCollectionMax = '20000101 00:00:00.000'
    end
else
    set @dtCollectionMax = @dtCurrentCollectionMax


-- update the partition table entry

update dtPartition
    set
        FirstCreationTime   = @dtCreationMin,
        LastCreationTime    = @dtCreationMax,
        FirstCollectionTime = @dtCollectionMin,
        LastCollectionTime  = @dtCollectionMax
    where
        PartitionId = N'!g!'


-- add/update constraints for the time fields of the events table to
-- assist the query optimizer with selecting only relevant partitions
-- from the union of all partitions for time-constrained queries

if exists (select * from dbo.sysobjects
            where id = object_id(N'chCreationTime_!g!') and
            objectproperty(id, N'IsCheckCnst') = 1)
    alter table dbo.dtEvent_!g! drop constraint chCreationTime_!g!

if exists (select * from dbo.sysobjects
            where id = object_id(N'chCollectionTime_!g!') and
            objectproperty(id, N'IsCheckCnst') = 1)
    alter table dbo.dtEvent_!g! drop constraint chCollectionTime_!g!

declare @cmd nvarchar(2000)

set @cmd = 
'alter table dbo.dtEvent_!g! with check add
    constraint chCreationTime_!g!   check (CreationTime   >= ''' + convert(nvarchar(23), @dtCreationMin,   126) + ''' and CreationTime   <= ''' + convert(nvarchar(23), @dtCreationMax,   126) + '''),
    constraint chCollectionTime_!g! check (CollectionTime >= ''' + convert(nvarchar(23), @dtCollectionMin, 126) + ''' and CollectionTime <= ''' + convert(nvarchar(23), @dtCollectionMax, 126) + ''')'

execute(@cmd)
go


/******************************************************************************
 *
 * Reindex tables
 *
 *****************************************************************************/

declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 101)
    begin
    if 0 <> (select max(Value) from dtConfig where Id = 3)
        if 3 = serverproperty('EngineEdition')
            begin
                declare @online varchar(10)
                set @online = 'on'
                execute ('alter index all on dtString_!g!    rebuild with (online = ' + @online + ')')
            end
        else
            alter index all on dtString_!g!    rebuild
    update dtPartition
        set
            Status              = 101 -- 101: index 1 created
        where
            PartitionId = N'!g!'
    end
go

declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 102)
    begin
    if 0 <> (select max(Value) from dtConfig where Id = 3)
        if 3 = serverproperty('EngineEdition')
            begin
                declare @online varchar(10)
                set @online = 'on'
                execute ('alter index all on dtPrincipal_!g! rebuild with (online = ' + @online + ')')
            end
        else
            alter index all on dtPrincipal_!g! rebuild
    update dtPartition
        set
            Status              = 102 -- 102: index 2 created
        where
            PartitionId = N'!g!'
    end
go

declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 103)
    begin
    if 0 <> (select max(Value) from dtConfig where Id = 3)
        if 3 = serverproperty('EngineEdition')
            begin
                declare @online varchar(10)
                set @online = 'on'
                execute ('alter index all on dtEvent_!g! rebuild with (online = ' + @online + ')')
            end
        else
            alter index all on dtEvent_!g!     rebuild
    update dtPartition
        set
            Status              = 103 -- 103: index 3 created
        where
            PartitionId = N'!g!'
    end
go

declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 104)
    begin
    if 0 <> (select max(Value) from dtConfig where Id = 3)
        alter index all on dtEventData_!g! rebuild
    update dtPartition
        set
            Status              = 104 -- 104: index 4 created
        where
            PartitionId = N'!g!'
    end
go


declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 105)
begin
    declare @indexName nvarchar(80)
    set @indexName = (select name from sys.indexes where name = 'ixString01_!g!')
    if @indexName is null
    begin
        if 0 <> (select max(Value) from dtConfig where Id = 3)
        begin
            if 3 = serverproperty('EngineEdition')
            begin
                declare @online varchar(10)
                set @online = 'on'
                execute ('create nonclustered index ixString01_!g! on dtEvent_!g! (StringId01 asc) with (online = ' + @online + ', allow_page_locks = off)')
            end
            else
                create nonclustered index ixString01_!g! on dtEvent_!g! (StringId01 asc) with (allow_page_locks = off)
        end
    end
    update dtPartition
        set
            Status              = 105 -- 105: index 5 created
        where
            PartitionId = N'!g!'
end
go

declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 106)
begin
    declare @indexName nvarchar(80)
    set @indexName = (select name from sys.indexes where name = 'ixString02_!g!')
    if @indexName is null
    begin
        if 0 <> (select max(Value) from dtConfig where Id = 3)
        begin
            if 3 = serverproperty('EngineEdition')
            begin
                declare @online varchar(10)
                set @online = 'on'
                execute ('create nonclustered index ixString02_!g! on dtEvent_!g! (StringId02 asc) with (online = ' + @online + ', allow_page_locks = off)')
            end
            else
                create nonclustered index ixString02_!g! on dtEvent_!g! (StringId02 asc) with (allow_page_locks = off)
        end
    end
    update dtPartition
        set
            Status              = 106 -- 106: index 6 created
        where
            PartitionId = N'!g!'
end
go

declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 107)
begin
    declare @indexName nvarchar(80)
    set @indexName = (select name from sys.indexes where name = 'ixString03_!g!')
    if @indexName is null
    begin
        if 0 <> (select max(Value) from dtConfig where Id = 3)
        begin
            if 3 = serverproperty('EngineEdition')
            begin
                declare @online varchar(10)
                set @online = 'on'
                execute ('create nonclustered index ixString03_!g! on dtEvent_!g! (StringId03 asc) with (online = ' + @online + ', allow_page_locks = off)')
            end
            else
                create nonclustered index ixString03_!g! on dtEvent_!g! (StringId03 asc) with (allow_page_locks = off)
        end
    end
    update dtPartition
        set
            Status              = 107 -- 107: index 7 created
        where
            PartitionId = N'!g!'
end
go

declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 108)
begin
    declare @indexName nvarchar(80)
    set @indexName = (select name from sys.indexes where name = 'ixString04_!g!')
    if @indexName is null
    begin
        if 0 <> (select max(Value) from dtConfig where Id = 3)
        begin
            if 3 = serverproperty('EngineEdition')
            begin
                declare @online varchar(10)
                set @online = 'on'
                execute ('create nonclustered index ixString04_!g! on dtEvent_!g! (StringId04 asc) with (online = ' + @online + ', allow_page_locks = off)')
            end
            else
                create nonclustered index ixString04_!g! on dtEvent_!g! (StringId04 asc) with (allow_page_locks = off)
        end
    end
    update dtPartition
        set
            Status              = 108 -- 108: index 8 created
        where
            PartitionId = N'!g!'
end
go

declare @iStatus    int -- current status of the partition

set @iStatus = (select Status from dtPartition where PartitionId = N'!g!')

if @iStatus is null
    set @iStatus = 1

if (@iStatus < 109)
begin
    declare @indexName nvarchar(80)
    set @indexName = (select name from sys.indexes where name = 'ixString05_!g!')
    if @indexName is null
    begin
        if 0 <> (select max(Value) from dtConfig where Id = 3)
        begin
            if 3 = serverproperty('EngineEdition')
            begin
                declare @online varchar(10)
                set @online = 'on'
                execute ('create nonclustered index ixString05_!g! on dtEvent_!g! (StringId05 asc) with (online = ' + @online + ', allow_page_locks = off)')
            end
            else
                create nonclustered index ixString05_!g! on dtEvent_!g! (StringId05 asc) with (allow_page_locks = off)
        end
    end
    update dtPartition
        set
            Status              = 109 -- 109: index 9 created
        where
            PartitionId = N'!g!'
end
go

/******************************************************************************
 *
 * Execute user-defined stored proc
 *
 *****************************************************************************/

if exists (
    select * from dbo.sysobjects where
        id = object_id(N'spOnClosePartition') and
        objectproperty(id, N'IsProcedure') = 1)
    execute spOnClosePartition N'!g!'
go
