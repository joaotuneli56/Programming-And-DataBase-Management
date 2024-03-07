
-- exercicio 1

SELECT 
    LAST_NAME as NOME,
    HIRE_DATE as "DATA DE ADMISSAO"  
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (
    SELECT 
        DEPARTMENT_ID
    FROM EMPLOYEES 
    WHERE LAST_NAME = '&&Enter_name'    
)
AND LAST_NAME <> '&&Enter_name';

-- exercicio 2

SELECT 
    EMPLOYEE_ID as NUMERO,
    LAST_NAME as SOBRENOME,
    SALARY as SALARIO
FROM EMPLOYEES
WHERE SALARY > (
    SELECT  AVG(SALARY) as "Media Salarial" FROM EMPLOYEES
)ORDER BY SALARY;

-- exercicio 3

