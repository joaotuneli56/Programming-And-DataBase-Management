-----------------------------------------------------------------
--Instruções DML "Data Manipulation Language" EXEMPLOS (AVANÇADO) 
--INSERT
/*Para evitar a criação de uma visão para executar uma inserção 
é possível utilizar uma subconsulta no lugar do nome da tabela. */

DROP TABLE EMPLOYEES_RETIRED; 

 CREATE TABLE EMPLOYEES_RETIRED 
   (	EMPLOYEE_ID NUMBER(6), 
	FIRST_NAME VARCHAR2(20), 
	LAST_NAME VARCHAR2(25), 
	EMAIL VARCHAR2(25), 
	PHONE_NUMBER VARCHAR2(20), 
	HIRE_DATE DATE, 
	RETIRED_DATE DATE, 
	JOB_ID VARCHAR2(10), 
	SALARY NUMBER(8,2), 
	COMMISSION_PCT NUMBER(2,2)
  ) ;
  
INSERT INTO EMPLOYEES_RETIRED 
   (employee_id, first_name, last_name, email, 
    phone_number, hire_date, retired_date, job_id, 
    salary, commission_pct)
SELECT employee_id, first_name, last_name, email, 
       phone_number, hire_date, sysdate, job_id, 
       salary, commission_pct
FROM employees
WHERE employee_id=110;

SELECT * 
FROM employees_retired;

--CTAS
DROP TABLE EMPLOYEES_BKP;

CREATE TABLE EMPLOYEES_BKP
AS SELECT * FROM EMPLOYEES;
--WHERE 1=2;

SELECT * FROM EMPLOYEES_BKP;
desc EMPLOYEES_BKP;
-----------------------------------------------------------------
--Instruções DML "Data Manipulation Language" EXEMPLOS (AVANÇADADO)
--UPDATE
/* Transfira para o mesmo departamento do funcionário 130 
todos os funcionários que tem o mesmo cargo do funcionário de código 114 */

UPDATE  employees
SET     department_id  =  (SELECT department_id
                           FROM employees
                           WHERE employee_id = 100)
WHERE   job_id         =  (SELECT job_id
                           FROM employees
                           WHERE employee_id = 114);
ROLLBACK;
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'PU_MAN';
--SQL
-----------------------------------------------------------------
--Instruções DML "Data Manipulation Language" EXEMPLOS (AVANÇADADO)
--DELETE
/* Delete todos os funcionário do departamento chamado Retail Sales */
DELETE FROM employees
WHERE  department_id =
                (SELECT department_id
                 FROM   departments
                 WHERE  department_name = 'IT');

ROLLBACK;

UPDATE DEPARTMENTS
SET MANAGER_ID = NULL
WHERE DEPARTMENT_NAME = 'IT';
-----------------------------------------------------------------
drop table SAL_HIST_DEPT;
 CREATE TABLE SAL_HIST_DEPT 
   (	EMP_ID NUMBER(6), 
	HIREDATE DATE NOT NULL,
	SALARY NUMBER(8,2)) ;

drop table MGR_HIST_DEPT ;
  CREATE TABLE MGR_HIST_DEPT 
   (	EMPID NUMBER(6), 
	MANAGER NUMBER(6), 
	SAL NUMBER(8,2));
   
--INSERT Incondicional: ALL clausula_inserção 
/* Nesse exemplo serão inseridos nas tabelas sal_hist_dept e mgr_hist_dept 
as informações dos funcionários que trabalham no departamento cujo código é igual a 90. */

INSERT  ALL 
INTO sal_hist_dept VALUES(EMP_ID,HIREDATE,SALARY) 
INTO mgr_hist_dept VALUES(EMP_ID,MANAGER,SALARY)
SELECT employee_id EMP_ID, 
       hire_date   HIREDATE,
       salary, 
       manager_id  MANAGER 
FROM  employees   
WHERE department_id = 90 ; 

select * from sal_hist_dept;
select * from mgr_hist_dept;
-----------------------------------------------------------------
--INSERT Condicional: clasula_insercao_condicional 

/*Nesse exemplo serão inseridos:
Na tabela sal_hist_dept os funcionários que têm o salÃ¡rio menor que 20000.
Na tabela mgr_hist_dept os funcionários que se reportam para um funcionário superior na hierarquia. 
Todos os funcionários selecionados trabalham no departamento cujo código é igual a 90.
*/
TRUNCATE TABLE sal_hist_dept;
TRUNCATE TABLE mgr_hist_dept;
INSERT ALL
  WHEN SALARY < 20000 THEN
    INTO sal_hist_dept VALUES(EMP_ID,HIREDATE,SALARY) 
  WHEN MANAGER IS NULL   THEN 
    INTO mgr_hist_dept VALUES(EMP_ID,MANAGER,SALARY)
    SELECT employee_id EMP_ID, 
           hire_date   HIREDATE,
           salary, 
           manager_id  MANAGER 
    FROM  employees   
    WHERE department_id = 90 ;    

