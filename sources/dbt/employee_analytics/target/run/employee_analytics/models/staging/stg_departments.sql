
  create or replace   view EMPLOYEE_ANALYTICS_STAGE.STAGING.stg_departments
  
   as (
    select department_id,trim(department_name) department_name,trim(department_head) department_head,trim(cost_center) cost_center from EMPLOYEE_ANALYTICS_STAGE.RAW.DEPARTMENTS
  );

