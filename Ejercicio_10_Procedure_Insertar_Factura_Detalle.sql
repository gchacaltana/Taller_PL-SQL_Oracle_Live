CREATE OR REPLACE PROCEDURE insertar_detalle_factura(
v_cod_factura IN CHAR,
v_cod_producto IN CHAR,
v_cantidad IN NUMBER
)
IS
    v_precio_producto NUMBER(9,2);
    v_subtotal NUMBER(9,2);
BEGIN
    SELECT precio_unitario INTO v_precio_producto FROM productos WHERE cod_producto=v_cod_producto;
    v_subtotal:=v_precio_producto*v_cantidad;
    INSERT INTO detalle_facturas (cod_factura,cod_producto,cantidad,subtotal) VALUES (v_cod_factura,v_cod_producto,v_cantidad,v_subtotal);
    DBMS_OUTPUT.PUT_LINE('Detalle de factura registrado con éxito.');
END insertar_detalle_factura;

-- Probando
CALL insertar_detalle_factura('F0010','P0001',12);

-- Validando resultado
SELECT * FROM detalle_facturas where cod_factura='F0010';