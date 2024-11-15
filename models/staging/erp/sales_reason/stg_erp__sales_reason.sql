with
    rename as (
        select
            cast(salesreasonid as int) as pk_sales_reason
            , cast(name as string) as reason_name
            , cast(reasontype as string) as reason_type
        from {{ source('erp_adventureworks', 'salesreason') }}
    )

select *
from rename