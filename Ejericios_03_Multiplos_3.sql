/**
Desarrollar un programa que devuelva la cantidad de números multiplos de 3 que existen del 1 al 100.
*/
DECLARE
    v_multiple_3 NUMBER := 0;
BEGIN
    FOR v_num IN 1..100 LOOP
        IF (MOD(v_num,3)=0) THEN
            v_multiple_3 := v_multiple_3 + 1;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Números multiplos de 3 del 1 al 100: '||v_multiple_3);
END;