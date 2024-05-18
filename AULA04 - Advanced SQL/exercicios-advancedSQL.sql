---------------------------------- EXERCICIO 01 --------------------------------

-- passo 1 - Execute o script a seguir para criar a tabela SAL_HISTORY --

DROP TABLE SAL_HISTORY;

CREATE table SAL_HISTORY
(
    EMPLOYEE_ID NUMBER(6),
    HIRE_DATE DATE,
    SALARY NUMBER(8,2)
);

-- passo 2 - SAL_HISTORY. --

SELECT * FROM SAL_HISTORY;

-- passo 3 - Execute o script a seguir para criar a tabela MGR_HISTORY --

DROP TABLE MGR_HISTORY;
CREATE table MGR_HISTORY
(
    EMPLOYEE_ID NUMBER(6),
    MANAGER_ID NUMBER(6),
    SALARY NUMBER(8,2)
);

-- passo 4 - Exiba a estrutura MGR_HISTORY --

SELECT * FROM MGR_HISTORY;

-- passo 5 - Execute o script a seguir para criar a tabela SPECIAL_SAL. --

drop TABLE SPECIAL_SAL;

CREATE table SPECIAL_SAL
(
    EMPLOYEE_ID NUMBER(6),
    SALARY NUMBER(8,2)
);

-- passo 6 - Exiba a estrutura do SPECIAL_SAL --

SELECT * FROM SPECIAL_SAL;

/* passo 7 - Exiba a estrutura do SPECIAL_SAL

   Crie uma consulta que faça o seguinte:
   
   Recupere na tabela EMPLOYEES os detalhes de ID do funcionário, data de 
   admissão, salário e o ID do gerente desses funcionários cujo ID é inferior a 125.
    
   Se o salário for superior a $20.000, insira os detalhes sobre o ID do 
   funcionário e o salário na tabela SPECIAL_SAL.

   Insira o ID do funcionário, a data de admissão e o salário na tabela SAL_HISTORY.

   Insira os detalhes sobre o ID do funcionário, o ID do gerente e o salário na
   tabela MGR_HISTORY.

*/
INSERT
    WHEN SALARIO > 20000 THEN
        INTO SPECIAL_SAL VALUES (ID_FUNCIONARIO,SALARIO)
    ELSE
        INTO SAL_HISTORY VALUES (ID_FUNCIONARIO,DATA_ADMISSAO,SALARIO)
        INTO MGR_HISTORY VALUES (ID_FUNCIONARIO,CHEFE,SALARIO)
SELECT 
    employee_id as ID_FUNCIONARIO,
    hire_date as DATA_ADMISSAO ,
    salary as SALARIO,
    manager_id AS CHEFE
FROM EMPLOYEES
WHERE EMPLOYEE_ID < 125;


---------------------------------- EXERCICIO 02 --------------------------------

-- passo 1 - Execute o script a seguir para criar a tabela SALES_SOURCE_DATA. --

DROP TABLE SALES_SOURCE_DATA;

CREATE TABLE SALES_SOURCE_DATA
(
    employee_id NUMBER(6),
    WEEK_ID NUMBER(2),
    SALES_MON NUMBER(8,2),
    SALES_TUE NUMBER(8,2),
    SALES_WED NUMBER(8,2),
    SALES_THUR NUMBER(8,2),
    SALES_FRI NUMBER(8,2)
);

-- passo 3 - Execute o script a seguir para inserir registros na tabela SALES_SOURCE_DATA. --

INSERT INTO SALES_SOURCE_DATA VALUES (178, 6, 1750,2200,1500,1500,3000);

commit;

-- passo 4 - Exiba a estrutura da tabela SALES_SOURCE_DATA --

describe SALES_SOURCE_DATA;


-- passo 5 - Exiba os registros da tabela SALES_SOURCE_DATA.--


SELECT * FROM SALES_SOURCE_DATA;


-- passo 6 - Execute o script para criar a tabela SALES_INFO. --

drop TABLE SALES_INFO;

CREATE TABLE SALES_INFO
(
    employee_id NUMBER(6),
    WEEK NUMBER(2),
    SALES NUMBER(8,2)
);

-- passo 7 - Exiba a estrutura da tabela SALES_INFO. --

describe SALES_INFO;

INSERT ALL
    INTO SALES_INFO VALUES (EMPLOYEE_ID,WEEK_ID,SALES_MON)
    INTO SALES_INFO VALUES (EMPLOYEE_ID,WEEK_ID,SALES_TUE)
    INTO SALES_INFO VALUES (EMPLOYEE_ID,WEEK_ID,SALES_WED)
    INTO SALES_INFO VALUES (EMPLOYEE_ID,WEEK_ID,SALES_THUR)
    INTO SALES_INFO VALUES (EMPLOYEE_ID,WEEK_ID,SALES_FRI)
SELECT 
    EMPLOYEE_ID,
    WEEK_ID,
    SALES_MON,
    SALES_TUE,
    SALES_WED,
    SALES_THUR,
    SALES_FRI
FROM SALES_SOURCE_DATA;

-- passo 7 - Exiba os dados de SALES_INFO. --

SELECT * FROM SALES_INFO;
    



