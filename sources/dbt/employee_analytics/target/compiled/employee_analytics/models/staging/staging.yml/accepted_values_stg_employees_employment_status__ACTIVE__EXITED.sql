
    
    

with all_values as (

    select
        employment_status as value_field,
        count(*) as n_records

    from EMPLOYEE_ANALYTICS_STAGE.STAGING.stg_employees
    group by employment_status

)

select *
from all_values
where value_field not in (
    'ACTIVE','EXITED'
)