select * from sal_hist_dept;
select * from mgr_hist_dept;
-----------------------------------------------------------------
--INSERT Condicional: FIRST
drop table highest_sal;
create table highest_sal
	(deptid number(4),
	sal number(8,2));

drop table hiredate_hist_00;
create table hiredate_hist_00
	(deptid number(4),
	hiredate date);

drop table hiredate_hist_99;
create table hiredate_hist_99
	(deptid number(4),
	hiredate date);

drop table hiredate_hist;
create table hiredate_hist
	(deptid number(4),
	hiredate date);

INSERT FIRST
  WHEN SUM_SALARY  > 25000 THEN
    INTO highest_sal VALUES(DEPT_ID, SUM_SALARY)
  WHEN HIREDATE like ('%00%') THEN
    INTO hiredate_hist_00 VALUES(DEPT_ID, HIREDATE)
  WHEN HIREDATE like ('%99') THEN 
    INTO hiredate_hist_99 VALUES(DEPT_ID, HIREDATE)
  ELSE
    INTO hiredate_hist VALUES(DEPT_ID, HIREDATE)
  SELECT department_id  DEPT_ID, 
         SUM(salary)    SUM_SALARY,
         MAX(hire_date) HIREDATE
  FROM   employees
  group by department_id;
  
 select * from  highest_sal;
 select * from  hiredate_hist_00;
 select * from  hiredate_hist_99;
 select * from  hiredate_hist;
-----------------------------------------------------------------
--INSERT de Criação de Pivô-Exemplo 

drop table sales_informations;
create  table sales_informations
	(emp_id number(5),
	last_name varchar(50) not null,
	week_id number(2),
	week_day varchar(10));

drop TABLE SALES_DATA;
CREATE TABLE SALES_DATA
	(employee_id 	NUMBER(6),
	last_name  VARCHAR(50),
	WEEK_ID	NUMBER(2),
	MONDAY	NUMBER(8,2),
	TUESDAY	NUMBER(8,2),
	WEDNESDAY	NUMBER(8,2),
	THURSDAY	NUMBER(8,2),
	FRIDAY	NUMBER(8,2));

/* Nesse exemplo será realizada uma transformação de forma que 
cada linha de uma tabela será convertia em várias outras linhas. */

INSERT INTO SALES_DATA  
VALUES (176,'Meg', 6, 2000,3000,4000,5000,6000);
commit;

SELECT * FROM SALES_DATA;

SELECT employee_id, (MONDAY+TUESDAY+WEDNESDAY+THURSDAY+FRIDAY)/ 5 FROM SALES_DATA;


INSERT ALL
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, MONDAY)
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, TUESDAY)
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, WEDNESDAY)
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, THURSDAY)
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, FRIDAY)
  SELECT employee_id emp_id, 
         last_name ,
         week_id,
         MONDAY,
         TUESDAY,
         WEDNESDAY, 
         THURSDAY,
         FRIDAY 
  FROM SALES_DATA;
  
  SELECT LAST_NAME,WEEK_ID,
                  SUM(WEEK_DAY),
                  AVG(WEEK_DAY),
                  MAX(WEEK_DAY),
                  MIN(WEEK_DAY),
                  ROUND(STDDEV(WEEK_DAY),2)
  FROM SALES_INFORMATIONS
  GROUP BY LAST_NAME,WEEK_ID;
  
  
SELECT * 
FROM sales_informations;
-----------------------------------------------------------------
--Instrução Exemplo 
/*Caso a linha exista será executada uma atualização senão será executada uma inserção caso a linha seja nova. */

drop table catalog1;
create table catalog1 
	(id number(3) primary key, 
	item varchar2 (20), 
	price number(6));

insert into catalog1 values(1, 'laptop', 800);
insert into catalog1 values(2, 'iphone', 500);
insert into catalog1 values(3, 'camera', 700);
commit;

drop table catalog2;
create table catalog2 
(id number(3)  primary key,  
item varchar2 (20), 
price number(6));

insert into catalog2 values(1, 'laptop', 899);
insert into catalog2 values(2, 'iphone', 599);
insert into catalog2 values(5, 'video camera', 799);
commit;

select * from catalog1;
select * from catalog2;

