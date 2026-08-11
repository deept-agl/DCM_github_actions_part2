-- ============================================================
-- EMPLOYEE ANALYTICS
-- PROD DEMO DATA LOAD
-- ============================================================
--
-- PURPOSE:
-- Load a small repeatable demo dataset into the PROD RAW tables.
--
-- NOTE:
-- This is seed/demo data for the project demonstration.
-- In a real production system, RAW data would normally arrive
-- through an ingestion pipeline, CDC, Snowpipe, Kafka, etc.
-- ============================================================


USE ROLE EMPLOYEE_ENGINEER;
USE WAREHOUSE EMPLOYEE_LOAD_WH_PROD;
USE DATABASE EMPLOYEE_ANALYTICS_PROD;
USE SCHEMA RAW;


TRUNCATE TABLE DEPARTMENTS;

INSERT INTO DEPARTMENTS(DEPARTMENT_ID,DEPARTMENT_NAME,DEPARTMENT_HEAD,COST_CENTER) VALUES
 (10,'Engineering','Aarav Mehta','CC-ENG'),(20,'Finance','Nisha Kapoor','CC-FIN'),(30,'People','Riya Sharma','CC-HR'),(40,'Marketing','Kabir Singh','CC-MKT');

TRUNCATE TABLE EMPLOYEES;
INSERT INTO EMPLOYEES(EMPLOYEE_ID,EMPLOYEE_NAME,EMAIL,DEPARTMENT_ID,JOB_TITLE,JOIN_DATE,EXIT_DATE,EMPLOYMENT_STATUS,SALARY,UPDATED_AT) VALUES
 (1001,'Ananya Rao','ananya.rao@example.com',10,'Data Engineer','2022-02-14',NULL,'ACTIVE',110000,CURRENT_TIMESTAMP()),
 (1002,'Rohan Gupta','rohan.gupta@example.com',10,'Analytics Engineer','2023-06-05',NULL,'ACTIVE',98000,CURRENT_TIMESTAMP()),
 (1003,'Meera Shah','meera.shah@example.com',20,'Finance Analyst','2021-09-20',NULL,'ACTIVE',85000,CURRENT_TIMESTAMP()),
 (1004,'Vivaan Joshi','vivaan.joshi@example.com',30,'HR Specialist','2024-01-08',NULL,'ACTIVE',72000,CURRENT_TIMESTAMP()),
 (1005,'Ishita Jain','ishita.jain@example.com',40,'Growth Manager','2020-04-12','2025-11-30','EXITED',92000,CURRENT_TIMESTAMP()),
 (1006,'Arjun Nair','arjun.nair@example.com',10,'Data Engineer','2025-02-03',NULL,'ACTIVE',105000,CURRENT_TIMESTAMP()),
 (1007,'Sana Khan','sana.khan@example.com',20,'Accountant','2024-07-15',NULL,'ACTIVE',76000,CURRENT_TIMESTAMP()),
 (1008,'Dev Malhotra','dev.malhotra@example.com',40,'Content Strategist','2026-01-19',NULL,'ACTIVE',69000,CURRENT_TIMESTAMP());


TRUNCATE TABLE EMPLOYEE_EVENTS;
INSERT INTO EMPLOYEE_EVENTS(EVENT_ID,EMPLOYEE_ID,EVENT_TYPE,EVENT_DATE,OLD_VALUE,NEW_VALUE) VALUES
 (1,1001,'JOINED','2022-02-14',NULL,'Data Engineer'),(2,1001,'PROMOTED','2024-04-01','Data Engineer','Senior Data Engineer'),
 (3,1002,'JOINED','2023-06-05',NULL,'Analytics Engineer'),(4,1003,'SALARY_CHANGE','2025-04-01','80000','85000'),
 (5,1005,'EXITED','2025-11-30','ACTIVE','EXITED'),(6,1006,'JOINED','2025-02-03',NULL,'Data Engineer'),
 (7,1008,'JOINED','2026-01-19',NULL,'Content Strategist'),(8,1007,'TRANSFERRED','2026-03-01','People','Finance');
