with
    rename as (
        select
            cast(STATEPROVINCEID as int) as pk_stateprovince
            , cast(COUNTRYREGIONCODE as string) as fk_country
            , cast(NAME as string) as stateprovince_name
            , cast(STATEPROVINCECODE as string) as stateprovince_code
        from {{ source('erp_adventureworks', 'stateprovince') }}
    )

select *
from rename