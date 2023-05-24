-- Sobre a base de datos tendaBD
USE A22DavidCR_tendaB;

/* ? Tarefa 1.1. Seleccionar da t�boa artigos as cores e o prezo medio de venda dos artigos
de cada cor (con dous decimais). Clasificar a sa�da en orde decrecente polo nome da
cor. */
SELECT art_color AS "Color", ROUND(AVG(art_pv), 2) "MediaPrezoVenta" 
FROM artigos
GROUP BY art_color
ORDER BY art_color DESC;

/* ? Tarefa 1.2. Seleccionar da t�boa artigos as cores e o prezo medio de venda dos artigos
de cada cor (con dous decimais), exclu�ndo aos artigos que te�an un prezo de compra
superior a 50 euros. */
SELECT art_color AS "Color", ROUND(AVG(art_pv), 2) AS "MediaPrezoVenta" 
FROM artigos
WHERE art_pc <= 50
GROUP BY art_color;


/* ? Tarefa 1.3. Mostrar as estat�sticas de vendas do ano 2015 por tenda. A informaci�n a
mostrar �: identificador da tenda, n�mero de vendas, n�mero de artigos vendidos, suma
de unidades vendidas e a media dos prezos unitarios dos artigos vendidos. */

SELECT t.tda_id AS "Identificador", COUNT(v.ven_id) AS "N�meroVendas",    
FROM tendas t
JOIN vendas v ON v.ven_tenda = t.tda_id


-- Sobre a base de datos traballadores

USE A22DavidCR_traballadores;

/* ? Tarefa 1.4. Mostrar o n�mero de empregados que te�en 0, 1, 2, 3, ... fillos, ordenados
polo n�mero de fillos. */
SELECT 
FROM empregado e

/* ? Tarefa 1.5. Mostrar, para cada departamento, o n�mero de empregados que te�en 0, 1,
2, ... fillos, ordenados polo n�mero de departamento e n�mero de fillos. */


/* ? Tarefa 1.6. Mostrar, para cada departamento, a cantidade que queda do presuposto des-
pois de restar o importe dos salarios e comisi�ns a pagar aos empregados. */


/* 1.3.2 Tarefa 2. Realizar consultas establecendo condici�ns para os
grupos da t�boa resumo
A tarefa consiste en realizar as seguintes consultas agrupando filas e establecendo condi-
ci�ns para os grupos. */


-- Sobre a base de datos tendaBD


/* ? Tarefa 2.1. Seleccionar da t�boa artigos as cores e o prezo medio de venda dos artigos
de cada cor, para as cores que te�an o prezo medio maior que 100 euros. */


/* ? Tarefa 2.2. Mostrar o identificador do cliente, os apelidos e nome na mesma columna
separados por coma, e data e hora da venda, para os clientes que s� participaron nunha
venda, ordenados por n�mero de cliente.
Podemos comprobar o n�mero de veces que un cliente participou nunha venda como
axuda para comprobar se o resultado � o correcto.
Sobre a base de datos traballadores */


/* ? Tarefa 2.3. Mostrar o n�mero e o nome dos departamentos que te�an 5 empregados.*/


/* ? Tarefa 2.4. Para as extensi�ns telef�nicas que son utilizadas por m�is dun empregado,
mostrar o n�mero de empregados que a comparten */







