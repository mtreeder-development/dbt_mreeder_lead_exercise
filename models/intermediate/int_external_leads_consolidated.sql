with l1_source as (
Select 
    address1,
    null as capacity,
    null as city,
    company,
    null as email,
    null as first_name,
    last_name,
    license_expiration_date,
    license_issue_date,
    license_number,
    license_status,
    license_type,
    phone,
    state,
    null as schedule,
    null as zip,
    lead_source

 from {{ ref("int_src_one_transform")}}

),
l2_source as (
select
    address_1,
    capacity,
    city,
    company,
    email,
    first_name,
    last_name,
    null as license_expiration_date,
    null as license_issue_date,
    license_number,
    null as license_status,
    license_type,
    phone,
    state,
    schedule,
    zip,
    lead_source
         from {{ ref("int_src_two_transform")}} 
),
l3_source as (
select
    address_1,
    capacity,
    city,
    company,
    email,
    null as first_name,
    null as last_name,
    null as license_expiration_date,
    license_issue_date,
    null as license_number,
    license_status,
    license_type,
    phone,
    state,
    null as schedule,
    zip,
    lead_source
from {{ ref("int_src_three_transform")}} 
),

combine as 
(
Select * from  l1_source 
UNION ALL
Select * from  l2_source 
UNION ALL
Select * from  l3_source 
    
)
Select * from combine