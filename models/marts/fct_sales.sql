with
    dim_products as (
        select *
        from {{ ref('dim_products') }}
    )

    , dim_address as (
        select *
        from {{ ref('dim_address') }}
    )

    , dim_credit_card as (
        select *
        from {{ ref('dim_credit_card') }}
    )

    , dim_customers as (
        select *
        from {{ ref('dim_customers') }}
    )

    , dim_employees as (
        select *
        from {{ ref('dim_employees') }}
    )

    , dim_sales_reason as (
        select *
        from {{ ref('dim_sales_reason') }}
    )

    , order_details as (
        select *
        from {{ ref('int_orderdetails') }}
    )

select *
from order_details