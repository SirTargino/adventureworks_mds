with
    rename as (
        select
            cast(SALESORDERID as int) as pk_sales
            , cast(CUSTOMERID as int) as fk_customer
            , cast(SALESPERSONID as int) as fk_employee
            , cast(BILLTOADDRESSID as int) as fk_territory
            , cast(CREDITCARDID as int) as fk_credit_card
            , cast(ORDERDATE as date) as order_date
            , cast(STATUS as int) as order_status
            , cast(SUBTOTAL as numeric(18,4)) as subtotal
            , cast(TAXAMT as numeric(18,4)) as taxes
            , cast(FREIGHT as numeric(18,4)) as FREIGHT
            , cast(TOTALDUE as numeric(18,4)) as total_due
        from {{ source('erp_adventureworks', 'salesorderheader') }}
    )

select *
from rename