/*EXEMPLOS DE BLOCOS PL/SQL*/

SET SERVEROUTPUT ON
    ACCEPT p_annual_sal 
    PROMPT 'Please enter the annual salary: '
DECLARE
    v_sal NUMBER(9,2) := &p_annual_sal;
BEGIN
    v_sal := v_sal/12;
    DBMS_OUTPUT.PUT_LINE ('The monthly salary is ' || TO_CHAR(v_sal));
END;

SET SERVEROUTPUT ON
    ACCEPT nome 
    PROMPT 'Digite seu nome completo: '
    ACCEPT idade 
    PROMPT 'Agora sua idade:'
DECLARE
    nome VARCHAR2(30) := '&nome';
    idade NUMBER := &idade;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Bem-vindo ' || nome || ' ! voce tem ' || TO_CHAR(idade) || 'anos.');
END;

/*exericio 2*/

BEGIN
    DBMS_OUTPUT.PUT_LINE ('Hello word');
END;

    
