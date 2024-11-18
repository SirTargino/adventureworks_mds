with
    rename as (
        select
            cast(SALESORDERID as int) || '-' || cast(SALESREASONID as int) as sk_orderheaderreason
            , cast(SALESORDERID as int) as fk_order
            , cast(SALESREASONID as int) as fk_reason
        from {{ source('erp_adventureworks', 'salesorderheadersalesreason') }}
    )

select *
from rename