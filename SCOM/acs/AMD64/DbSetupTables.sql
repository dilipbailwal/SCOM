/******************************************************************************
 *
 * DbAuditTables.sql
 *
 * Creates tables in the audit database.
 * Inserts initial values into the new tables.
 * Note: All Strings are unicode ('N') strings
 *
 ******************************************************************************/



/******************************************************************************
 * Configuration
 *****************************************************************************/

create table dtConfig
(
    Id                  int             not null    constraint pkConfig        primary key,
    -- Configuration value
    Value               int             not null,
    -- Comment on the configuration value
    Comment             nvarchar(256)   not null
)


/******************************************************************************
 * Partitions
 *****************************************************************************/

create table dtPartition
(
    -- PartitionId: Guid in the form 01234567_89ab_cdef_0123_456789abcdef
    PartitionId         nchar(36)       not null    constraint pkPartition     primary key,
    
    -- Status:
    --  0: active, set by collector
    --  1: inactive, mark for closing during collector startup & indexing,
    --     set manually
    --  2: archived, ready for deletion, set from outside the collector
    --  100 - 108: closed, indexing in progress
    --  109: indexing complete
    Status              int             not null,

    PartitionStartTime  datetime        not null,
    PartitionCloseTime  datetime        not null,
    FirstCreationTime   datetime        not null,
    LastCreationTime    datetime        not null,
    FirstCollectionTime datetime        not null,
    LastCollectionTime  datetime        not null
)


/******************************************************************************
 * Categories
 *****************************************************************************/

create table dtCategory
(
    -- Category number
    Id                  int             not null    constraint pkCategory      primary key,
    -- Category name
    Description         nvarchar(64)    not null
)


/******************************************************************************
 * String Types
 *****************************************************************************/

create table dtType
(
    Id                  int             not null    constraint pkType          primary key,
    -- Type name
    Description         nvarchar(64)    not null    constraint unTypeDesc      unique
)


/******************************************************************************
 * Machines
 *****************************************************************************/

create table dtMachine
(
    Id                  int             not null    constraint pkMachine       primary key identity     (0,1),

    -- UTC time this machine was created
    CreationTime        datetime        not null,

    -- SID of the machine
    Sid                 nvarchar(256)   not null    constraint unMachine        unique,

    -- Flat (NT4) Name of the machine
    Description         nvarchar(256)   not null,

    -- Distinguished Name of the machine
    DistinguishedName   nvarchar(512)   not null
)


/******************************************************************************
 * Sources
 *****************************************************************************/

create table dtSource
(
    Id                  int             not null    constraint pkSource         primary key identity     (0,1),
    SourceName          nvarchar(64)    not null,
    LogName             nvarchar(64)    not null,

    constraint unSource     unique (SourceName,LogName)
)


/******************************************************************************
 * Initial values
 *****************************************************************************/
 -- configuration
insert into dtConfig    (Id, Value, Comment)                values (1, 0, N'convert timestamps to local time')
insert into dtConfig    (Id, Value, Comment)                values (2, 9, N'database schema version')
insert into dtConfig    (Id, Value, Comment)                values (3, 1, N'perform index maintenance')
insert into dtConfig    (Id, Value, Comment)                values (4, 0, N'table switch offset in seconds since midnight UTC')
insert into dtConfig    (Id, Value, Comment)                values (5, 0, N'table switch interval in seconds')
insert into dtConfig    (Id, Value, Comment)                values (6, 0, N'number of partitions')

