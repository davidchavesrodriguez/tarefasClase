-- Sobre la base de datos Almacen:
USE A22DavidCR_almacen;


-- 1. Crea un trigger con las siguientes características:
-- • se ejecuta sobre la tabla empleados
-- • se ejecuta antes de la operación de inserción
-- • si el valor de la fecha de alta del empleado que se quiere insertar es desconocido, entonces 
-- se le asignará automáticamente la fecha actual y se insertará en la tabla
DROP TRIGGER IF EXISTS fechaAlta;

DELIMITER //

CREATE TRIGGER fechaAlta
BEFORE INSERT ON EMPLEADOS
FOR EACH ROW
BEGIN
    IF NEW.FechaAlta IS NULL THEN
        SET NEW.FechaAlta = NOW();
    END IF;
END//

DELIMITER ;


-- Comprueba el funcionamiento del trigger anterior insertando un empleado sin fecha de alta.
INSERT INTO EMPLEADOS (IDEmpleado, nombre, salario) VALUES (420, 'Juan', 2000);

SELECT * FROM EMPLEADOS;


-- 2. Crea un procedimiento que inserte un pedido nuevo y devuelva un mensaje indicando el 
-- identificador del pedido insertado o que no se ha podido realizar el pedido (cliente no existe, 
-- producto no existe o stock insuficiente). Los mensajes de que no se ha podido realizar el pedido 
-- podrían ser del tipo: signal sqlstate '23000' set message_text = 'No existe el producto'.
-- Solo se realizará el pedido si hay stock suficiente para el pedido. 
-- Utiliza triggers para las comprobaciones y para actualizar el stock del producto una vez realizado el 
-- pedido.
CREATE PROCEDURE insertar_pedido(
    IN id_cliente INT,
    IN id_producto INT,
    IN cantidad INT,
    OUT mensaje VARCHAR(100)
)
BEGIN
    -- Validar que el cliente existe
    IF NOT EXISTS (SELECT * FROM clientes WHERE id_cliente = @id_cliente)
    BEGIN
        SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'No existe el cliente';
        RETURN;
    END

    -- Validar que el producto existe
    IF NOT EXISTS (SELECT * FROM productos WHERE id_producto = @id_producto)
    BEGIN
        SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'No existe el producto';
        RETURN;
    END

    -- Validar que hay suficiente stock
    IF (SELECT stock FROM productos WHERE id_producto = @id_producto) < @cantidad
    BEGIN
        SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'Stock insuficiente';
        RETURN;
    END

    -- Insertar el pedido
    INSERT INTO pedidos (id_cliente, id_producto, cantidad, fecha_pedido)
    VALUES (@id_cliente, @id_producto, @cantidad, GETDATE());

    -- Devolver el identificador del pedido insertado
    DECLARE @id_pedido INT;
    SET @id_pedido = SCOPE_IDENTITY();
    PRINT 'Pedido insertado con éxito. Id de pedido: ' + CAST(@id_pedido AS VARCHAR(10));
END



-- Comprueba el funcionamiento del procedimiento y los triggers (no dejaría insertar porque el 
-- producto no existe, no dejaría insertar porque el cliente no existe, no hay stock suficiente, inserta el 
-- pedido y actualiza el stock).




-- 3. Para realizar este ejercicio añade un campo 'Importe' en la tabla PEDIDOS de tipo decimal(9,2) 
-- después del campo UNIDADES.
-- Crea un disparador que se ejecute cada vez que se inserta un nuevo pedido en la tabla PEDIDOS 
-- que calcule el valor del campo Importe de la siguiente manera: Importe será igual al precio del 
-- producto por la cantidad. 
-- El precio del producto tendrás que buscarlo en la tabla PRODUCTOS.
-- Comprueba el funcionamiento de los triggers (comprueba si existe el producto y el cliente, 
-- comprueba el stock, actualiza el stock si hace el pedido, calcula el importe del pedido).




-- 4. Para realizar este ejercicio crea una tabla empleados_historico que guarde los registros de los 
-- empleados borrados. 
-- Crea un trigger que se ejecute antes de hacer el borrado de un empleado y guarde en la tabla 
-- empleados_historico cada empleado que es borrado.
-- Puedes insertar un nuevo empleado para luego borrarlo y así comprobar que una vez borrado 
-- aparece en el histórico y ya no aparece en la tabla empleados.




-- 5. Crea un TRIGGER que cuando insertemos un empleado que no tenga salario le asigne el salario 
-- más bajo de cualquier empleado de la empresa.




-- 6. Crea un evento que premiará con 50 euros a los clientes que no deban nada en la mitad de la clase
-- de hoy.




-- 7. Crea un evento que actualice el stock de aquellos productos que tengan menos de 20 unidades en 
-- stock.
-- Se repondrán 10 unidades de cada uno de esos productos todos los días a las 11:30.
-- Para actualizar el stock crea un procedimiento que será llamado cuando se ejecute el evento







