-- ============================================================
-- EMPLOYEE ANALYTICS DCM + DBT PROJECT
-- COMPLETE TEARDOWN
-- ============================================================
-- Run only when you want to remove the entire demo environment.
-- This is intentionally destructive.
--
-- Covers:
--   - Deployed DBT PROJECT objects
--   - DEV / STAGE / PROD databases
--   - Warehouses
--   - DCM project objects
--   - Functional roles
--   - DCM deployment roles
--   - DCM control database
--
-- Run as ACCOUNTADMIN.
-- ============================================================

USE ROLE ACCOUNTADMIN;


-- ============================================================
-- 1. DROP DEPLOYED DBT PROJECT OBJECTS
-- ============================================================
-- Drop these before dropping the databases so the teardown flow
-- is explicit and easy to explain.

DROP DBT PROJECT IF EXISTS
  EMPLOYEE_ANALYTICS_DEV.DBT_PROJECTS.EMPLOYEE_ANALYTICS_DBT;

DROP DBT PROJECT IF EXISTS
  EMPLOYEE_ANALYTICS_STAGE.DBT_PROJECTS.EMPLOYEE_ANALYTICS_DBT;

DROP DBT PROJECT IF EXISTS
  EMPLOYEE_ANALYTICS_PROD.DBT_PROJECTS.EMPLOYEE_ANALYTICS_DBT;


-- ============================================================
-- 2. DROP APPLICATION DATABASES
-- ============================================================
-- Dropping each database also removes:
--   RAW
--   STAGING
--   ANALYTICS
--   GOVERNANCE
--   DBT_PROJECTS
--   tables
--   views
--   database roles
--   tags
--   masking policies
--   data metric functions
--   expectations
--   deployed dbt project versions/history inside that database

DROP DATABASE IF EXISTS EMPLOYEE_ANALYTICS_DEV;
DROP DATABASE IF EXISTS EMPLOYEE_ANALYTICS_STAGE;
DROP DATABASE IF EXISTS EMPLOYEE_ANALYTICS_PROD;


-- ============================================================
-- 3. DROP WAREHOUSES
-- ============================================================

DROP WAREHOUSE IF EXISTS EMPLOYEE_LOAD_WH_DEV;
DROP WAREHOUSE IF EXISTS EMPLOYEE_TRANSFORM_WH_DEV;

DROP WAREHOUSE IF EXISTS EMPLOYEE_LOAD_WH_STAGE;
DROP WAREHOUSE IF EXISTS EMPLOYEE_TRANSFORM_WH_STAGE;

DROP WAREHOUSE IF EXISTS EMPLOYEE_LOAD_WH_PROD;
DROP WAREHOUSE IF EXISTS EMPLOYEE_TRANSFORM_WH_PROD;


-- ============================================================
-- 4. DROP DCM PROJECT OBJECTS
-- ============================================================
-- DCM project objects live in:
-- DCM_CONTROL.PROJECTS

DROP DCM PROJECT IF EXISTS
  DCM_CONTROL.PROJECTS.EMPLOYEE_ANALYTICS_DEV;

DROP DCM PROJECT IF EXISTS
  DCM_CONTROL.PROJECTS.EMPLOYEE_ANALYTICS_STAGE;

DROP DCM PROJECT IF EXISTS
  DCM_CONTROL.PROJECTS.EMPLOYEE_ANALYTICS_PROD;


-- ============================================================
-- 5. DROP FUNCTIONAL ACCOUNT ROLES
-- ============================================================

DROP ROLE IF EXISTS EMPLOYEE_ENGINEER;
DROP ROLE IF EXISTS EMPLOYEE_DBT;
DROP ROLE IF EXISTS EMPLOYEE_ANALYST;


-- ============================================================
-- 6. DROP DCM DEPLOYMENT ROLES
-- ============================================================

DROP ROLE IF EXISTS EMP_DCM_DEV_DEPLOYER;
DROP ROLE IF EXISTS EMP_DCM_STAGE_DEPLOYER;
DROP ROLE IF EXISTS EMP_DCM_PROD_DEPLOYER;


-- ============================================================
-- 7. OPTIONAL PART 2 CI/CD SERVICE USERS
-- ============================================================
-- Uncomment these only if you created the GitHub OIDC users
-- from Part 2.

-- DROP USER IF EXISTS SVC_EMP_DCM_DEV;
-- DROP USER IF EXISTS SVC_EMP_DCM_STAGE;
-- DROP USER IF EXISTS SVC_EMP_DCM_PROD;


-- ============================================================
-- 8. DROP DCM CONTROL DATABASE
-- ============================================================
-- Do this last because the DCM project objects live here.

DROP DATABASE IF EXISTS DCM_CONTROL;


-- ============================================================
-- 9. VERIFICATION
-- ============================================================

SHOW DATABASES LIKE 'EMPLOYEE_ANALYTICS%';
SHOW WAREHOUSES LIKE 'EMPLOYEE%';
SHOW ROLES LIKE 'EMPLOYEE%';
SHOW ROLES LIKE 'EMP_DCM%';

-- If all teardown steps succeeded, the commands above
-- should return no project-specific objects.