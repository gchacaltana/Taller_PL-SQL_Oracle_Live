
/**
Elaborar un bloque de sentencias que muestre los departamentos y los empleados que pertenecen a los departamentos. 
El resultado debe estar de acuerdo al formato indicado en el ejemplo.
*/

DECLARE
    CURSOR dpto_employees_cursor IS
        SELECT e.department_id,d.department_name,e.employee_id,e.first_name,e.last_name,e.salary 
        FROM hr.employees e
        INNER JOIN hr.departments d ON e.department_id=d.department_id
        WHERE salary<5000
        ORDER BY d.department_name DESC, salary DESC;
    v_last_department_id hr.departments.department_id%TYPE:=0;
    v_num NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE(LPAD('-',70,'-'));
    DBMS_OUTPUT.PUT_LINE('INFORME DE EMPLEADOS POR DEPARTAMENTOS');
    DBMS_OUTPUT.PUT_LINE(LPAD('-',70,'-'));
    FOR emp IN dpto_employees_cursor
    LOOP
        IF v_last_department_id<>emp.department_id THEN
            DBMS_OUTPUT.PUT_LINE(chr(13)||'DEPARTAMENTO: ' || UPPER(emp.department_name));
            DBMS_OUTPUT.PUT_LINE(LPAD('-',70,'-'));
        ELSE
            DBMS_OUTPUT.PUT_LINE(rpad(emp.employee_id, 10) || rpad(emp.first_name|| ' ' || emp.last_name, 20) ||TO_CHAR(emp.salary,'$999,999.00'));
        END IF;
        v_last_department_id:=emp.department_id;
    END LOOP;
END;