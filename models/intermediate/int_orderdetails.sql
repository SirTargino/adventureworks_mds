with
    details as (
        select *
        from {{ ref('stg_erp__salesdetails') }}
    )

    , sales as (
        select *
        from {{ ref('stg_erp__salesorderheader') }}
    )

    , reason as (
        select *
        from {{ ref('stg_erp__salesorderheaderreason') }}
    )

    , products as (
        select *
        from {{ ref('int_products_enriched') }}
    )

    , int_orderdetails as (
        select
            details.pk_orderdetail
            , details.fk_sales
            , sales.fk_customer
            , sales.fk_employee
            , sales.fk_territory
            , sales.fk_credit_card
            , details.fk_product
            , sales.order_date
            , sales.order_status
            , details.quantity
            , details.unitprice
            , details.unitpricediscount
        from details
        left join sales on sales.pk_sales = details.fk_sales
    )

    , metrics as (
        select
            *
            , cast((unitprice * quantity) as numeric(18,4))
            as gross_line_total
            , cast((unitprice - (unitprice * unitpricediscount)) * quantity as numeric(18,4))
            as line_total
        from int_orderdetails
    )

select *
from metrics