with 

source as (

    select * from {{ source('FIVETRAN_LEADS', 'STG_SRC_SF_LEADS') }}

),

renamed as (

    select *
    from source

)

select * from renamed
