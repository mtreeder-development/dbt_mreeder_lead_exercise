with 

source as (

    select * from {{ source('FIVETRAN_LEADS', 'STG_SRC_THREE_LEADS') }}

),

renamed as (

    select
        _line,
        _fivetran_synced,
        id,
        is_deleted,
        last_name,
        first_name,
        title,
        company,
        street,
        city,
        state,
        postal_code,
        country,
        phone,
        mobile_phone,
        email,
        website,
        lead_source,
        status,
        is_converted,
        created_date,
        last_modified_date,
        last_activity_date,
        outreach_stage_c,
        current_enrollment_c,
        capacity_c,
        lead_source_last_updated_c,
        brightwheel_school_uuid_c

    from source

)

select * from renamed
