select * from locations;
select * from departments;

--EXERCICIO 1

SET SERVEROUTPUT ON
DECLARE 
    num_dept departments.department_id%TYPE;
BEGIN
    SELECT MAX(DEPARTMENT_ID) 
    INTO num_dept 
    FROM DEPARTMENTS;
    DBMS_OUTPUT.PUT_LINE ('The maximum departments is :' || num_dept);
END;


--EXERCICIO 2

VARIABLE new_dept NUMBER;
SET SERVEROUTPUT ON
DECLARE 
    num_dept departments.department_id%TYPE;
    nome_novo_dept departments.department_name%TYPE := 'EDUCATION';
BEGIN
    SELECT MAX(DEPARTMENT_ID) INTO num_dept FROM DEPARTMENTS;
    DBMS_OUTPUT.PUT_LINE ('The maximum departments is :' || num_dept);
    :new_dept := 10 + num_dept;
    INSERT INTO departments (department_id, department_name, location_id)
    VALUES (:new_dept, nome_novo_dept, NULL);
    DBMS_OUTPUT.PUT_LINE('SQL%ROWCOUNT tem : '|| SQL%ROWCOUNT);
END;

--EXERCICIO 3
SET SERVEROUTPUT ON
    ACCEPT num_dept  PROMPT 'Informe o numero do departmento: '
    ACCEPT location_dept PROMPT 'Informe o id da localização do departmento: '
DECLARE 
    numero_dept departments.department_id%TYPE:=&num_dept;
    localizacao_id departments.location_id%TYPE:=&location_dept;
BEGIN
    UPDATE departments
    SET location_id = localizacao_id
    WHERE department_id = numero_dept;
END;

--EXERCICIO 4

VARIABLE num_line_effected NUMBER
SET SERVEROUTPUT ON
    ACCEPT numero_departamento PROMPT 'Informe o numero do departamento: '
DECLARE
    num_dept departments.department_id%TYPE := &numero_departmento;
BEGIN
  DELETE FROM departments
  WHERE department_id = num_dept;
  :num_line_effected := SQL%ROWCOUNT;
END;
/
PRINT num_line_effected;
    


    