select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select * from EMPLOYEE_ANALYTICS_STAGE.ANALYTICS.dim_employees where exit_date is not null and exit_date < join_date
      
    ) dbt_internal_test