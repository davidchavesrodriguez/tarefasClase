-- Sobre a base de datos tendaBD
USE A22DavidCR_tendaB;

/* ? Tarefa 2.1. Mostrar apelidos e nome nunha mesma columna separados por unha coma,
e o número de letras que ten o nome dos clientes. */
SELECT CONCAT(clt_apelidos, ', ', clt_nome) AS "Nome completo", LENGTH(clt_nome) AS "Longitud do nome"
FROM clientes;

-- ? Tarefa 2.2. Mostrar nomes e apelidos dos clientes en minúscula.
SELECT CONCAT(LOWER(clt_nome), ' ' ,LOWER(clt_apelidos)) AS "Nome minúsculo"
FROM clientes;

/* ? Tarefa 2.3. Mostrar a túa idade no momento actual (calcular o número de anos que tes).
Suponse que a data do sistema é a correcta. */
SELECT DATEDIFF(CURDATE(), '2002-03-28') DIV 365 AS "Anos";

/* ? Tarefa 2.4. Mostrar tódalas vendas do mes anterior ao mes actual, en dous supostos:
– Na táboa gárdanse datos das vendas dun ano.*/
SELECT * 
FROM vendas 
WHERE MONTH(ven_data) = MONTH(CURDATE()) - 1 AND YEAR(ven_data) = YEAR(CURDATE());

-- – Na táboa gárdanse datos das vendas de varios anos.
SELECT * 
FROM vendas 
WHERE MONTH(ven_data) = MONTH(CURDATE()) - 1;

-- inserir vendas tendo en conta que a data actual é 27/01/2023
INSERT INTO vendas (ven_tenda, ven_empregado, ven_cliente, ven_data) values
(7,2,1,'1999-01-01'),
(7,2,1,'2020-01-01'),
(7,2,1,'2021-01-01'),
(7,2,1,'2022-01-01'),
(7,2,1,'2023-01-01'),
(7,2,1,'2023-01-04'),
(2,14,30,'2023-01-15'),
(2,14,60,'2022-11-30'),
(2,14,60,'2022-08-30');


/* ? Tarefa 2.5. Mostrar código, nome, color e prezo de venda (redondeado, sen decimais)
dos artigos de cor negra. */
SELECT art_codigo AS "Código", art_nome AS "Nome", art_color AS "Color", ROUND(art_pv) AS "Precio venta"
FROM artigos
WHERE art_color LIKE 'NEGRO';

-- ? Tarefa 2.6. Calcular a media dos pesos de todos os artigos.
SELECT ROUND(AVG(art_peso)) AS "Media de peso"
FROM artigos;

/* ? Tarefa 2.7. Calcular a media do peso, o marxe máximo ( máxima diferenza entre o pre-
zo de venda e o prezo de compra) e a diferenza que se dá entre o maior prezo de venda
e o menor prezo de compra. Estes cálculos terán que facerse para aqueles artigos que
teñan descrito a cor cun valor distinto do NULL. */
SELECT ROUND(AVG(art_peso)) AS "Media de peso", MAX(art_pv - art_pc) AS "Marxe máximo", MAX(art_pv) - MIN(art_pc) AS "Maior diferenza"
FROM artigos
WHERE art_color IS NULL;

-- ? Tarefa 2.8. Contar o número de cores distintos que existen na táboa de artigos.
SELECT DISTINCT art_color AS "Colores"
FROM artigos;

/* ? Tarefa 2.9. Mostrar nome e cor dos artigos. Se a cor é descoñecida, débese mostrar o
texto ‘DESCOÑECIDO’. */
SELECT art_nome AS "Nome", IFNULL(art_color, 'DESCOÑECIDO') AS Color 
FROM artigos;


-- Sobre a base de datos traballadores
USE A22DavidCR_traballadores;

/* ? Tarefa 2.10. A xubilación na empresa está establecida aos 60 anos. O empregado xubi-
lado ten dereito a unha liquidación que equivale ao salario dun mes por cada ano de
servizo na empresa. Mostrar nome, data de nacemento, salario mensual base, antigüi-
dade (número de anos dende que entrou a traballar na empresa ata a data de xubilación)
e importe da liquidación que lle corresponde aos empregados que se xubilarán no ano
actual. */
SELECT empNome AS "Nome", empDataNacemento AS "Nacemento", empSalario AS "Salario", YEAR(CURDATE())-YEAR(empDataIngreso) AS "Antigüedade", empSalario * (YEAR(CURDATE())-YEAR(empDataIngreso)) AS "Liquidación"
FROM empregado
WHERE YEAR(CURDATE()) - YEAR(empDataNacemento) >= 60; 

/* ? Tarefa 2.11. Mostrar nome, día e mes do aniversario dos empregados dos departamen-
tos 110 e 111. */
SELECT empNome AS "Nome", DAY(empDataNacemento) AS "Día de nacemento", MONTH(empDataNacemento) AS "Mes de nacemento" 
FROM empregado
WHERE empDepartamento = 110 OR empDepartamento = 111;

