with 

source as (

    select * from {{ source('FIVETRAN_LEADS', 'STG_SRC_TWO_LEADS') }}

),

renamed as (

    select
        _line,
        _fivetran_synced,
        type_license,
        company,
        accepts_subsidy,
        year_round,
        daytime_hours,
        star_level,
        mon,
        tues,
        wed,
        thurs,
        friday,
        saturday,
        sunday,
        primary_caregiver,
        phone,
        email,
        address_1,
        city,
        state,
        zip,
        subsidy_contract_number,
        total_cap,
        ages_accepted_1,
        aa_2,
        aa_3,
        aa_4,
        license_monitoring_since,
        school_year_only,
        evening_hours

    from source

)

select * from renamed
