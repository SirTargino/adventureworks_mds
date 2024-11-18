with
    rename as (
        select
            cast(SALESORDERDETAILID as int) as pk_orderdetail
            , cast(SALESORDERID as int) as fk_sales
            , cast(PRODUCTID as int) as fk_product
            , cast(ORDERQTY as int) as quantity
            , cast(UNITPRICE as numeric(18,4)) as unitprice
            , cast(UNITPRICEDISCOUNT as numeric(18,4)) as unitpricediscount
        from {{ source('erp_adventureworks', 'salesorderdetail') }}
    )

select *
from rename