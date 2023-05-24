/* Define la creaci�n de las rutinas y a�ade ejemplos de ejecuci�n de cada una.
En el c�digo de las rutinas es necesario contemplar los posibles errores (no existe, el valor no es 
correcto, ...) al introducir los datos. */

/* 1. Realiza un procedimiento que acepte un departamento como argumento y visualice 
todos los datos de los empleados que en �l trabajan. */

/* � Opci�n 1: conocemos el identificador del departamento */
DROP PROCEDURE IF EXISTS pMostrarDepartamento;
DELIMITER //
CREATE PROCEDURE pMostrarDepartamento(IDDepartamento INT)
RETURNS

/* � Opci�n 2: conocemos el nombre del departamento */

/* 2. Realiza un procedimiento que acepte un nombre de departamento y devuelva mediante dos 
par�metros de tipo OUTPUT su identificador y el nombre del director (director). */

/* � Opci�n 1: se visualiza el resultado al ejecutar el procedimiento */

/* � Opci�n 2: al ejecutar el procedimiento no se visualiza el resultado. Se visualizan los valores de 
las variables (identificador del departamento y director) fuera del procedimiento mediante variables. */

/* 3. Crea un procedimiento que inserte un pedido nuevo y devuelva un mensaje indicando el 
identificador del pedido insertado. Valida los datos de entrada comprobando si corresponden a 
productos y clientes existentes. */

/* 4. Desarrolla un procedimiento que permita insertar nuevos departamentos.
- Se pasar� al procedimiento el nombre del departamento y la localidad.
- Si el departamento (nombre y localidad) ya existe o el nombre del departamento es una cadena 
vac�a, saca un aviso y no lo inserta.
- En otro caso, el procedimiento insertar� la fila nueva asignando como identificador de 
departamento la decena siguiente al n�mero mayor de la tabla. HAY QUE INSERTAR ID A MANO
Puedes crear una funci�n que devuelva el identificador del nuevo departamento a insertar para 
utilizar en el procedimiento. */

/* 5. Realiza un procedimiento al que se le pase el nombre de un cliente como argumento y visualice 
todos los pedidos que ha realizado, mostrando el nombre de los productos y las unidades ordenados 
por fecha desde el m�s reciente.
Se comprobar� que el cliente existe. */

/* 6. Para trabajar con la tabla clientes crea los siguientes procedimientos:
1- Aceptando los datos b�sicos, da de alta un cliente. Si alg�n dato a insertar es incorrecto o 
ya existe el cliente muestra un aviso "Alg�n dato es incorrecto".
2- Modifica los datos de cr�dito, debe y haber (pas�ndolos como par�metros) de un cliente.
3- Elimina un cliente que pasaremos como par�metro.
4- Crea un procedimiento que muestre los datos de un cliente. Si el cliente existe visualiza 
sus datos y si no existe, visualiza los datos de todos los clientes. */

/* 7. Crea una funci�n que devuelva el nombre del director de un empleado. La funci�n aceptar� como
par�metro un n�mero de empleado y buscar� el nombre del director de ese empleado, devolviendo 
ese valor. 
-- Si no tiene director devolver� 'No tiene director'. */

/* 8. Crea un procedimiento que visualice el nombre del empleado, el nombre del director y la fecha 
de alta de todos los empleados, ordenados por el nombre del empleado.
Para mostrar el nombre del director deber� utilizar la funci�n creada en el ejercicio anterior */