
/**
ELABORE UN BLOQUE ANONIMO PL/SQL QUE ALMACENE EN CURSOR LA LISTA DE EMPLEADOS (CODIGO, NOMBRE, APELLIDOS Y SALARIO) 
Y MOSTRARLO EL RESULTADO POR CADA REGISTRO
*/

DECLARE
    CURSOR employees_cursor IS
        SELECT employee_id,first_name,last_name,salary FROM hr.employees WHERE salary<2500;
    v_id hr.employees.employee_id%TYPE;
    v_name hr.employees.first_name%TYPE;
    v_surname hr.employees.last_name%TYPE;
    v_salary hr.employees.salary%TYPE;
    v_num NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE(LPAD('-',50,'-'));
    DBMS_OUTPUT.PUT_LINE('INFORME DE EMPLEADOS');
    DBMS_OUTPUT.PUT_LINE(LPAD('-',50,'-'));
    OPEN employees_cursor;
    LOOP
        FETCH employees_cursor INTO v_id,v_name,v_surname,v_salary;
        EXIT WHEN employees_cursor%NOTFOUND;
        v_num := v_num+1;
        DBMS_OUTPUT.PUT_LINE('[' || v_num || '] Empleado N° '|| v_id || ' - ' || v_name || ' ' || v_surname || ' tiene un sueldo de' ||TO_CHAR(v_salary,'$99,999.00'));
    END LOOP;
    CLOSE employees_cursor;
END;