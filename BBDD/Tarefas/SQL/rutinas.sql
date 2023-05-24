/*1- Utilizando la base de datos del Almacen, crea una funci�n que devuelva el nombre del producto 
de mayor precio. */
DROP FUNCTION IF EXISTS productoMayorPrecio;
DELIMITER //
CREATE FUNCTION productoMayorPrecio()
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE objetoMasCaro VARCHAR(30);
	SELECT Descripcion INTO ObjetoMasCaro
	FROM PRODUCTOS 
	ORDER BY PrecioActual DESC LIMIT 1;
	RETURN objetoMasCaro;
END;
//
DELIMITER ;

SELECT productoMayorPrecio() AS "Producto de mayor precio";


/*2- Crea un procedimiento que recorra la tabla productos y muestre por pantalla el n�mero de 
productos con un stock menor de 20 unidades y el nombre de esos productos.
El resultado se visualizar� como aparece a continuaci�n: */

-- Opci�n con WHILE
DROP FUNCTION IF EXISTS pStockMenorAVeinte;
DELIMITER //
CREATE FUNCTION pStockMenorAVeinte();
DETERMINISTIC
BEGIN
	DECLARE nome VARCHAR (30);
	DECLARE cantidad INT;
	SELECT Descripcion INTO nome 
	FROM PRODUCTOS 
	WHERE Stock < 20;
	SELECT COUNT(IDProducto) INTO cantidad
	FROM PRODUCTOS
	WHERE Stock <20;
END;
//
DELIMITER ;

SELECT pStockMenorAVeinte();

-- Opci�n con REPEAT

/*3- Dada la siguiente tabla de descuentos, crea una funci�n que devuelva en una variable el 
descuento que se va a aplicar seg�n las unidades pedidas:
-- 0-9 unidades -> no hay descuento
-- 10-19 unidades -> 0,1
-- 20-49 unidades -> 0,3
-- 51 o m�s unidades -> 0,5
Se le pasar� a la funci�n el n�mero de unidades. */
-- Utiliza CASE
DROP FUNCTION IF EXISTS fDescuentosCase;
DELIMITER //
CREATE FUNCTION fDescuentosCase(Stock INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE vDescuentoAplicado FLOAT;
	CASE
		WHEN Stock BETWEEN 10 AND 19 THEN 
			SET vDescuentoAplicado= 0.1;
		WHEN Stock BETWEEN 20 AND 49 THEN 
			SET vDescuentoAplicado= 0.3;
		WHEN Stock >= 50 THEN 
			SET vDescuentoAplicado= 0.5;
		ELSE
			SET vDescuentoAplicado= 0;		
	END CASE;
	RETURN vDescuentoAplicado;
END;
//
DELIMITER ;

SELECT ROUND(fDescuentosCase(623), 1) AS "Descuento aplicado";


/*4- Crea un procedimiento que visualice para cada pedido el descuento que se le aplicar� (utiliza la 
funci�n creada en el ejercicio anterior). */
DROP PROCEDURE IF EXISTS pMostrarDescuento;
DELIMITER //

CREATE PROCEDURE pMostrarDescuento(IN pNumPedido INT)
BEGIN
    DECLARE vUnidades INT;
    DECLARE vDescuento FLOAT(4,1);
    
    -- Obtener el n�mero de unidades del pedido
    SELECT unidades INTO vUnidades FROM PEDIDOS  WHERE IDPedido = pNumPedido;
    
    -- Obtener el descuento que se aplicar�
    SET @vDescuentoAplicado = fDescuentosCase(vUnidades);
    
    -- Mostrar el resultado
    SELECT CONCAT('El pedido ', pNumPedido, ' recibir� un descuento del ', @vDescuentoAplicado*100, '%.') AS mensaje;
    
END//

DELIMITER ;

CALL pMostrarDescuento(3);





















