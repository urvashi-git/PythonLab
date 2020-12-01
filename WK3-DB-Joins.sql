-- Objectives
-- After completing this lab you will be able to:

-- Use join operations on the Db2 database instance
-- Use SQL editor to run and check queries
-- HR Database
-- We will be working on a sample HR database for this Lab. This HR database schema consists of 5 tables called EMPLOYEES, JOB_HISTORY, JOBS, DEPARTMENTS and LOCATIONS. The following diagram shows the tables for the HR database with a few rows of sample data:

-- Use the EMPLOYEES and DEPARTMENTS tables created previously.
select * from EMPLOYEES;
SELECT * FROM JOB_HISTORY;
select * from DEPARTMENTS;
-- Exercises:
-- Follow these steps to create and run the queries indicated below:

-- Navigate to the Run SQL tool in Db2 on Cloud.

-- Compose query and run it.

-- Check the Logs created under the Results section. Looking at the contents of the Log explains whether the SQL statement ran successfully. Also look at the query results to ensure the output is what you expected.

-- The solutions to the queries are provided if you get stuck.

-- Query 1A: Select the names and job start dates of all employees who work for the department number 5.

-- [Hint: Use the Inner join operation with the EMPLOYEES table as the left table and the JOB_HISTORY table as the right table.]
select * from EMPLOYEES E LEFT OUTER JOIN JOB_HISTORY J ON  E.EMP_ID = J.EMPL_ID;
-- Query 1B: Select the names, job start dates, and job titles of all employees who work for the department number 5.

-- [Hint: Perform an INNER JOIN with 3 tables – EMPLOYEES, JOB_HISTORY, JOBS.]
select * from EMPLOYEES E INNER JOIN JOB_HISTORY J ON E.EMP_ID = J.EMPL_ID 
WHERE E.DEP_ID = 5;

-- Query 2A: Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name, department id and department name for all employees.

-- [Hint: Use the Left Outer Join operation with the EMPLOYEES table as the left table and the DEPARTMENTS table as the right table.]
select EMP_ID, F_NAME, L_NAME, DEP_NAME from EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEP_ID = D.DEPT_ID_DEP;

-- Query 2B: Re-write the query for 2A to limit the result set to include only the rows for employees born before 1980.

-- [Hint: use a WHERE clause. Could also use an INNER JOIN.]
Select EMP_ID, F_NAME, L_NAME, DEP_NAME from EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEP_ID = D.DEPT_ID_DEP
WHERE YEAR(E.B_DATE)>1980;


-- Query 2C: Re-write the query for 2A to have the result set include all the employees but department names for only the employees who were born before 1980.

-- [Hint: use an AND in the INNER JOIN ON clause.]
Select EMP_ID, F_NAME, L_NAME, DEP_NAME from EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEP_ID = D.DEPT_ID_DEP
WHERE YEAR(E.B_DATE)>1980;
-- Query 3A: Perform a Full Join on the EMPLOYEES and DEPARTMENT tables and select the First name, Last name and Department name of all employees.

-- [Hint: Use the Full Outer Join operation with the EMPLOYEES table as the left table and the DEPARTMENTS table as the right table.]
Select EMP_ID, F_NAME, L_NAME, DEP_NAME from EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D ON E.DEP_ID = D.DEPT_ID_DEP;
-- Query 3B: Re-write Query 3A to have the result set include all employee names but department id and department names only for male employees.

-- [Hint: Add an AND in Query 3A to filter on male employees in the ON clause. Can also use Left Outer Join.]
Select EMP_ID, F_NAME, L_NAME, DEP_NAME from EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D ON E.DEP_ID = D.DEPT_ID_DEP
WHERE E.SEX ='M';
