with 

source as (

    select * from {{ source('FIVETRAN_LEADS', 'STG_SRC_THREE_LEADS') }}

),

renamed as (

    select *

    from source

)

select * from renamed

-- This data source is an example of fivetran handling columns changing around. I first loaded the sf leads to this schema and then replaced the file with the correct source.