/* Essa instrução irÃ¡ inserir na tabela CATALOG1 a linha (5, 'video camera', 799)
e ira atualizar os preÃ§os dos proudtos 1 e 2  par 899 e 599 respectivamente */
MERGE 
INTO catalog1 s1 
USING catalog2 s2 
ON (s1.id = s2.id) 
WHEN MATCHED THEN 
   UPDATE SET s1.price = s2.price  
WHEN NOT MATCHED THEN 
   INSERT (id, item, price) 
   values (s2.id, s2.item, s2.price);
commit;
select * from catalog1;
select * from catalog2;
-----------------------------------------------------------------
--AGRUPAMENTO ROLLUP-Exemplo 
--GROUP BY
SELECT   department_id dept, job_id job, 
         SUM(salary) sum_salary 
FROM     employees  
WHERE    department_id >= 50
GROUP BY department_id, job_id
ORDER  BY 1,2;

/* No exemplo  serão exibidos os totais de salários agrupados por cargos 
dentro dos respectivos departamentos, os subtotais dos salários por departamento  
e o total geral para todos os departamentos que têm o código maior ou igual que 50. */

SELECT   department_id dept, job_id job, 
         SUM(salary) sum_salary 
FROM     employees  
WHERE    department_id >= 50
GROUP BY rollup(department_id, job_id)
ORDER  BY 1,2;

-----------------------------------------------------------------
--AGRUPAMENTO CUBE-Exemplo  
/*No exemplo serão exibidos os totais de salários agrupados por cargos dentro 
dos respectivos departamentos, os subtotais dos salários por departamento, 
o total por cargo independente dos departamentos, o total por departamentos 
independente dos cargos e o total geral para todos os departamentos 
que tem o código igual ou maior que 50. */

SELECT   department_id, job_id job, SUM(salary) sum_salary
FROM     employees  
WHERE    department_id >= 50
GROUP BY CUBE(department_id, job_id)
ORDER BY 1,2;
-----------------------------------------------------------------
--Consultas Hieráquicas-Exemplos 
--ANTES UM SELF JOIN..
SELECT sup.last_name    sup,
       sup.job_id       job_supuerior,
       sub.last_name    sub,
       sub.job_id       job_sobordinado
FROM employees sup
JOIN employees sub 
ON(sup.employee_id = sub.manager_id);

--Árvore de hierarquia  percorrida de baixo para cima:
SELECT employee_id, last_name, job_id, manager_id
FROM   employees
START  WITH  last_name = 'Kochhar'
CONNECT BY PRIOR manager_id = employee_id ;

--Árvore  percorrida de cima para baixo:
SELECT  last_name||' Responde para '|| 
PRIOR   last_name "Ã?rvore de Cima para Baixo", 
LEVEL   "NÃ­vel"
FROM    employees
START   WITH employee_id = 100
CONNECT BY PRIOR employee_id = manager_id;
-----------------------------------------------------------------
--CLÁUSULA WITH 
/* A cláusula WITH tem por característica facilitar a leitura da consulta, 
apenas uma clásula por vez é avaliada mesmo se ela aparecer inúmeras vezes na consulta.

Nesse exemplo a consulta irá selecionar o nome do departamento e o total de salários dos departamentos 
quando o somatório de salários dos departamentos é maior que a média do somatório dos salários dos departamentos */

SELECT    d.department_name, SUM(e.salary) dept_total
FROM      employees e INNER JOIN departments d 
ON        e.department_id = d.department_id
GROUP BY  d.department_name
HAVING    SUM(e.salary)>(SELECT AVG(dept_total)
                         FROM (SELECT d.department_name, SUM(e.salary) dept_total
                               FROM employees e JOIN departments d 
                               ON e.department_id = d.department_id
                          GROUP BY d.department_name ))
ORDER BY department_name;
-----------------------------------------------------------------
--CLÁUSULA WITH-Exemplo
/* Nesse exemplo será utilizada a cláusula WITH  para produzir o mesmo resultado do comando SELECT anterior*/

WITH 
    dept_costs AS( SELECT d.department_name, SUM(e.salary) dept_total -- SOMATÃ“RIOS DOS SALARIOS POR DEPTO
                   FROM  employees e JOIN departments d 
                   ON e.department_id = d.department_id
                   GROUP BY  d.department_name),  
    avg_cost AS (SELECT AVG(dept_total)AS dept_avg ----MÃ‰DIA DOS SOMATÃ“RIOS DOS SALARIOS POR DEPTO
                 FROM dept_costs)
SELECT  *
FROM   dept_costs
WHERE  dept_total >( SELECT dept_avg
                     FROM   avg_cost )
ORDER BY department_name;


