with
    address as (
        select *
        from {{ ref('stg_erp__address') }}
    )

    , state as (
        select *
        from {{ ref('stg_erp__stateprovince') }}
    )

    , country as (
        select *
        from {{ ref('stg_erp__countryregion') }}
    )

    , address_state_country as (
        select
            address.pk_address
            , address.address
            , address.city
            , address.postal_code
            , state.stateprovince_name
            , state.stateprovince_code
            , country.country_name
            , country.pk_countryregion as country_code
        from address
        left join state on state.pk_stateprovince = address.fk_stateprovince
        left join country on country.pk_countryregion = state.fk_country
    )

select *
from address_state_country