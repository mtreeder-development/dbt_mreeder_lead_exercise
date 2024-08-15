with 

source as (

    select * from {{ source('FIVETRAN_LEADS', 'STG_SRC_TWO_LEADS') }}

),

renamed as (

    select *

    from source

)

select * from renamed
