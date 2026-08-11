
-- ============================================================
-- PROD DEPLOYMENT VALIDATION
-- ============================================================

USE ROLE EMPLOYEE_DBT;

USE WAREHOUSE EMPLOYEE_TRANSFORM_WH_PROD;

USE DATABASE EMPLOYEE_ANALYTICS_PROD;

-- ============================================================
-- DBT PROJECT
-- ============================================================

SHOW DBT PROJECTS
IN SCHEMA EMPLOYEE_ANALYTICS_PROD.DBT_PROJECTS;


-- ============================================================
-- RAW DATA
-- ============================================================

SELECT
    COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEE_ANALYTICS_PROD.RAW.EMPLOYEES;


SELECT
    COUNT(*) AS DEPARTMENT_COUNT
FROM EMPLOYEE_ANALYTICS_PROD.RAW.DEPARTMENTS;


SELECT
    COUNT(*) AS EVENT_COUNT
FROM EMPLOYEE_ANALYTICS_PROD.RAW.EMPLOYEE_EVENTS;


-- ============================================================
-- TRANSFORMATION OUTPUT
-- ============================================================

SELECT
    COUNT(*) AS DIM_EMPLOYEE_COUNT
FROM EMPLOYEE_ANALYTICS_PROD.ANALYTICS.DIM_EMPLOYEES;


SELECT *
FROM EMPLOYEE_ANALYTICS_PROD.ANALYTICS.AGG_DEPARTMENT_SUMMARY
ORDER BY DEPARTMENT_NAME;


SELECT *
FROM EMPLOYEE_ANALYTICS_PROD.ANALYTICS.AGG_EMPLOYEE_MOVEMENT;