with
    int_employees as (
        select *
        from {{ ref('int_employees_addname') }}
    )

select *
from int_employees