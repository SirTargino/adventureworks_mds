with
    products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

    , subcategories as (
        select *
        from {{ ref('stg_erp__subcategory') }}
    )

    , categories as (
        select *
        from {{ ref('stg_erp__category') }}
    )

    , products_enriched as (
        select
            products.pk_product
            , products.product_name
            , products.product_number
            , subcategories.subcategory_name
            , categories.category_name
            , products.stock
        from products
        left join subcategories on subcategories.pk_subcategory = products.fk_subcategory
        left join categories on categories.pk_category = subcategories.fk_category
    )

select *
from products_enriched