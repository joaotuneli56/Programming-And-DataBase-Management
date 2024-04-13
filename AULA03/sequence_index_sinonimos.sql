//CAP 3 - SEQUENCE

// Excluindo sequence
DROP SEQUENCE dept_deptid_seq;

// Criando seqeunce
CREATE SEQUENCE dept_deptid_seq
                INCREMENT BY 10
                START WITH 120
                MAXVALUE 9999
                NOCACHE
                NOCYCLE;
                
// Alterando sequence
ALTER SEQUENCE dept_deptid_seq
                INCREMENT BY 20
                MAXVALUE 999999
                NOCACHE
                NOCYCLE;
                

INSERT INTO DEPARTMENTS( department_id,
            department_name,location_id)
VALUES      (dept_deptid_seq.NEXTVAL,'Support',2500);
    
//exibindo valor atual da sequence
SELECT dept_deptid_seq.CURRVAL FROM dual;







/*--------------- EXERCICIOS DE SEQUENCE, INDEX E SINONIMOS --------------------
7. Você precisa de uma sequência que possa ser usada com a coluna de chave
primária da tabela DEPT. A sequência deve começar com o valor 200 e ter o
valor máximo 1.000. Incremente a sequência em 10. Nomeie-a como
DEPT_ID_SEQ.

8. Para testar a sequência, crie um script para inserir duas linhas na tabela 
DEPT. Nomeie o script como lab_08.sql. Certifique-se de utilizar a sequência 
criada para a coluna ID. Adicione dois departamentos: Education e 
Administration. Confirme as adições. Execute os comandos no script.

9. Crie um índice não exclusivo na coluna DEPT_ID da tabela DEPT.

10. Crie um sinônimo para a tabela EMPLOYEES. Nomeie o sinônimo como EMP.

*/

//EXERCICIO 7

CREATE SEQUENCE dept_id_seq
                INCREMENT BY 10
                START WITH 200
                MAXVALUE 1000;
                
//EXERCICIO 8

CREATE TABLE DEPT
AS 
SELECT DEPARTMENT_ID DEPT_ID, DEPARTMENT_NAME NAME
FROM DEPARTMENTS
WHERE 1=2;

SELECT * FROM DEPT;

INSERT INTO DEPT VALUES (dept_id_seq.NEXTVAL, 'Education');
INSERT INTO DEPT VALUES (dept_id_seq.NEXTVAL, 'Administration');

//EXERCICIO 9

CREATE INDEX index_dept_id ON DEPT (NAME);

//EXERCICIO 10

CREATE PUBLIC SYNONYM emp FOR EMPLOYEES;





