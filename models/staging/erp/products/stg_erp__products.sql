with
    rename as (
        select
            cast(PRODUCTID as int) as pk_product
            , cast(PRODUCTSUBCATEGORYID as int) as fk_subcategory
            , cast(NAME as string) as product_name
            , cast(PRODUCTNUMBER as STRING) as product_number
            , cast(SAFETYSTOCKLEVEL as int) as stock
        
        from {{ source('erp_adventureworks', 'product') }}
    )

select *
from rename