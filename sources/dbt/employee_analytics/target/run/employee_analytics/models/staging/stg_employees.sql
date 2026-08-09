
  create or replace   view EMPLOYEE_ANALYTICS_STAGE.STAGING.stg_employees
  
   as (
    select employee_id,trim(employee_name) employee_name,lower(trim(email)) email,department_id,trim(job_title) job_title,join_date,exit_date,upper(trim(employment_status)) employment_status,salary,updated_at from EMPLOYEE_ANALYTICS_STAGE.RAW.EMPLOYEES
  );

