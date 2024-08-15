with l1_source as (
Select 

        name as company,
        credential_type as license_type,
        credential_number as license_number,
        status as license_status,
        expiration_date as license_expiration_date,
        split_part(address, ',',  0) as address1,
        state as state,
        null as city, -- not enough time to sort this one out.
        phone as phone,
        first_issue_date as license_issue_date,
        primary_contact_name as last_name,
        'STG_SRC_ONE_LEADS' as lead_source
        -- as lead_source_updated not enough time to add snapshots in

 from {{ ref("stg_FIVETRAN_LEADS__STG_SRC_ONE_LEADS")}})
 Select * from l1_source