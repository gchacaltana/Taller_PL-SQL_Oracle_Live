CREATE OR REPLACE FUNCTION producto_mas_vendido
RETURN VARCHAR2
IS
    product_name VARCHAR2(30);
    CURSOR report IS
    SELECT p.descripcion "producto"
    FROM detalle_facturas fd
    INNER JOIN productos p ON fd.cod_producto=p.cod_producto
    GROUP BY p.descripcion
    ORDER BY SUM(fd.cantidad) DESC
    FETCH NEXT 1 ROWS ONLY;
BEGIN
    OPEN report;
    FETCH report INTO product_name;
    RETURN product_name;
END producto_mas_vendido;

-- PROBANDO
SELECT producto_mas_vendido FROM dual;