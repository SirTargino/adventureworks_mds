with
    rename as (
        select
            cast(CUSTOMERID as int) as pk_customer
            , cast(PERSONID as int) as fk_person
            , cast(STOREID as int) as fk_store
        from {{ source('erp_adventureworks', 'customer') }}
    )

select *
from rename