
  
    

        create or replace transient table EMPLOYEE_ANALYTICS_STAGE.ANALYTICS.dim_employees
         as
        (select e.employee_id,e.employee_name,e.email,e.job_title,d.department_name,d.cost_center,e.join_date,e.exit_date,e.employment_status,e.salary,datediff(month,e.join_date,coalesce(e.exit_date,current_date())) tenure_months from EMPLOYEE_ANALYTICS_STAGE.STAGING.stg_employees e left join EMPLOYEE_ANALYTICS_STAGE.STAGING.stg_departments d on e.department_id=d.department_id
        );
      
  