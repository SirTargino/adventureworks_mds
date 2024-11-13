with
    int_customer as (
        select *
        from {{ ref('int_customer_typed') }}
    )

select *
from int_customer