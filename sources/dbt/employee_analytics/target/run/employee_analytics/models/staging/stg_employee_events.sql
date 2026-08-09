
  create or replace   view EMPLOYEE_ANALYTICS_STAGE.STAGING.stg_employee_events
  
   as (
    select event_id,employee_id,upper(trim(event_type)) event_type,event_date,old_value,new_value from EMPLOYEE_ANALYTICS_STAGE.RAW.EMPLOYEE_EVENTS
  );

