with
    details as (
        select *
        from {{ ref('stg_erp__salesdetails') }}
    )

    , sales as (
        select *
        from {{ ref('int_sales_aggregate') }}
    )

    , products as (
        select *
        from {{ ref('int_products_enriched') }}
    )

    , int_orderdetails as (
        select
            details.pk_orderdetail
            , details.fk_sales
            , details.fk_product
            , details.quantity
            , details.unitprice
            , details.unitpricediscount
            , cast((details.unitprice - (details.unitprice * details.unitpricediscount)) * details.quantity as numeric(18,2))
            as line_total
        from details
        left join sales on sales.pk_sales = details.fk_sales
        left join products on products.pk_product = details.fk_product
    )

select *
from int_orderdetails