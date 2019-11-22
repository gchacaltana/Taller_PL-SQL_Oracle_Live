/**
Desarrollar un programa que sume "n" veces un número aleatorio.
Imprimir en pantalla los números aleatorios generados y la suma obtenida. 
La cantidad de iteraciones deberá de generarse de manera aleatoria, considerando los valores del 1 al 10.
Los números aleatorios generados en cada iteración deberán ser del 10 al 100;
*/
DECLARE
    v_sum NUMBER := 0;
    v_x NUMBER :=0;
    v_num NUMBER;
	v_limit NUMBER;
BEGIN
	v_limit := FLOOR(DBMS_RANDOM.value(1,10));
    LOOP
        v_x := v_x + 1;
        v_num := FLOOR(DBMS_RANDOM.value(10,100));
        DBMS_OUTPUT.PUT_LINE('Número aleatorio '||v_x||' -> '|| v_num);
        v_sum := v_sum + v_num;
    EXIT WHEN v_x = v_limit;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Suma Total = '||v_sum);
END;