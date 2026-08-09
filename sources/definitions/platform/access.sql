-- ============================================================
-- DATABASE ROLES
-- ============================================================

DEFINE DATABASE ROLE {{ employee_db() }}.ENGINEER
  COMMENT = 'Engineer access for Employee Analytics';


DEFINE DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER
  COMMENT = 'dbt transformation access for Employee Analytics';


DEFINE DATABASE ROLE {{ employee_db() }}.ANALYST
  COMMENT = 'Read-only analytics access for Employee Analytics';



-- ============================================================
-- ENGINEER PRIVILEGES
-- ============================================================

GRANT USAGE ON DATABASE {{ employee_db() }}
  TO DATABASE ROLE {{ employee_db() }}.ENGINEER;


GRANT USAGE ON SCHEMA {{ employee_db() }}.RAW
  TO DATABASE ROLE {{ employee_db() }}.ENGINEER;


GRANT SELECT, INSERT, UPDATE, DELETE
  ON ALL TABLES IN SCHEMA {{ employee_db() }}.RAW
  TO DATABASE ROLE {{ employee_db() }}.ENGINEER;



-- ============================================================
-- DBT PRIVILEGES
-- ============================================================

GRANT USAGE ON DATABASE {{ employee_db() }}
  TO DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER;


-- dbt can create schemas when required
GRANT CREATE SCHEMA
  ON DATABASE {{ employee_db() }}
  TO DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER;


-- RAW is dbt's source layer
GRANT USAGE ON SCHEMA {{ employee_db() }}.RAW
  TO DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER;


GRANT SELECT
  ON ALL TABLES IN SCHEMA {{ employee_db() }}.RAW
  TO DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER;



-- STAGING contains dbt staging models
GRANT USAGE
  ON SCHEMA {{ employee_db() }}.STAGING
  TO DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER;


GRANT CREATE TABLE, CREATE VIEW
  ON SCHEMA {{ employee_db() }}.STAGING
  TO DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER;



-- ANALYTICS contains final dbt marts
GRANT USAGE
  ON SCHEMA {{ employee_db() }}.ANALYTICS
  TO DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER;


GRANT CREATE TABLE, CREATE VIEW
  ON SCHEMA {{ employee_db() }}.ANALYTICS
  TO DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER;



-- ============================================================
-- ANALYST PRIVILEGES
-- ============================================================

GRANT USAGE ON DATABASE {{ employee_db() }}
  TO DATABASE ROLE {{ employee_db() }}.ANALYST;


GRANT USAGE ON SCHEMA {{ employee_db() }}.ANALYTICS
  TO DATABASE ROLE {{ employee_db() }}.ANALYST;


GRANT SELECT
  ON ALL TABLES IN SCHEMA {{ employee_db() }}.ANALYTICS
  TO DATABASE ROLE {{ employee_db() }}.ANALYST;



-- ============================================================
-- DATABASE ROLE -> ACCOUNT ROLE MAPPING
-- ============================================================

GRANT DATABASE ROLE {{ employee_db() }}.ENGINEER
  TO ROLE EMPLOYEE_ENGINEER;


GRANT DATABASE ROLE {{ employee_db() }}.DBT_DEVELOPER
  TO ROLE EMPLOYEE_DBT;


GRANT DATABASE ROLE {{ employee_db() }}.ANALYST
  TO ROLE EMPLOYEE_ANALYST;



-- ============================================================
-- WAREHOUSE ACCESS
-- ============================================================

GRANT USAGE ON WAREHOUSE {{ load_wh() }}
  TO ROLE EMPLOYEE_ENGINEER;


GRANT USAGE ON WAREHOUSE {{ transform_wh() }}
  TO ROLE EMPLOYEE_DBT;


GRANT USAGE ON WAREHOUSE {{ transform_wh() }}
  TO ROLE EMPLOYEE_ANALYST;