DEFINE DATABASE {{ employee_db() }}
  DATA_RETENTION_TIME_IN_DAYS = {{ retention_days }}
  COMMENT = 'Employee Analytics {{ environment }} database managed by DCM';


DEFINE SCHEMA {{ employee_db() }}.RAW
  COMMENT = 'Raw employee source data';


DEFINE SCHEMA {{ employee_db() }}.STAGING
  COMMENT = 'Cleaned and standardized dbt staging models';


DEFINE SCHEMA {{ employee_db() }}.ANALYTICS
  COMMENT = 'Curated dbt analytics models';


DEFINE SCHEMA {{ employee_db() }}.GOVERNANCE
  COMMENT = 'Governance objects for Employee Analytics';
