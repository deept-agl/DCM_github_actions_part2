USE ROLE ACCOUNTADMIN;

CREATE USER IF NOT EXISTS SVC_EMP_DCM_PROD
  TYPE = SERVICE
  DEFAULT_ROLE = EMP_DCM_PROD_DEPLOYER
  COMMENT = 'GitHub Actions service user for Employee Analytics PROD deployment'
  WORKLOAD_IDENTITY = (
    TYPE = OIDC
    ISSUER = 'https://token.actions.githubusercontent.com'
    SUBJECT = 'repo:deept-agl/DCM_DBT_Snowflake_Project:environment:DCM_PROD' -- replace with your github_user_name/repo
  );

GRANT ROLE EMP_DCM_PROD_DEPLOYER TO USER SVC_EMP_DCM_PROD;
GRANT ROLE EMPLOYEE_DBT TO USER SVC_EMP_DCM_PROD;

SHOW USERS LIKE 'SVC_EMP_DCM_PROD';
