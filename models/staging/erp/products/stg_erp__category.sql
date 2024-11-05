with
    rename as (
        select
            cast(PRODUCTCATEGORYID as int) as pk_subcategory
            , cast(NAME as string) as category_name
        from {{ source('erp_adventureworks', 'productcategory') }}
    )

select *
from rename