with
    customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )

    , person as (
        select *
        from {{ ref('stg_erp__person') }}
    )

    , store as (
        select *
        from {{ ref('stg_erp__store') }}
    )

    , customer_joined as (
        select
            customer.pk_customer
            , case
                when fk_person is null then 'Store'
                else 'Person'
            end as customer_type
            , customer.fk_person
            , customer.fk_store
            , case
                when fk_person is null then store.store_name
                else person.person_name
            end as customer_name
        from customer
        left join store on store.pk_store = customer.fk_store
        left join person on person.pk_person = customer.fk_person
    )

select *
from customer_joined