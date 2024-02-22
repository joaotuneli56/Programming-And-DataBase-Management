// EXEMLPLO 1

SELECT last_name
FROM   employees
WHERE  salary >
               (SELECT salary
                FROM   employees
                WHERE  last_name = 'Abel');
                

//NÃO É POSSIVEL COLOCAR ORDER BY NAS SUB-QUERYES

-------------------------------------------------

// EXEMLPLO 2

SELECT last_name, job_id, salary
FROM   employees
WHERE  job_id =  
                (SELECT job_id
                 FROM   employees
                 WHERE  employee_id = 141)
AND    salary >
                (SELECT salary
                 FROM   employees
                 WHERE  employee_id = 143)
ORDER BY last_name;

-------------------------------------------------

// EXEMLPLO 3
//funcionarios que ganham o menor salario

SELECT last_name, job_id, salary
FROM   employees
WHERE  salary = 
                (SELECT MIN(salary)
                 FROM   employees);

-------------------------------------------------
// EXEMLPLO 4

SELECT   department_id, MIN(salary)
FROM     employees
GROUP BY department_id
HAVING   MIN(salary) >
                       (SELECT MIN(salary)
                        FROM   employees
                        WHERE  department_id = 50);
                        
// WHERE FILTRA O NOME DA COLUNA
// HAVING FUNÇÕES DE GRUPO
// BOA Pratica primeiro agrupar e depois filtrar

-------------------------------------------------

// EXEMLPLO 4



SELECT employee_id, last_name, department_id, salary
FROM   employees
WHERE  salary in 
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id);
                 

// Para tratar listas usar IN
-------------------------------------------------

// EXEMLPLO 

SELECT last_name, job_id
FROM   employees
WHERE  job_id =
                (SELECT job_id
                 FROM   employees
                 WHERE  last_name = 'Haas');

-------------------------------------------------
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';

-------------------------------------------------
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';

-------------------------------------------------

SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
order by 1;

SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY 
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
order by 1;

-------------------------------------------------

SELECT emp.last_name
FROM   employees emp
WHERE  emp.employee_id NOT IN
                           (SELECT mgr.manager_id
                            FROM   employees mgr
                            WHERE MANAGER_ID IS NOT NULL);
-------------------------------------------------

SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ALL
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG');
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < 
                    (SELECT min(salary)
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
order by 1;

-------------------------------------------------

SELECT employee_id, last_name, manager_id, job_id
FROM EMPLOYEES
ORDER BY 1;

-------------------------------------------------

//EXERCICIOS

/*1. Crie um relatório que exiba o número e o sobrenome de todos os funcionários 
cujo salário é maior que o salário médio. Classifique os resultados em
ordem crescente de salário.
 
 
2. Crie uma consulta que exiba o número e o sobrenome de todos os funcionários 
que trabalham em um departamento com funcionários cujos sobrenomes contêm 
a letra u.  Execute a consulta.
 
3. O departamento de recursos humanos precisa de um relatório que exiba o 
sobrenome, o número do departamento e o ID do cargo de todos os funcionários 
cujo ID de local do departamento é 1700.
 
 
4. Crie um relatório para o departamento de recursos humanos que exiba o 
sobrenome e o salário de todos os funcionários subordinados a Steven King.
 
 
5. Crie um relatório para o departamento de recursos humanos que exiba o 
número do departamento, o sobrenome e o ID do cargo de todos os funcionários
no departamento executivo.
 
 
6. Modifique a consulta do exercício 2 para exibir o número, o sobrenome, 
bem como o salário de todos os funcionários que ganham mais que o salário 
médio e trabalham em um departamento com funcionários cujos sobrenomes 
contêm a letra u. 

*/

-------------------------------------------------------------------------
//EXERCICIOO1



-------------------------------------------------------------------------
//EXERCICIO02

SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                         FROM EMPLOYEES
                         WHERE UPPER(LAST_NAME) LIKE '%U%');





