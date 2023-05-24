-- Sobre a base de datos tendaBD
USE A22DavidCR_tendaB;

/* ? Tarefa 1.1. Seleccionar da táboa artigos as cores e o prezo medio de venda dos artigos
de cada cor (con dous decimais). Clasificar a saída en orde decrecente polo nome da
cor. */
SELECT art_color AS "Color", ROUND(AVG(art_pv), 2) "MediaPrezoVenta" 
FROM artigos
GROUP BY art_color
ORDER BY art_color DESC;

/* ? Tarefa 1.2. Seleccionar da táboa artigos as cores e o prezo medio de venda dos artigos
de cada cor (con dous decimais), excluíndo aos artigos que teñan un prezo de compra
superior a 50 euros. */
SELECT art_color AS "Color", ROUND(AVG(art_pv), 2) AS "MediaPrezoVenta" 
FROM artigos
WHERE art_pc <= 50
GROUP BY art_color;


/* ? Tarefa 1.3. Mostrar as estatísticas de vendas do ano 2015 por tenda. A información a
mostrar é: identificador da tenda, número de vendas, número de artigos vendidos, suma
de unidades vendidas e a media dos prezos unitarios dos artigos vendidos. */

SELECT t.tda_id AS "Identificador", COUNT(v.ven_id) AS "NúmeroVendas",    
FROM tendas t
JOIN vendas v ON v.ven_tenda = t.tda_id


-- Sobre a base de datos traballadores

USE A22DavidCR_traballadores;

/* ? Tarefa 1.4. Mostrar o número de empregados que teñen 0, 1, 2, 3, ... fillos, ordenados
polo número de fillos. */
SELECT 
FROM empregado e

/* ? Tarefa 1.5. Mostrar, para cada departamento, o número de empregados que teñen 0, 1,
2, ... fillos, ordenados polo número de departamento e número de fillos. */


/* ? Tarefa 1.6. Mostrar, para cada departamento, a cantidade que queda do presuposto des-
pois de restar o importe dos salarios e comisións a pagar aos empregados. */


/* 1.3.2 Tarefa 2. Realizar consultas establecendo condicións para os
grupos da táboa resumo
A tarefa consiste en realizar as seguintes consultas agrupando filas e establecendo condi-
cións para os grupos. */


-- Sobre a base de datos tendaBD


/* ? Tarefa 2.1. Seleccionar da táboa artigos as cores e o prezo medio de venda dos artigos
de cada cor, para as cores que teñan o prezo medio maior que 100 euros. */


/* ? Tarefa 2.2. Mostrar o identificador do cliente, os apelidos e nome na mesma columna
separados por coma, e data e hora da venda, para os clientes que só participaron nunha
venda, ordenados por número de cliente.
Podemos comprobar o número de veces que un cliente participou nunha venda como
axuda para comprobar se o resultado é o correcto.
Sobre a base de datos traballadores */


/* ? Tarefa 2.3. Mostrar o número e o nome dos departamentos que teñan 5 empregados.*/


/* ? Tarefa 2.4. Para as extensións telefónicas que son utilizadas por máis dun empregado,
mostrar o número de empregados que a comparten */







