with
    rename as (
        select
            cast(BUSINESSENTITYID as int) as pk_employee
            , cast(JOBTITLE as string) as jobtitle
        from {{ source('erp_adventureworks', 'employee') }}
    )

select *
from rename