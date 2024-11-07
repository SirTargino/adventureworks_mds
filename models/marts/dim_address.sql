with
    int_address as (
        select *
        from {{ ref('int_address_state_country') }}
    )

select *
from int_address