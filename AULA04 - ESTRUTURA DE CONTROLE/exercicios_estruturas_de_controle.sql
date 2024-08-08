-- EXERCICIOS ESTRUTURAS DE CONTROLE [IF | ELSEIF | ELSE | FOR | WHILE | LOOP]

-- 1 

CREATE TABLE messages (TEXT VARCHAR(50));

SET SERVEROUTPUT ON
BEGIN
    FOR cont IN 1..10 LOOP
        IF cont <> 6 AND cont <> 8 THEN
            INSERT INTO messages VALUES (TO_CHAR(cont));
        END IF;
    END LOOP;
END;

SELECT * FROM messages;

-- 2

DROP TABLE emp;
CREATE TABLE emp
AS SELECT * FROM employees;
ALTER TABLE emp
ADD stars VARCHAR(50);

ACCEPT p_empno PROMPT 'Informe o número do funcionário: '
DECLARE
 v_empno emp.employee_id%TYPE := TO_NUMBER(&p_empno);
 v_asterisk emp.stars%TYPE := NULL;
 v_sal emp.salary%TYPE;
BEGIN
 SELECT NVL(ROUND(salary/1000), 0)
 INTO v_sal
 FROM emp
 WHERE employee_id = v_empno;

 FOR i IN 1..v_sal LOOP
 v_asterisk := v_asterisk ||'*';
 END LOOP;
 UPDATE emp
 SET stars = v_asterisk
 WHERE employee_id = v_empno;

 COMMIT;
END;
/
    
SELECT EMPLOYEE_ID, SALARY,STARS, LENGTH(STARS) STARS_COUNT
FROM EMP
WHERE EMPLOYEE_ID in (100,170,107);
        
        
    







