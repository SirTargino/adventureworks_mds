with
    creditcard as (
        select *
        from {{ ref('stg_erp__credit_card') }}
    )

select *
from creditcard