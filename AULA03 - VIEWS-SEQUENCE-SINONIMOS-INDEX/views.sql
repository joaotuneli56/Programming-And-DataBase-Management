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

/*---------------------------- EXERCICIOS SEQUENCE ----------------------------
1. A equipe do departamento de recursos humanos deseja ocultar alguns dados da
tabela EMPLOYEES. Ela deseja uma view denominada EMPLOYEES_VU com base nos 
números e nomes de funcionário, bem como nos números de departamento da tabela 
EMPLOYEES. Também deseja atribuir EMPLOYEE como o cabeçalho do nome do 
funcionário.

2. Verifique se a view funciona. Exiba o conteúdo da view EMPLOYEES_VU. 

3. Usando a view EMPLOYEES_VU, crie uma consulta para o departamento de
recursos humanos a fim de exibir todos os nomes de funcionário e números de
departamento.

4. O departamento 50 precisa de acesso aos dados de seus funcionários. Crie uma
view denominada DEPT50 que contenha os números e os sobrenomes, bem
como os números de departamento de todos os funcionários do departamento
50. Foi solicitada a atribuição dos labels EMPNO, EMPLOYEE e DEPTNO às
colunas da view. Para fins de segurança, não permita que um funcionário seja
redesignado a outro departamento por meio da view.

5. Exiba a estrutura e o conteúdo da view DEPT50. 

6. Teste a view. Tente redesignar Matos ao departamento 80 (transfira Matos para o
departamento 80).

*/

--1
CREATE OR REPLACE VIEW employees_vu AS
    SELECT employee_id, last_name employee, department_id
    FROM employees;

--2
SELECT   *
FROM     employees_vu;   

--3
SELECT   employee, department_id 
FROM     employees_vu;

--4
CREATE VIEW dept50 AS   
   SELECT   employee_id empno, last_name employee,
            department_id deptno
   FROM     employees
   WHERE    department_id = 50
   WITH CHECK OPTION CONSTRAINT emp_dept_50;

--5
DESCRIBE dept50

SELECT   *
FROM     dept50;              

--6
UPDATE   dept50
SET      deptno = 80
WHERE    employee = 'Matos';