/* ? Tarefa 2.12. Mostrar o número de empregados que este ano cumpren 20 anos traballan-
do na empresa e o salario medio de todos eles. */
SELECT AVG(empSalario) AS "Media de salario"
FROM empregado
WHERE YEAR(CURDATE())-YEAR(empDataIngreso)= 20;

/* ? Tarefa 2.13. Mostrar o importe anual (14 pagas) correspondente ao soldos dos empre-
gados (soldo máis comisións). */
SELECT empNome AS "Nome", empSalario * 14 + IFNULL(empComision, 0) AS "Salario anual"
FROM empregado;

/* ? Tarefa 2.14. Mostrar o número de departamentos que existen e o presuposto anual me-
dio de todos eles. */
SELECT COUNT(depNumero) AS "Número de departamentos", ROUND(AVG(depPresuposto)) AS "Media de presupostos"
FROM departamento;

-- ? Tarefa 2.15. Mostrar o importe total das comisións dos empregados.
SELECT SUM(empComision) AS "Comisións totais"
FROM empregado;

/* ? Tarefa 2.16. Mostrar nome, data de nacemento (dd-mm-aaaa) e idade dos empregados
que teñan actualmente 50 anos ou máis. Ordenar o resultado pola idade de maior a me-
nor. */
SELECT empNome AS "Nome", DATE_FORMAT(empDataNacemento, '%d-%m-%Y') AS "Fecha", YEAR(CURDATE()) - YEAR(empDataNacemento) AS "Idade"
FROM empregado
WHERE YEAR(CURDATE()) - YEAR(empDataNacemento) >=50
ORDER BY YEAR(CURDATE()) - YEAR(empDataNacemento) DESC;

/* ? Tarefa 2.17. Mostrar nome de empregado, data de entrada na empresa con formato
dd/mm/aaaa, número de anos traballados e número de trienios completos que levan
traballados os empregados que cumpren 63 anos no ano actual. Ordenar de forma des-
cendente por número de trienios. */
SELECT empNome AS "Nome", DATE_FORMAT(empDataIngreso, '%d/%m/%Y') AS "Entrada na empresa", YEAR(CURDATE()) - YEAR(empDataIngreso) AS "Anos traballados", (YEAR(CURDATE()) - YEAR(empDataIngreso)) DIV 3 AS "Trienios"
FROM empregado
WHERE YEAR(CURDATE()) - YEAR(empDataNacemento) = 63
ORDER BY (YEAR(CURDATE()) - YEAR(empDataIngreso)) DIV 3 DESC;

/* ? Tarefa 2.18.Mostrar a media de idade á que os empregados entran a traballar na empre-
sa. */
SELECT AVG(YEAR(CURDATE()) - YEAR(empDataNacemento)) AS "Media idade"
FROM empregado
WHERE YEAR(CURDATE()) = YEAR(empDataIngreso);

/* ? Tarefa 2.19.Mostrar nome, data de entrada na empresa con formato dd/mm/aaaa e o
número de anos completos que leva traballando na empresa, para os empregados que
cumpren anos no mes actual. */
SELECT empNome AS "Nome", DATE_FORMAT(empDataIngreso, '%d/%m/%Y') As "Entrada", YEAR(CURDATE()) - YEAR(empDataIngreso) AS "Anos traballados"
FROM empregado
WHERE MONTH(CURDATE()) = MONTH(empDataNacemento);

/* ? Tarefa 2.20.Mostrar a diferenza de días traballados entre o empregado máis antigo e o
máis recente, indicando a data de ingreso de ambos traballadores. */
SELECT DATEDIFF(MAX (empDataIngreso), MIN(empDataIngreso)) AS "Diferencia", MIN(empDataIngreso) AS "Máis antigo", MAX(empDataIngreso) AS "Máis novo"
FROM empregado;

/* ? Tarefa 2.21. Mostrar ordenados por número de empregado, o número de empregado,
nome, salario e comisión dos empregados que teñan un salario de máis de 1800 euros.
¿Cantas tuplas devolve?*/
SELECT empNumero AS "Número", empNome AS "Nome", empSalario AS "Salario", empComision AS "Comisión"
FROM empregado
WHERE empSalario > 1800
ORDER BY empNumero;

/*Agora, mostrar ordenados por número de empregado, o número de empregado, nome,
salario, comisión e salario mensual total (salario+comisión) dos empregados cun sala-
rio mensual total de máis de 1800 euros. ¿Cantas tuplas devolve? Polo menos ten que
devolver as mesmas que na consulta anterior */
SELECT empNumero AS "Número", empNome AS "Nome", empSalario AS "Salario", empComision AS "Comisión", empSalario + IFNULL(empComision, 0)  AS "Mensual total"
FROM empregado
WHERE empSalario + IFNULL(empComision, 0) > 1800;

