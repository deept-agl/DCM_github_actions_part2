select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select * from EMPLOYEE_ANALYTICS_STAGE.ANALYTICS.dim_employees where salary <= 0
      
    ) dbt_internal_test