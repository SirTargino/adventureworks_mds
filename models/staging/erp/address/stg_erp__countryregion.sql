with
    rename as (
        select
            cast(COUNTRYREGIONCODE as string) as pk_countryregion
            , cast(NAME as string) as country_name
        from {{ source('erp_adventureworks', 'countryregion') }}
    )

select *
from rename