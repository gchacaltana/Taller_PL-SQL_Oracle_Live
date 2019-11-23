CREATE OR REPLACE PROCEDURE clientes_sin_facturas
IS
CURSOR report_cursor IS
    SELECT cod_cliente,nombres FROM clientes WHERE cod_cliente NOT IN (SELECT distinct(cod_cliente) FROM facturas);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Clientes sin factura');
    FOR rep IN report_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(rep.cod_cliente,8)||rep.nombres);
    END LOOP;
END clientes_sin_facturas;

-- EXECUTION
CALL clientes_sin_facturas()