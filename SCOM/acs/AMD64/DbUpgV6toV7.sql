/******************************************************************************
 *
 * DbUpgV6toV7.sql
 *
 * Updates ACS DB schema from V6 to V7
 *
 ******************************************************************************/

declare @iVersion    int -- current schema version

set @iVersion = (select Value from dtConfig where Id = 2)

if (@iVersion = 6)
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
    if not exists (select * from dtCategory where Id = 0x3000)
        insert into dtCategory  (Id, Description)                   values (0x3000, N'SYSTEM_SECURITYSTATECHANGE')
    if not exists (select * from dtCategory where Id = 0x3001)
        insert into dtCategory  (Id, Description)                   values (0x3001, N'SYSTEM_SECURITYSUBSYSTEMEXTENSION')
    if not exists (select * from dtCategory where Id = 0x3002)
        insert into dtCategory  (Id, Description)                   values (0x3002, N'SYSTEM_INTEGRITY')
    if not exists (select * from dtCategory where Id = 0x3003)
        insert into dtCategory  (Id, Description)                   values (0x3003, N'SYSTEM_IPSECDRIVEREVENTS')
    if not exists (select * from dtCategory where Id = 0x3004)
        insert into dtCategory  (Id, Description)                   values (0x3004, N'SYSTEM_OTHERS')
    if not exists (select * from dtCategory where Id = 0x3100)
        insert into dtCategory  (Id, Description)                   values (0x3100, N'LOGON_LOGON')
    if not exists (select * from dtCategory where Id = 0x3101)
        insert into dtCategory  (Id, Description)                   values (0x3101, N'LOGON_LOGOFF')
    if not exists (select * from dtCategory where Id = 0x3102)
        insert into dtCategory  (Id, Description)                   values (0x3102, N'LOGON_ACCOUNTLOCKOUT')
    if not exists (select * from dtCategory where Id = 0x3103)
        insert into dtCategory  (Id, Description)                   values (0x3103, N'LOGON_IPSECMAINMODE')
    if not exists (select * from dtCategory where Id = 0x3104)
        insert into dtCategory  (Id, Description)                   values (0x3104, N'LOGON_SPECIALLOGON')
    if not exists (select * from dtCategory where Id = 0x3105)
        insert into dtCategory  (Id, Description)                   values (0x3105, N'LOGON_IPSECQUICKMODE')
    if not exists (select * from dtCategory where Id = 0x3106)
        insert into dtCategory  (Id, Description)                   values (0x3106, N'LOGON_IPSECUSERMODE')
    if not exists (select * from dtCategory where Id = 0x3107)
        insert into dtCategory  (Id, Description)                   values (0x3107, N'LOGON_OTHERS')
    if not exists (select * from dtCategory where Id = 0x3108)
        insert into dtCategory  (Id, Description)                   values (0x3108, N'LOGON_NPS')
    if not exists (select * from dtCategory where Id = 0x3109)
        insert into dtCategory  (Id, Description)                   values (0x3109, N'User / Device Claims')
    if not exists (select * from dtCategory where Id = 0x3200)
        insert into dtCategory  (Id, Description)                   values (0x3200, N'OBJECTACCESS_FILESYSTEM')
    if not exists (select * from dtCategory where Id = 0x3201)
        insert into dtCategory  (Id, Description)                   values (0x3201, N'OBJECTACCESS_REGISTRY')
    if not exists (select * from dtCategory where Id = 0x3202)
        insert into dtCategory  (Id, Description)                   values (0x3202, N'OBJECTACCESS_KERNEL')
    if not exists (select * from dtCategory where Id = 0x3203)
        insert into dtCategory  (Id, Description)                   values (0x3203, N'OBJECTACCESS_SAM')
    if not exists (select * from dtCategory where Id = 0x3204)
        insert into dtCategory  (Id, Description)                   values (0x3204, N'OBJECTACCESS_OTHER')
    if not exists (select * from dtCategory where Id = 0x3205)
        insert into dtCategory  (Id, Description)                   values (0x3205, N'OBJECTACCESS_CERTIFICATIONAUTHORITY')
    if not exists (select * from dtCategory where Id = 0x3206)
        insert into dtCategory  (Id, Description)                   values (0x3206, N'OBJECTACCESS_APPLICATIONGENERATED')
    if not exists (select * from dtCategory where Id = 0x3207)
        insert into dtCategory  (Id, Description)                   values (0x3207, N'OBJECTACCESS_HANDLE')
    if not exists (select * from dtCategory where Id = 0x3208)
        insert into dtCategory  (Id, Description)                   values (0x3208, N'OBJECTACCESS_SHARE')
    if not exists (select * from dtCategory where Id = 0x3209)
        insert into dtCategory  (Id, Description)                   values (0x3209, N'OBJECTACCESS_FIREWALLPACKETDROPS')
    if not exists (select * from dtCategory where Id = 0x320A)
        insert into dtCategory  (Id, Description)                   values (0x320A, N'OBJECTACCESS_FIREWALLCONNECTION')
    if not exists (select * from dtCategory where Id = 0x320B)
        insert into dtCategory  (Id, Description)                   values (0x320B, N'OBJECTACCESS_DETAILEDFILESHARE')
    if not exists (select * from dtCategory where Id = 0x320D)
        insert into dtCategory  (Id, Description)                   values (0x320D, N'Central Access Policy Staging')
    if not exists (select * from dtCategory where Id = 0x3300)
        insert into dtCategory  (Id, Description)                   values (0x3300, N'PRIVILEGEUSE_SENSITIVE')
    if not exists (select * from dtCategory where Id = 0x3301)
        insert into dtCategory  (Id, Description)                   values (0x3301, N'PRIVILEGEUSE_NONSENSITIVE')
    if not exists (select * from dtCategory where Id = 0x3302)
        insert into dtCategory  (Id, Description)                   values (0x3302, N'PRIVILEGEUSE_OTHERS')
    if not exists (select * from dtCategory where Id = 0x3400)
        insert into dtCategory  (Id, Description)                   values (0x3400, N'DETAILEDTRACKING_PROCESSCREATION')
    if not exists (select * from dtCategory where Id = 0x3401)
        insert into dtCategory  (Id, Description)                   values (0x3401, N'DETAILEDTRACKING_PROCESSTERMINATION')
    if not exists (select * from dtCategory where Id = 0x3402)
        insert into dtCategory  (Id, Description)                   values (0x3402, N'DETAILEDTRACKING_DPAPIACTIVITY')
    if not exists (select * from dtCategory where Id = 0x3403)
        insert into dtCategory  (Id, Description)                   values (0x3403, N'DETAILEDTRACKING_RPCCALL')
    if not exists (select * from dtCategory where Id = 0x3500)
        insert into dtCategory  (Id, Description)                   values (0x3500, N'POLICYCHANGE_AUDITPOLICY')
    if not exists (select * from dtCategory where Id = 0x3501)
        insert into dtCategory  (Id, Description)                   values (0x3501, N'POLICYCHANGE_AUTHENTICATIONPOLICY')
    if not exists (select * from dtCategory where Id = 0x3502)
        insert into dtCategory  (Id, Description)                   values (0x3502, N'POLICYCHANGE_AUTHORIZATIONPOLICY')
    if not exists (select * from dtCategory where Id = 0x3503)
        insert into dtCategory  (Id, Description)                   values (0x3503, N'POLICYCHANGE_MPSSCVRULEPOLICY')
    if not exists (select * from dtCategory where Id = 0x3504)
        insert into dtCategory  (Id, Description)                   values (0x3504, N'POLICYCHANGE_WFPIPSECPOLICY')
    if not exists (select * from dtCategory where Id = 0x3505)
        insert into dtCategory  (Id, Description)                   values (0x3505, N'POLICYCHANGE_OTHERS')
    if not exists (select * from dtCategory where Id = 0x3600)
        insert into dtCategory  (Id, Description)                   values (0x3600, N'ACCOUNTMANAGEMENT_USERACCOUNT')
    if not exists (select * from dtCategory where Id = 0x3601)
        insert into dtCategory  (Id, Description)                   values (0x3601, N'ACCOUNTMANAGEMENT_COMPUTERACCOUNT')
    if not exists (select * from dtCategory where Id = 0x3602)
        insert into dtCategory  (Id, Description)                   values (0x3602, N'ACCOUNTMANAGEMENT_SECURITYGROUP')
    if not exists (select * from dtCategory where Id = 0x3603)
        insert into dtCategory  (Id, Description)                   values (0x3603, N'ACCOUNTMANAGEMENT_DISTRIBUTIONGROUP')
    if not exists (select * from dtCategory where Id = 0x3604)
        insert into dtCategory  (Id, Description)                   values (0x3604, N'ACCOUNTMANAGEMENT_APPLICATIONGROUP')
    if not exists (select * from dtCategory where Id = 0x3605)
        insert into dtCategory  (Id, Description)                   values (0x3605, N'ACCOUNTMANAGEMENT_OTHERS')
    if not exists (select * from dtCategory where Id = 0x3700)
        insert into dtCategory  (Id, Description)                   values (0x3700, N'DSACCESS_DSACCESS')
    if not exists (select * from dtCategory where Id = 0x3701)
        insert into dtCategory  (Id, Description)                   values (0x3701, N'DSACCESS_DSCHANGES')
    if not exists (select * from dtCategory where Id = 0x3702)
        insert into dtCategory  (Id, Description)                   values (0x3702, N'DS_REPLICATION')
    if not exists (select * from dtCategory where Id = 0x3703)
        insert into dtCategory  (Id, Description)                   values (0x3703, N'DS_DETAILED_REPLICATION')
    if not exists (select * from dtCategory where Id = 0x3800)
        insert into dtCategory  (Id, Description)                   values (0x3800, N'ACCOUNTLOGON_CREDENTIALVALIDATION')
    if not exists (select * from dtCategory where Id = 0x3801)
        insert into dtCategory  (Id, Description)                   values (0x3801, N'ACCOUNTLOGON_KERBEROS')
    if not exists (select * from dtCategory where Id = 0x3802)
        insert into dtCategory  (Id, Description)                   values (0x3802, N'ACCOUNTLOGON_OTHERS')
    if not exists (select * from dtCategory where Id = 0x3803)
        insert into dtCategory  (Id, Description)                   values (0x3803, N'ACCOUNTLOGON_KERBCREDENTIALVALIDATION')
    if not exists (select * from dtCategory where Id = 0xff00)
        insert into dtCategory  (Id, Description)                   values (0xff00, N'UNKNOWN_SUBCATEGORY')

    -- mark all active partitions for closing
    if (select count(*) from dtPartition where Status = 0) > 0
        update dtPartition set Status = 1 where Status = 0

    -- update schema version
    update dtConfig set Value = 7 where Id = 2
    commit tran
end
go

-- drop stored procedure spInsertCategory
if exists (select * from dbo.sysobjects
            where id = object_id(N'spInsertCategory') and
            objectproperty(id, N'IsProcedure') = 1)
    drop procedure spInsertCategory
go

-- (re-) create stored procedure spInsertCategory
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
