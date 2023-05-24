-- Sobre a base de datos tendaBD
USE A22DavidCR_tendaB;

/* ? Tarefa 2.1. Mostrar apelidos e nome nunha mesma columna separados por unha coma,
e o n�mero de letras que ten o nome dos clientes. */
SELECT CONCAT(clt_apelidos, ', ', clt_nome) AS "Nome completo", LENGTH(clt_nome) AS "Longitud do nome"
FROM clientes;

-- ? Tarefa 2.2. Mostrar nomes e apelidos dos clientes en min�scula.
SELECT CONCAT(LOWER(clt_nome), ' ' ,LOWER(clt_apelidos)) AS "Nome min�sculo"
FROM clientes;

/* ? Tarefa 2.3. Mostrar a t�a idade no momento actual (calcular o n�mero de anos que tes).
Suponse que a data do sistema � a correcta. */
SELECT DATEDIFF(CURDATE(), '2002-03-28') DIV 365 AS "Anos";

/* ? Tarefa 2.4. Mostrar t�dalas vendas do mes anterior ao mes actual, en dous supostos:
� Na t�boa g�rdanse datos das vendas dun ano.*/
SELECT * 
FROM vendas 
WHERE MONTH(ven_data) = MONTH(CURDATE()) - 1 AND YEAR(ven_data) = YEAR(CURDATE());

-- � Na t�boa g�rdanse datos das vendas de varios anos.
SELECT * 
FROM vendas 
WHERE MONTH(ven_data) = MONTH(CURDATE()) - 1;

-- inserir vendas tendo en conta que a data actual � 27/01/2023
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


/* ? Tarefa 2.5. Mostrar c�digo, nome, color e prezo de venda (redondeado, sen decimais)
dos artigos de cor negra. */
SELECT art_codigo AS "C�digo", art_nome AS "Nome", art_color AS "Color", ROUND(art_pv) AS "Precio venta"
FROM artigos
WHERE art_color LIKE 'NEGRO';

-- ? Tarefa 2.6. Calcular a media dos pesos de todos os artigos.
SELECT ROUND(AVG(art_peso)) AS "Media de peso"
FROM artigos;

/* ? Tarefa 2.7. Calcular a media do peso, o marxe m�ximo ( m�xima diferenza entre o pre-
zo de venda e o prezo de compra) e a diferenza que se d� entre o maior prezo de venda
e o menor prezo de compra. Estes c�lculos ter�n que facerse para aqueles artigos que
te�an descrito a cor cun valor distinto do NULL. */
SELECT ROUND(AVG(art_peso)) AS "Media de peso", MAX(art_pv - art_pc) AS "Marxe m�ximo", MAX(art_pv) - MIN(art_pc) AS "Maior diferenza"
FROM artigos
WHERE art_color IS NULL;

-- ? Tarefa 2.8. Contar o n�mero de cores distintos que existen na t�boa de artigos.
SELECT DISTINCT art_color AS "Colores"
FROM artigos;

/* ? Tarefa 2.9. Mostrar nome e cor dos artigos. Se a cor � desco�ecida, d�bese mostrar o
texto �DESCO�ECIDO�. */
SELECT art_nome AS "Nome", IFNULL(art_color, 'DESCO�ECIDO') AS Color 
FROM artigos;


-- Sobre a base de datos traballadores
USE A22DavidCR_traballadores;

/* ? Tarefa 2.10. A xubilaci�n na empresa est� establecida aos 60 anos. O empregado xubi-
lado ten dereito a unha liquidaci�n que equivale ao salario dun mes por cada ano de
servizo na empresa. Mostrar nome, data de nacemento, salario mensual base, antig�i-
dade (n�mero de anos dende que entrou a traballar na empresa ata a data de xubilaci�n)
e importe da liquidaci�n que lle corresponde aos empregados que se xubilar�n no ano
actual. */
SELECT empNome AS "Nome", empDataNacemento AS "Nacemento", empSalario AS "Salario", YEAR(CURDATE())-YEAR(empDataIngreso) AS "Antig�edade", empSalario * (YEAR(CURDATE())-YEAR(empDataIngreso)) AS "Liquidaci�n"
FROM empregado
WHERE YEAR(CURDATE()) - YEAR(empDataNacemento) >= 60; 

/* ? Tarefa 2.11. Mostrar nome, d�a e mes do aniversario dos empregados dos departamen-
tos 110 e 111. */
SELECT empNome AS "Nome", DAY(empDataNacemento) AS "D�a de nacemento", MONTH(empDataNacemento) AS "Mes de nacemento" 
FROM empregado
WHERE empDepartamento = 110 OR empDepartamento = 111;

