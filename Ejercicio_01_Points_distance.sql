DECLARE
    v_point_x1 NUMBER := 3;
    v_point_x2 NUMBER := 2;
    v_point_y1 NUMBER := 5;
    v_point_y2 NUMBER := 8;
    v_distance DECIMAL(6,2);
BEGIN
    v_distance := SQRT(POWER((v_point_x1-v_point_x2),2)+POWER((v_point_y1-v_point_y2),2));
    DBMS_OUTPUT.PUT_LINE('CALCULAR LA DISTANCIA DE DOS PUNTOS');
    DBMS_OUTPUT.PUT_LINE('************************************');
    DBMS_OUTPUT.PUT_LINE('Punto X : (' || v_point_x1||','||v_point_x2||')');
    DBMS_OUTPUT.PUT_LINE('Punto Y : (' || v_point_y1||','||v_point_y2||')');
    DBMS_OUTPUT.PUT_LINE('Distancia XY : ' || v_distance);
END;
