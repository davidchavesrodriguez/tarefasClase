USE A22DavidCR_casascoloniales;

/*1. Nombre y apellidos de los niños y niñas que participan en las vacaciones, así como el nombre de
las casas donde se alojan.
El nombre se visualizará en una sola columna llamada 'Nombre completo' y de la siguiente forma:
'Apellidos, Nombre'.
El resultado aparecerá ordenado por el nombre de las casas coloniales.*/
SELECT CONCAT(n.Apellidos, ", ", n.Nombre) AS NombreCompleto, cc.Nombre AS Casa
FROM Niños n
JOIN CasaColonial cc ON cc.IdCasa = n.IdCasa
ORDER BY cc.Nombre;


/*2. Como hay algunas casas que se llaman igual, debemos visualizar también la comarca donde están
situadas, para que no de lugar a confusión.*/
SELECT CONCAT(n.Apellidos, ", ", n.Nombre) AS NombreCompleto, cc.Nombre AS Casa, c.Nombre AS Comarca
FROM Niños n
JOIN CasaColonial cc ON cc.IdCasa = n.IdCasa
JOIN Comarca c ON c.IdComarca = cc.IdComarca
ORDER BY cc.Nombre;


/*3. Nombre y apellidos de los niños y niñas que residen en la comarca de Fisterra.*/
SELECT CONCAT(n.Nombre, " ", n.Apellidos) AS NombreCompleto
FROM Niños n 
JOIN Comarca c ON c.IdComarca = n.IdComarca 
WHERE c.Nombre= 'Fisterra';


/*4. Número de niños y niñas que residen en la comarca de Fisterra.*/
SELECT c.Nombre AS Comarca, COUNT(n.Codigo) AS NumeroRapaces
FROM Niños n 
JOIN Comarca c ON c.IdComarca = n.IdComarca 
WHERE c.Nombre= 'Fisterra';


/*5. Número de niños y niñas que residen en cada comarca.*/
SELECT c.Nombre AS Comarca, COUNT(n.Codigo) AS NumeroRapaces
FROM Niños n 
JOIN Comarca c ON c.IdComarca = n.IdComarca 
GROUP BY n.IdComarca;


/*6. Número de niños y niñas que se alojan en cada casa colonial.*/
SELECT cc.Nombre AS Casa, COUNT(n.Codigo) AS NumeroRapaces 
FROM Niños n 
JOIN CasaColonial cc ON cc.IdCasa = n.IdCasa 
GROUP BY n.IdCasa;


/*7. Como el nombre de alguna casa se repite, queremos saber también la comarca donde está situada
la casa.*/
SELECT cc.Nombre AS Casa, c.Nombre AS Comarca, COUNT(n.Codigo) AS NumeroRapaces 
FROM Niños n 
JOIN CasaColonial cc ON cc.IdCasa = n.IdCasa
JOIN Comarca c ON c.IdComarca = n.IdComarca 
GROUP BY n.IdCasa;


/*8. Nombre de las actividades y nombre del monitor o monitora responsable.*/
SELECT a.Nombre AS Actividad, m.Nombre AS Monitor
FROM Actividad a 
JOIN Monitor m ON m.Id = a.IdMonitor;


/*9. Nombre y apellidos de los niños y niñas que residan en la comarca con menor número de
habitantes.*/
SELECT n.Nombre AS Nombre
FROM Niños n 
JOIN Comarca c ON c.IdComarca = n.IdComarca
WHERE c.Habitantes IN (SELECT c2.Habitantes FROM Comarca c2 ORDER BY c2.Habitantes ASC);

-- ??????????????????????????


/*10. Número de actividades de las que es responsable cada monitor o monitora.*/
SELECT m.Nombre AS Monitor, COUNT(a.IdActividad) AS Actividades
FROM Actividad a 
RIGHT JOIN Monitor m ON m.Id = a.IdMonitor 
GROUP BY m.Id;


/*11. Nombre de las casas coloniales que tienen capacidad para 50 niños y niñas como máximo, y
nombre de las comarcas donde están situadas.*/
SELECT cc.Nombre a
FROM CasaColonial cc 
JOIN Comarca c ON c.IdComarca = cc.IdComarca 
WHERE cc.Capacidad <= 50;


/*12. Número de casas coloniales que hay en cada comarca.*/
SELECT c.Nombre AS Comarca, COUNT(cc.IdComarca) AS Casas
FROM CasaColonial cc 
RIGHT JOIN Comarca c ON c.IdComarca = cc.IdComarca 
GROUP BY c.IdComarca
ORDER BY COUNT(cc.IdComarca) DESC;


/*13. Número de casas coloniales que hay en las comarcas donde hay menos de 3 casas.*/
SELECT c.Nombre AS Comarca, COUNT(cc.IdComarca) AS Casas
FROM CasaColonial cc 
RIGHT JOIN Comarca c ON c.IdComarca = cc.IdComarca 
GROUP BY c.IdComarca
HAVING COUNT(cc.IdComarca) <= 2
ORDER BY COUNT(cc.IdComarca) DESC;


/*14. Nombre de las actividades que se ofertan en cada casa, con su nivel de calidad.*/
SELECT a.Nombre AS Actividad, cc.Nombre AS Casa, ca.NivelCalidad AS Calidad
FROM Actividad a 
LEFT JOIN Casa_Actividad ca ON ca.IdActividad = a.IdActividad
JOIN CasaColonial cc ON cc.IdCasa = ca.IdCasa
ORDER BY ca.NivelCalidad;



/*15. Vemos que para la casa La solana aparece dos veces la actividad de pintura. No sabemos si es un
error de cuando insertamos los datos o si son casas de diferentes comarcas. Vamos a visualizar
también las comarcas donde están situadas las casas para salir de dudas.*/


/*16. El resultado anterior lo ordenamos alfabéticamente por comarca y casa colonial, y descendente
por el nivel de calidad.*/


/*17. Nombre de la actividad que tiene mayor nivel de calidad en cada casa colonial.*/


/*18. Como en los casos anteriores, vamos a visualizar las comarcas donde están las casas.*/


/*19. Nombre de la actividad o actividades que se ofertan, con el nivel de calidad, en la casa colonial
donde estará alojada Aroa Ramos Couto.*/


/*20. Nombre de la actividad con mayor nivel de calidad de las actividades que se ofertan en la casa
donde va a estar alojada Aroa Ramos Couto, para inscribirla.*/


/*21. Nombre de las actividades con su descripción, y los monitores o monitoras responsables. El
resultado debe aparecer como se visualiza a continuación.*/


/*22. Nombre de las comarcas con sus casas coloniales, y también aquellas comarcas que no tengan
casas.*/


/*23. Como el usuario no entiende lo que es NULL, la consulta debe devolver ‘SIN CASAS’ para
aquellas comarcas que no las tengan.*/

