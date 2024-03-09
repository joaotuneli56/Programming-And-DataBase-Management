--VIEWS
DROP VIEW EMPVU80;

CREATE VIEW 	empvu80
 AS SELECT  employee_id, last_name, salary
    FROM    employees
    WHERE   department_id = 80;

	
DESCRIBE empvu80;

SELECT * FROM empvu80;

UPDATE empvu80 
SET SALARY=15000 
WHERE EMPLOYEE_ID=145;

DELETE FROM EMPVU80
WHERE EMPLOYEE_ID=179;

DESC EMPVU80;

INSERT INTO EMPVU80
VALUES (12345,'Bob',10000);

DESC EMPLOYEES;

CREATE VIEW 	salvu50
 AS SELECT  employee_id ID_NUMBER, last_name NAME,salary*12 ANN_SALARY
    FROM    employees
    WHERE   department_id = 50;

SELECT *
FROM   salvu50;

UPDATE salvu50
SET ANN_SAL=100000
WHERE ID_NUMBER=120;


CREATE OR REPLACE VIEW empvu80
  (id_number, name, sal, department_id)
AS SELECT  employee_id, first_name || ' '  || last_name, salary, department_id
   FROM    employees
   WHERE   department_id = 80;

CREATE VIEW	dept_sum_vu
  (name, minsal, maxsal, avgsal)
AS SELECT	 d.department_name, MIN(e.salary),MAX(e.salary),AVG(e.salary)
   FROM      employees e INNER JOIN departments d
   ON     e.department_id = d.department_id 
   GROUP BY  d.department_name;

CREATE OR REPLACE VIEW empvu20
AS SELECT	*
   FROM     employees
   WHERE    department_id = 20;
   --WITH CHECK OPTION CONSTRAINT empvu20_ck ;
INSERT INTO EMPVU20
VALUES (12345,NULL,'BOB','BOB@XPTO.COM',NULL,SYSDATE,'IT_PROG',12000,NULL,NULL,20);

CREATE OR REPLACE VIEW empvu10
    (employee_number, employee_name, job_title)
AS SELECT	employee_id, last_name, job_id
   FROM     employees
   WHERE    department_id = 10
   WITH READ ONLY ;


DROP VIEW empvu80;
