CREATE OR REPLACE PROCEDURE actualizar_precio_producto
(v_cod_producto IN CHAR, v_nuevo_precio IN NUMBER)
IS
BEGIN
    UPDATE productos SET precio_unitario = v_nuevo_precio
    WHERE cod_producto = v_cod_producto;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Precio actualizado con éxito');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END actualizar_precio_producto;

-- EXECUTION
CALL actualizar_precio_producto('P0001',130);