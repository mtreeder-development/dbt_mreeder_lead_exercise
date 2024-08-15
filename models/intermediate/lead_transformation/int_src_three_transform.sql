with l3_source as (
Select
*

 from {{ ref("stg_FIVETRAN_LEADS__STG_SRC_THREE_LEADS")}}

 )
 Select 
    operation_name as company,
    address as address_1,
    city,
    state,
    zip,
    phone,
    split_part(type, '-',  2) as license_type,
    status as license_status,
    issue_date as license_issue_date,
    capacity,
    email_address as email,
    -- as max_age -- not enough time to calculate this
    -- as min_age -- not enough time to calculate this
    'STG_SRC_THREE_LEADS' as lead_source
    -- as lead_source_updated not enough time to add snapshots in
    
     from l3_source