USE A22DavidCR_casascoloniales

/*1.- Vamos a comprobar si los nombres de las tablas son sensibles a may�sculas/
min�sculas:
SHOW variables LIKE 'lower_case_table_names';
 Si el valor es 0, es sensible
 Si es 1, se almacenan las tablas convirtiendo sus nombres a min�sculas
(No es sensible)
 Si es 2, se almacenan con la sensibilidad especificada en la sentencia
(No es sensible)
 En SO Unix la opci�n 0 es establecida por defecto
 En SO Windows y Mac es 1 por defecto*/
SHOW variables LIKE 'lower_case_table_names';
 
 
/*2.- Como vamos a hacer consultas simples (solo participa una tabla) debemos
consultar como tenemos definidas las tablas, ya que puede que, por ejemplo en la
tabla Ni�o no tengamos el nombre de la comarca en que reside, sino el
identificador de la comarca, con lo que se visualizar�a ese identificador y no
el nombre de la comarca.
Cuando trabajemos con consultas multitabla, en vez del identificador, que nos da
poca informaci�n, podremos visualizar en el resultado de la consulta el nombre
de la comarca.*/


/*Queremos obtener la siguiente informaci�n:*/


/*1.- Nombre y apellidos de los ni�os y ni�as que participan en las vacaciones.*/
SELECT Nombre, Apellidos 
FROM Ni�os;

/*2.- Nombre y apellidos de los ni�os y ni�as que participan en las vacaciones, de
tal forma que el resultado se visualice en una sola columna llamada �Nombre
completo� y de la siguiente forma: 'Apellidos, Nombre'.*/
SELECT CONCAT(Apellidos, ", " , Nombre) AS "Nome completo"
FROM Ni�os;

/*3.- Nombre y apellidos de los ni�os y ni�as que participan en las vacaciones, de
tal forma que el resultado se visualice en una sola columna llamada 'Nombre
completo' y de la siguiente forma: 'Apellidos, Nombre'.
El resultado aparecer� ordenado por apellidos, y si hay coincidencia, por nombre.*/
SELECT CONCAT(Apellidos, ", " , Nombre) AS "Nome completo"
FROM Ni�os
ORDER BY Apellidos, Nombre;

/*4.- Queremos saber cuantos ni�os y ni�as hay por familia.*/
SELECT Telefono, COUNT(Codigo) AS N�mero ni�os
FROM Ni�os 
GROUP BY Telefono;

/*5.- Nombre y apellidos de los ni�os y ni�as que son de la comarca de Fisterra.*/
SELECT Comarca.Nombre AS Comarca, Ni�os.Nombre, Ni�os.Apellidos 
FROM Ni�os 
JOIN Comarca ON Comarca.IdComarca = Ni�os.IdComarca
WHERE Comarca.Nombre = 'Fisterra';

/*6.- Queremos saber el n�mero de ni�os y ni�as que son de la comarca de Fisterra.*/
SELECT Comarca.Nombre AS Comarca, COUNT(Codigo) AS N�mero
FROM Ni�os 
JOIN Comarca ON Comarca.IdComarca = Ni�os.IdComarca
WHERE Comarca.Nombre = 'Fisterra';

/*7.- Queremos saber cuantos ni�os y ni�as hay de cada comarca.*/
SELECT Comarca.Nombre AS Comarca, COUNT(Ni�os.Codigo) AS N�meroRapaces
FROM Ni�os
JOIN Comarca ON Comarca.IdComarca = Ni�os.Codigo 
GROUP BY Ni�os.IdComarca;

/*8.- Queremos saber cuantos ni�os y ni�as hay en cada casa colonial.*/
SELECT CasaColonial.Nombre AS NomeCasa, COUNT(Ni�os.Codigo) AS NumeroRapaces
FROM Ni�os
JOIN CasaColonial ON CasaColonial.IdCasa = Ni�os.Codigo 
GROUP BY Ni�os.IdCasa;

/*9.- Queremos saber el n�mero de monitores y monitoras que tenemos.*/
SELECT COUNT(Id) AS N�meroMonitores
FROM Monitor;

/*10.- Nombre de las actividades que no tengan descripci�n y el monitor o monitora
responsable.*/
SELECT a.Nombre AS Actividad, CONCAT(m.Nombre, " ", m.Apellidos) AS MonitorResponsable
FROM Actividad a 
JOIN Monitor m ON m.Id = a.IdActividad  
WHERE a.Descripcion IS NULL;

/*11.- Nombre y descripci�n de las actividades. Cuando una actividad no tenga
descripci�n, se visualizar� en ese campo 'POR DEFINIR'.*/
SELECT Nombre AS NombreActividad, IFNULL(Descripcion, 'POR DEFINIR') AS Descripcion
FROM Actividad;

/*12.- Queremos saber de cuantas actividades es responsable cada monitor.*/
SELECT m.Nombre AS NombreMonitor, COUNT(a.Nombre) AS NumeroActividades
FROM Actividad a
JOIN Monitor m  ON a.IdMonitor = m.Id 
GROUP BY a.IdMonitor;

/*13.- Nombre de las casas coloniales con capacidad para 50 ni�os y ni�as como
m�ximo, y las comarcas donde est�n situadas.*/
SELECT cc.Nombre AS NomeCasa
FROM CasaColonial cc 
JOIN Comarca co ON co.IdComarca = cc.IdComarca 
WHERE cc.Capacidad >= 50;

/*14.- Nombre de las comarcas que tengan una superficie mayor de 250.*/
SELECT Nombre 
FROM Comarca c
WHERE Superficie > 250;

/*15.- Nombre de las comarcas que tengan una superficie mayor de 250 donde el
n�mero de habitantes sea mayor de 25000.*/
SELECT Nombre 
FROM Comarca c
WHERE Superficie > 250 AND Habitantes > 25000;

/*16.- Nombre de las comarcas que tengan una superficie mayor de 250 o el n�mero de
habitantes sea mayor de 25000.*/
SELECT Nombre 
FROM Comarca c
WHERE Superficie > 250 OR Habitantes > 25000;