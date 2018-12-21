/******************************************************************************
 *
 * Partition !g!
 *
 * Handle closing of active partition.
 *
 ******************************************************************************/


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
