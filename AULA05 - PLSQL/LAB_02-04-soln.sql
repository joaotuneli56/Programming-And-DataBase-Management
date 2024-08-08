DECLARE
    today DATE;
    tomorrow today%TYPE;
BEGIN 
    tomorrow := SYSDATE + 1;
    DBMS_OUTPUT.PUT_LINE ('Hello word');
    DBMS_OUTPUT.PUT_LINE ('TODAY IS:' || today);
    DBMS_OUTPUT.PUT_LINE ('TOMORROW IS: ' || tomorrow);
END;
