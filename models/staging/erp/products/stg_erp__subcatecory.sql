with
    rename as (
        select
            cast(PRODUCTSUBCATEGORYID as int) as pk_subcategory
            , cast(PRODUCTCATEGORYID as int) as fk_category
            , cast(NAME as string) as subcategory_name
        from {{ source('erp_adventureworks', 'productsubcategory') }}
    )

select *
from rename