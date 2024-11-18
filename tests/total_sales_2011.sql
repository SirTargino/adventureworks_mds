with
    total_sales_2011 as (
        SELECT
            cast(SUM(gross_line_total) as numeric(18,2)) AS total
        FROM 
            {{ ref('fct_sales') }}
        WHERE 
            order_date BETWEEN '2011-01-01' AND '2011-12-31'
    ) --$12.646.112,16.
    -- $12.646.112,1607

select *
from total_sales_2011
where total not between 12646112.10 and 12646112.20