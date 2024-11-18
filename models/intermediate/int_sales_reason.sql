with
    salesorderreason as (
        select *
        from {{ ref('stg_erp__salesorderheaderreason') }}
    )

    , orders as (
        select *
        from {{ ref('int_orderdetails') }}
    )

    , sales_reason as (
        select *
        from {{ ref('stg_erp__sales_reason') }}
    )

    , final_select as (
        select
            salesorderreason.sk_orderheaderreason as sk_reason
            , salesorderreason.fk_order
            , sales_reason.reason_name
            , sales_reason.reason_type
        from salesorderreason
        left join sales_reason on pk_sales_reason = fk_reason
        left join orders on fk_sales = fk_order
    )

select *
from final_select