-- view

CREATE VIEW empvu80
 AS SELECT employee_id, last_name, salary
    FROM employees
    WHERE department_id = 80;
    
DESCRIBE empvu80

CREATE VIEW salvu50
 AS SELECT 
        employee_id as "ID Numero", 
        last_name as "Nome" ,
        salary*12 as "salario Anual"
    FROM employees
    WHERE department_id = 50;
    
DESCRIBE salvu50

SELECT * FROM empvu80;

-- ALTERANDO VIEW

CREATE OR REPLACE VIEW empvu80
    (id_number, name, sal, deparment_id)
AS SELECT 
        employee_id, 
        first_name || ' '|| last_name,
        salary,
        department_id
    FROM employees
    WHERE department_id = 80;
    
select * from empvu80;

-- VIEW COMPLEXA

CREATE VIEW dept_sum_vu
 (name, minsal, maxsal, avgsal)
AS SELECT 
    d.department_name, 
    MIN(e.salary),
    MAX(e.salary),
    ROUND(AVG(e.salary),2)
 FROM 
    employees e,
    departments d
 WHERE e.department_id = d.department_id
 GROUP BY d.department_name;
 
SELECT * FROM dept_sum_vu;

--EXERCICIOS

--PARTE 1

CREATE VIEW EMPLOYEES_VU
(EMPLOYEE_ID, EMPLOYEE, DEPARTMENT_ID)
AS 
    SELECT
        employee_id,
        first_name || ' '|| last_name,
        department_id
    FROM EMPLOYEES;

SELECT * FROM EMPLOYEES_VU;

SELECT 
    EMPLOYEE,
    DEPARTMENT_ID
FROM EMPLOYEES_VU;

-- PARTE 2

CREATE OR REPLACE VIEW  DEPT50
AS 
SELECT 
    employee_id EMPNO,
    last_name EMPLOYEE,
    department_id DEPTON
 FROM employees
 WHERE department_id = 50
 WITH check option ;
 
DESCRIBE DEPT50;
SELECT * FROM DEPT50;

-- NÃO É POSSIVEL FAZER INSERT COM VISÃO
--

    


 