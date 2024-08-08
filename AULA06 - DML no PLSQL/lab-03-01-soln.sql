SET SERVEROUTPUT ON
DECLARE 
    num_dept departments.department_id%TYPE;
BEGIN
    SELECT MAX(DEPARTMENT_ID) 
    INTO num_dept 
    FROM DEPARTMENTS;
    DBMS_OUTPUT.PUT_LINE ('The maximum departments is :' || num_dept);
END;


    
    