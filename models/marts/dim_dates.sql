{{
    config(
        materialized = "table"
    )
}}

with
    calendar as (
        {{ dbt_date.get_date_dimension("2011-05-31", "2014-07-12") }}
    )

    , dim_dates as (
        select 
        {{ dbt_utils.generate_surrogate_key(['date_day', 'day_of_week'])}} as sk_dates
        , *
        from calendar
    )

select *
from dim_dates