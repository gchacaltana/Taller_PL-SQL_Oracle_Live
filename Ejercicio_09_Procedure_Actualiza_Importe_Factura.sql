CREATE OR REPLACE PROCEDURE actualiza_total_factura
(v_cod_factura IN CHAR)
IS
BEGIN
    UPDATE facturas SET importe_total=(
    SELECT SUM(subtotal) 
    FROM detalle_facturas WHERE cod_factura=v_cod_factura)
    WHERE cod_factura=v_cod_factura;
    DBMS_OUTPUT.PUT_LINE('Operación realizada con éxito');
END actualiza_total_factura;

-- EXECUTE
-- SELECT importe_total FROM facturas WHERE cod_factura='F0002'
CALL actualiza_total_factura('F0002');