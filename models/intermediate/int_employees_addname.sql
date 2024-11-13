with
    employee as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

    , person as (
        select *
        from {{ ref('stg_erp__person') }}
    )

    , employee_addname as (
        select
            employee.pk_employee
            , person.person_name as employee_name
            , employee.jobtitle
        from employee
        left join person on person.pk_person = employee.pk_employee
    )

select *
from employee_addname