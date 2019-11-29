CREATE OR REPLACE PROCEDURE reporte_cliente_ventas
IS
    v_total NUMBER(9,2):=0;
    CURSOR clientes_cursor IS
    SELECT cod_cliente,nombres FROM clientes WHERE cod_cliente IN (SELECT DISTINCT(cod_cliente) FROM facturas);
    CURSOR facturas_cursor IS
    SELECT cod_factura,importe_total,cod_cliente FROM facturas;
BEGIN
    DBMS_OUTPUT.PUT_LINE(LPAD('-',70,'-'));
    DBMS_OUTPUT.PUT_LINE('INFORME DE VENTAS');
    DBMS_OUTPUT.PUT_LINE(LPAD('-',70,'-'));
    FOR cli IN clientes_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE(chr(13)||RPAD(UPPER(cli.cod_cliente),6)||UPPER(cli.nombres));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',70,'-'));
        v_total:=0;
        FOR fa IN facturas_cursor
        LOOP
            IF fa.cod_cliente=cli.cod_cliente THEN
                v_total:=v_total+fa.importe_total;
                DBMS_OUTPUT.PUT_LINE(RPAD(fa.cod_factura, 6) || TO_CHAR(ROUND(fa.importe_total,2),'$999,999.00'));
            END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(RPAD('Total:',6) || TO_CHAR(ROUND(v_total,2),'$999,999.00'));
    END LOOP;
END reporte_cliente_ventas;

-- Probando
CALL reporte_cliente_ventas;