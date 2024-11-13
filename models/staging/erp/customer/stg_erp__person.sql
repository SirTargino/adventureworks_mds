with
    rename as (
        select
            cast(BUSINESSENTITYID as int) as pk_person
            , cast(FIRSTNAME || ' ' || LASTNAME as string) as person_name
        from {{ source('erp_adventureworks', 'person') }}
    )

select *
from rename