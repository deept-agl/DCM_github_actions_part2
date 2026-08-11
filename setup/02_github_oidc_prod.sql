USE ROLE ACCOUNTADMIN;
DROP USER SVC_EMP_DCM_PROD;
CREATE USER IF NOT EXISTS SVC_EMP_DCM_PROD
  TYPE = SERVICE
  DEFAULT_ROLE = EMP_DCM_PROD_DEPLOYER
  COMMENT = 'GitHub Actions service user for Employee Analytics PROD deployment'
  WORKLOAD_IDENTITY = (
    TYPE = OIDC
    ISSUER = 'https://token.actions.githubusercontent.com'
    SUBJECT = 'repo:deept-agl/DCM_github_actions_part2:environment:DCM_PROD' -- replace with your github_user_name/repo
  );

-- DCM deployment
GRANT ROLE EMP_DCM_PROD_DEPLOYER TO USER SVC_EMP_DCM_PROD;


-- RAW demo data loading
GRANT ROLE EMPLOYEE_ENGINEER TO USER SVC_EMP_DCM_PROD;


-- dbt deployment and execution
GRANT ROLE EMPLOYEE_DBT TO USER SVC_EMP_DCM_PROD;

DESC USER SVC_EMP_DCM_PROD;
