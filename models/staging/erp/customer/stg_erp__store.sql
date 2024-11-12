with
    rename as (
        select
            cast(BUSINESSENTITYID as int) as pk_store
            , cast(NAME as string) as store_name
        from {{ source('erp_adventureworks', 'store') }}
    )

select *
from rename