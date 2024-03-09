SELECT * FROM EMPLOYEES;
SELECT * FROM JOBS;
SELECT * FROM JOB_HISTORY;
SELECT * FROM EMERGENCY_CONTACTS;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;
SELECT * FROM COUNTRIES;
SELECT * FROM REGIONS;
SELECT * FROM JOB_GRADES;

SELECT last_name, job_id
FROM employees
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id = 141);
                
SELECT MIN(salary)
FROM employees
GROUP BY department_id;

-- EXERCICIO DE SUBCONSULTA

-- EXERCICICIO 1

SELECT 
    LAST_NAME as Nome,
    HIRE_DATE as "Data de Admissão"
FROM employees
WHERE DEPARTMENT_ID = ( SELECT department_id 
                        FROM EMPLOYEES 
                        WHERE last_name='&&Enter_name')
AND LAST_NAME <> '&&Enter_name';

-- EXERCICICIO 2
SELECT 
    EMPLOYEE_ID as COD,
    LAST_NAME as Sobrenome,
    SALARY as Salario
FROM EMPLOYEES
WHERE salary > (SELECT ROUND(AVG(SALARY),2) as "Salario Medio" 
                FROM EMPLOYEES)
ORDER BY SALARY ASC;

-- EXERCICICIO 3

SELECT 
    employee_id,
    last_name
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (SELECT 
                            DEPARTMENT_ID
                        FROM EMPLOYEES 
                        WHERE LAST_NAME like '%u%'
                        OR LAST_NAME like UPPER('%u%'));
                        
-- EXERCICICIO 4.A

SELECT 
    LAST_NAME,
    DEPARTMENT_ID,
    JOB_ID
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
                        FROM DEPARTMENTS 
                        WHERE LOCATION_ID = 1700)
ORDER BY DEPARTMENT_ID;

-- EXERCICICIO 4.B

SELECT 
    LAST_NAME,
    DEPARTMENT_ID,
    JOB_ID
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
                        FROM DEPARTMENTS 
                        WHERE LOCATION_ID = '&&Enter_location')
ORDER BY DEPARTMENT_ID;

-- EXERCICICIO 5

SELECT 
    LAST_NAME as SOBRENOME,
    SALARY as "SALARIO(R$)"
FROM EMPLOYEES
WHERE MANAGER_ID = (SELECT EMPLOYEE_ID 
                    FROM EMPLOYEES 
                    WHERE FIRST_NAME = 'Steven' AND LAST_NAME = 'King');
                    
            
-- EXERCICICIO 6

SELECT 
    DEPARTMENT_ID,
    LAST_NAME,
    JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME ='Executive');

-- EXERCICICIO 7

SELECT 
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT 
                            DEPARTMENT_ID
                        FROM EMPLOYEES 
                        WHERE LAST_NAME like '%u%'
                        OR LAST_NAME like UPPER('%u%'))
AND SALARY > (SELECT 
                ROUND(AVG(SALARY),2) as "Salario Medio" 
              FROM EMPLOYEES)
ORDER BY SALARY ,LAST_NAME;