/* ? Tarefa 2.12. Mostrar o n�mero de empregados que este ano cumpren 20 anos traballan-
do na empresa e o salario medio de todos eles. */
SELECT AVG(empSalario) AS "Media de salario"
FROM empregado
WHERE YEAR(CURDATE())-YEAR(empDataIngreso)= 20;

/* ? Tarefa 2.13. Mostrar o importe anual (14 pagas) correspondente ao soldos dos empre-
gados (soldo m�is comisi�ns). */
SELECT empNome AS "Nome", empSalario * 14 + IFNULL(empComision, 0) AS "Salario anual"
FROM empregado;

/* ? Tarefa 2.14. Mostrar o n�mero de departamentos que existen e o presuposto anual me-
dio de todos eles. */
SELECT COUNT(depNumero) AS "N�mero de departamentos", ROUND(AVG(depPresuposto)) AS "Media de presupostos"
FROM departamento;

-- ? Tarefa 2.15. Mostrar o importe total das comisi�ns dos empregados.
SELECT SUM(empComision) AS "Comisi�ns totais"
FROM empregado;

/* ? Tarefa 2.16. Mostrar nome, data de nacemento (dd-mm-aaaa) e idade dos empregados
que te�an actualmente 50 anos ou m�is. Ordenar o resultado pola idade de maior a me-
nor. */
SELECT empNome AS "Nome", DATE_FORMAT(empDataNacemento, '%d-%m-%Y') AS "Fecha", YEAR(CURDATE()) - YEAR(empDataNacemento) AS "Idade"
FROM empregado
WHERE YEAR(CURDATE()) - YEAR(empDataNacemento) >=50
ORDER BY YEAR(CURDATE()) - YEAR(empDataNacemento) DESC;

/* ? Tarefa 2.17. Mostrar nome de empregado, data de entrada na empresa con formato
dd/mm/aaaa, n�mero de anos traballados e n�mero de trienios completos que levan
traballados os empregados que cumpren 63 anos no ano actual. Ordenar de forma des-
cendente por n�mero de trienios. */
SELECT empNome AS "Nome", DATE_FORMAT(empDataIngreso, '%d/%m/%Y') AS "Entrada na empresa", YEAR(CURDATE()) - YEAR(empDataIngreso) AS "Anos traballados", (YEAR(CURDATE()) - YEAR(empDataIngreso)) DIV 3 AS "Trienios"
FROM empregado
WHERE YEAR(CURDATE()) - YEAR(empDataNacemento) = 63
ORDER BY (YEAR(CURDATE()) - YEAR(empDataIngreso)) DIV 3 DESC;

/* ? Tarefa 2.18.Mostrar a media de idade � que os empregados entran a traballar na empre-
sa. */
SELECT AVG(YEAR(CURDATE()) - YEAR(empDataNacemento)) AS "Media idade"
FROM empregado
WHERE YEAR(CURDATE()) = YEAR(empDataIngreso);

/* ? Tarefa 2.19.Mostrar nome, data de entrada na empresa con formato dd/mm/aaaa e o
n�mero de anos completos que leva traballando na empresa, para os empregados que
cumpren anos no mes actual. */
SELECT empNome AS "Nome", DATE_FORMAT(empDataIngreso, '%d/%m/%Y') As "Entrada", YEAR(CURDATE()) - YEAR(empDataIngreso) AS "Anos traballados"
FROM empregado
WHERE MONTH(CURDATE()) = MONTH(empDataNacemento);

/* ? Tarefa 2.20.Mostrar a diferenza de d�as traballados entre o empregado m�is antigo e o
m�is recente, indicando a data de ingreso de ambos traballadores. */
SELECT DATEDIFF(MAX (empDataIngreso), MIN(empDataIngreso)) AS "Diferencia", MIN(empDataIngreso) AS "M�is antigo", MAX(empDataIngreso) AS "M�is novo"
FROM empregado;

/* ? Tarefa 2.21. Mostrar ordenados por n�mero de empregado, o n�mero de empregado,
nome, salario e comisi�n dos empregados que te�an un salario de m�is de 1800 euros.
�Cantas tuplas devolve?*/
SELECT empNumero AS "N�mero", empNome AS "Nome", empSalario AS "Salario", empComision AS "Comisi�n"
FROM empregado
WHERE empSalario > 1800
ORDER BY empNumero;

/*Agora, mostrar ordenados por n�mero de empregado, o n�mero de empregado, nome,
salario, comisi�n e salario mensual total (salario+comisi�n) dos empregados cun sala-
rio mensual total de m�is de 1800 euros. �Cantas tuplas devolve? Polo menos ten que
devolver as mesmas que na consulta anterior */
SELECT empNumero AS "N�mero", empNome AS "Nome", empSalario AS "Salario", empComision AS "Comisi�n", empSalario + IFNULL(empComision, 0)  AS "Mensual total"
FROM empregado
WHERE empSalario + IFNULL(empComision, 0) > 1800;

