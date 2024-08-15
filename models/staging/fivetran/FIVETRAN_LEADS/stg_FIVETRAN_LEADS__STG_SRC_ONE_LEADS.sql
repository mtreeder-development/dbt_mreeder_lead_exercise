with 

source as (

    select * from {{ source('FIVETRAN_LEADS', 'STG_SRC_ONE_LEADS') }}

),

renamed as (

    select
        _line,
        _fivetran_synced,
        name,
        credential_type,
        credential_number,
        status,
        expiration_date,
        disciplinary_action,
        address,
        state,
        county,
        phone,
        first_issue_date,
        primary_contact_name,
        primary_contact_role

    from source

)

select * from renamed
