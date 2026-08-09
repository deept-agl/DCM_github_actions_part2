--Add this script in foundation.sql sql

DEFINE SCHEMA {{ employee_db() }}.DBT_PROJECTS
  COMMENT = 'Deployed dbt project objects';