with l2_source as (
Select
*,
 split(primary_caregiver,' ') as name_parts
 from {{ ref("stg_FIVETRAN_LEADS__STG_SRC_TWO_LEADS")}}

 )
 Select 
    company,
    split_part(type_license, '-',  0) as license_type,
    split_part(type_license, '-',  2) as license_number,
    year_round as schedule,
    ARRAY_TO_STRING(ARRAY_SLICE(name_parts, 0, 1), ' ') AS first_name, 
    ARRAY_TO_STRING(ARRAY_SLICE(name_parts, 1, 2), ' ') AS last_name,
    REGEXP_REPLACE(phone, '\\((\\d{3})\\) (\\d{3}-\\d{4})', '\\1-\\2') as phone,
    email,
    address_1,
    city,
    state,
    zip,
    total_cap as capacity,
    -- as max_age -- not enough time to calculate this
    -- as min_age -- not enough time to calculate this
    'STG_SRC_TWO_LEADS' as lead_source
    -- as lead_source_updated not enough time to add snapshots in
    
     from l2_source