with
    rename as (
        select
            cast(ADDRESSID as int) as pk_address
            , case
                when ADDRESSLINE2 is null then ADDRESSLINE1
                else ADDRESSLINE1 || ', ' || ADDRESSLINE2
            end as address
            , cast(CITY as string) as city
            , cast(STATEPROVINCEID as int) as fk_stateprovince
            -- Some postal codes use string characters
            , cast(POSTALCODE as string) as postal_code
        from {{ source('erp_adventureworks', 'address') }}
    )

select *
from rename