-- category / task values
insert into dtCategory  (Id, Description)                   values (     0, N'ACS')
insert into dtCategory  (Id, Description)                   values (     1, N'System Event')
insert into dtCategory  (Id, Description)                   values (     2, N'Logon/Logoff')
insert into dtCategory  (Id, Description)                   values (     3, N'Object Access')
insert into dtCategory  (Id, Description)                   values (     4, N'Privilege Use')
insert into dtCategory  (Id, Description)                   values (     5, N'Detailed Tracking')
insert into dtCategory  (Id, Description)                   values (     6, N'Policy Change')
insert into dtCategory  (Id, Description)                   values (     7, N'Account Management')
insert into dtCategory  (Id, Description)                   values (     8, N'Directory Service Access')
insert into dtCategory  (Id, Description)                   values (     9, N'Account Logon')
insert into dtCategory  (Id, Description)                   values (   101, N'Event processing')
insert into dtCategory  (Id, Description)                   values (   103, N'Service shutdown')
insert into dtCategory  (Id, Description)                   values (0x3000, N'SYSTEM_SECURITYSTATECHANGE')
insert into dtCategory  (Id, Description)                   values (0x3001, N'SYSTEM_SECURITYSUBSYSTEMEXTENSION')
insert into dtCategory  (Id, Description)                   values (0x3002, N'SYSTEM_INTEGRITY')
insert into dtCategory  (Id, Description)                   values (0x3003, N'SYSTEM_IPSECDRIVEREVENTS')
insert into dtCategory  (Id, Description)                   values (0x3004, N'SYSTEM_OTHERS')
insert into dtCategory  (Id, Description)                   values (0x3100, N'LOGON_LOGON')
insert into dtCategory  (Id, Description)                   values (0x3101, N'LOGON_LOGOFF')
insert into dtCategory  (Id, Description)                   values (0x3102, N'LOGON_ACCOUNTLOCKOUT')
insert into dtCategory  (Id, Description)                   values (0x3103, N'LOGON_IPSECMAINMODE')
insert into dtCategory  (Id, Description)                   values (0x3104, N'LOGON_SPECIALLOGON')
insert into dtCategory  (Id, Description)                   values (0x3105, N'LOGON_IPSECQUICKMODE')
insert into dtCategory  (Id, Description)                   values (0x3106, N'LOGON_IPSECUSERMODE')
insert into dtCategory  (Id, Description)                   values (0x3107, N'LOGON_OTHERS')
insert into dtCategory  (Id, Description)                   values (0x3108, N'LOGON_NPS')
insert into dtCategory  (Id, Description)                   values (0x3109, N'User / Device Claims')
insert into dtCategory  (Id, Description)                   values (0x3200, N'OBJECTACCESS_FILESYSTEM')
insert into dtCategory  (Id, Description)                   values (0x3201, N'OBJECTACCESS_REGISTRY')
insert into dtCategory  (Id, Description)                   values (0x3202, N'OBJECTACCESS_KERNEL')
insert into dtCategory  (Id, Description)                   values (0x3203, N'OBJECTACCESS_SAM')
insert into dtCategory  (Id, Description)                   values (0x3204, N'OBJECTACCESS_OTHER')
insert into dtCategory  (Id, Description)                   values (0x3205, N'OBJECTACCESS_CERTIFICATIONAUTHORITY')
insert into dtCategory  (Id, Description)                   values (0x3206, N'OBJECTACCESS_APPLICATIONGENERATED')
insert into dtCategory  (Id, Description)                   values (0x3207, N'OBJECTACCESS_HANDLE')
insert into dtCategory  (Id, Description)                   values (0x3208, N'OBJECTACCESS_SHARE')
insert into dtCategory  (Id, Description)                   values (0x3209, N'OBJECTACCESS_FIREWALLPACKETDROPS')
insert into dtCategory  (Id, Description)                   values (0x320A, N'OBJECTACCESS_FIREWALLCONNECTION')
insert into dtCategory  (Id, Description)                   values (0x320B, N'OBJECTACCESS_DETAILEDFILESHARE')
insert into dtCategory  (Id, Description)                   values (0x320D, N'Central Access Policy Staging')
insert into dtCategory  (Id, Description)                   values (0x3300, N'PRIVILEGEUSE_SENSITIVE')
insert into dtCategory  (Id, Description)                   values (0x3301, N'PRIVILEGEUSE_NONSENSITIVE')
insert into dtCategory  (Id, Description)                   values (0x3302, N'PRIVILEGEUSE_OTHERS')
insert into dtCategory  (Id, Description)                   values (0x3400, N'DETAILEDTRACKING_PROCESSCREATION')
insert into dtCategory  (Id, Description)                   values (0x3401, N'DETAILEDTRACKING_PROCESSTERMINATION')
insert into dtCategory  (Id, Description)                   values (0x3402, N'DETAILEDTRACKING_DPAPIACTIVITY')
insert into dtCategory  (Id, Description)                   values (0x3403, N'DETAILEDTRACKING_RPCCALL')
insert into dtCategory  (Id, Description)                   values (0x3500, N'POLICYCHANGE_AUDITPOLICY')
insert into dtCategory  (Id, Description)                   values (0x3501, N'POLICYCHANGE_AUTHENTICATIONPOLICY')
insert into dtCategory  (Id, Description)                   values (0x3502, N'POLICYCHANGE_AUTHORIZATIONPOLICY')
insert into dtCategory  (Id, Description)                   values (0x3503, N'POLICYCHANGE_MPSSCVRULEPOLICY')
insert into dtCategory  (Id, Description)                   values (0x3504, N'POLICYCHANGE_WFPIPSECPOLICY')
insert into dtCategory  (Id, Description)                   values (0x3505, N'POLICYCHANGE_OTHERS')
insert into dtCategory  (Id, Description)                   values (0x3600, N'ACCOUNTMANAGEMENT_USERACCOUNT')
insert into dtCategory  (Id, Description)                   values (0x3601, N'ACCOUNTMANAGEMENT_COMPUTERACCOUNT')
insert into dtCategory  (Id, Description)                   values (0x3602, N'ACCOUNTMANAGEMENT_SECURITYGROUP')
insert into dtCategory  (Id, Description)                   values (0x3603, N'ACCOUNTMANAGEMENT_DISTRIBUTIONGROUP')
insert into dtCategory  (Id, Description)                   values (0x3604, N'ACCOUNTMANAGEMENT_APPLICATIONGROUP')
insert into dtCategory  (Id, Description)                   values (0x3605, N'ACCOUNTMANAGEMENT_OTHERS')
insert into dtCategory  (Id, Description)                   values (0x3700, N'DSACCESS_DSACCESS')
insert into dtCategory  (Id, Description)                   values (0x3701, N'DSACCESS_DSCHANGES')
insert into dtCategory  (Id, Description)                   values (0x3702, N'DS_REPLICATION')
insert into dtCategory  (Id, Description)                   values (0x3703, N'DS_DETAILED_REPLICATION')
insert into dtCategory  (Id, Description)                   values (0x3800, N'ACCOUNTLOGON_CREDENTIALVALIDATION')
insert into dtCategory  (Id, Description)                   values (0x3801, N'ACCOUNTLOGON_KERBEROS')
insert into dtCategory  (Id, Description)                   values (0x3802, N'ACCOUNTLOGON_OTHERS')
insert into dtCategory  (Id, Description)                   values (0x3803, N'ACCOUNTLOGON_KERBCREDENTIALVALIDATION')
insert into dtCategory  (Id, Description)                   values (0xff00, N'UNKNOWN_SUBCATEGORY')

-- string types
insert into dtType      (Id, Description)                   values (0, N'<no type>')
go
