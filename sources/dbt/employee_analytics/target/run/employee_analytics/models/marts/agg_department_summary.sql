
  
    

        create or replace transient table EMPLOYEE_ANALYTICS_STAGE.ANALYTICS.agg_department_summary
         as
        (select department_name,count(*) total_employees,count_if(employment_status='ACTIVE') active_employees,count_if(employment_status='EXITED') exited_employees,round(avg(salary),2) avg_salary,round(avg(tenure_months),1) avg_tenure_months from EMPLOYEE_ANALYTICS_STAGE.ANALYTICS.dim_employees group by department_name
        );
      
  