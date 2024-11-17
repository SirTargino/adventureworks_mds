with
    sales as (
        select *
        from {{ ref('stg_erp__salesorderheader') }}
    )

    , int_sales_aggregate as (
        select
            sales.pk_sales
            , sales.fk_customer
            , sales.fk_employee
            , sales.fk_territory
            , sales.fk_credit_card
            , sales.order_date
            , sales.order_status
            , sales.subtotal
            , sales.taxes
            , sales.FREIGHT
            , sales.total_due
        from sales
    )

select *
from int_sales_aggregate