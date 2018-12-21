/******************************************************************************
 *
 * DbUpgV8toV9.sql
 *
 * Updates ACS DB schema from V8 to V9
 *
 * Just need to close the existing partitions so it will pick up the
 * new lack of constraint on the principal table
 *
 ******************************************************************************/

declare @iVersion    int -- current schema version

set @iVersion = (select Value from dtConfig where Id = 2)

if (@iVersion = 8)
begin
    begin tran

    -- mark all active partitions for closing
    if (select count(*) from dtPartition where Status = 0) > 0
        update dtPartition set Status = 1 where Status = 0

    -- update schema version
    update dtConfig set Value = 9 where Id = 2
    commit tran
end
go
