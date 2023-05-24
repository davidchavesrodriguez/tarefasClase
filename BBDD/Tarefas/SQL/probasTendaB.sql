-- Mostrar os datos de todas as tendas.
SELECT *
FROM tendas;

/* Mostrar os nomes de todos os provedores. A columna mostrada no resulta-
do debe chamarse Nome. */
SELECT prv_nome AS Nome
FROM provedores;

/* Obter a lista das poboaci�ns nas que existen clientes ordenadas alfabetica-
mente. */
SELECT DISTINCT clt_poboacion
FROM clientes;

/* Mostrar o prezo de venda de todos os artigos e o prezo que resultar�a des-
pois de aplicarlles un incremento do 10%. */
SELECT art_pv AS PrezoVenta,
	art_pv*1.1 AS PrezoFinal
FROM artigos;

/* Mostrar o n�mero de cliente, apelidos e nome de todos os clientes de Ma-
drid. */
SELECT clt_id,
	clt_apelidos,
	clt_nome
FROM clientes
WHERE clt_poboacion IN ('Madrid');

/* Seleccionar o c�digo, descrici�n e peso dos artigos que pesen m�is de 500
gramos. */
SELECT art_codigo,
	art_nome,
	art_peso 
FROM artigos 
WHERE art_peso > 500;

/* Seleccionar todos os artigos que te�an prezo de venda superior ou igual ao
dobre do prezo de compra. */
SELECT art_codigo AS C�digo, 
	art_nome AS Nome, 
	art_pc AS PrecioCompra,
	art_pv AS PrecioVenta
FROM artigos
WHERE art_pv >= 2*art_pc;

/* Seleccionar apelidos, nome, poboaci�n e desconto, de todos clientes de As-
turias ou Valencia que te�an un desconto superior ao 2% ou que non te�an desconto. */
SELECT clt_apelidos AS Apelidos,
	clt_nome AS Nome,
	clt_poboacion AS Poboaci�n,
	clt_desconto AS Desconto
FROM clientes
WHERE (clt_poboacion IN ('Asturias') OR clt_poboacion IN ('Valencia'))
	AND (clt_desconto > 2 OR clt_desconto = 0);

-- Seleccionar todos os artigos de cor negra que pesen m�is de 5000 gramos.
SELECT *
FROM artigos 
WHERE art_color IN ('Negro') AND art_peso > 5000;

/* Obter todos os artigos que non son de cor negra ou que te�an un peso me-
nor ou igual de 5000 gramos, � dicir, obter o resultado complementario da consulta an-
terior. */
SELECT *
FROM artigos 
WHERE !(art_color IN ('Negro') OR art_peso > 5000);

/* Seleccionar os artigos que son de cor negra e pesan m�is de 100 gramos,
ou ben son de cor cyan. */
SELECT *
FROM artigos
WHERE (art_color IN ('Negro') AND art_peso > 100)
	OR art_color IN ('Cyan');

/* Facer unha lista dos artigos que te�an un prezo de compra entre 12 e 18
euros, ambos prezos inclu�dos. */
SELECT *
FROM artigos
WHERE art_pc >= 12
	AND art_pc <= 18;

-- Mostrar unha lista de artigos de cor negra ou de cor cyan.
SELECT art_nome AS Nome,
	art_codigo AS C�digo,
	art_color AS Color
FROM artigos
WHERE art_color IN ('Negro')
	OR art_color IN ('Cyan')
ORDER BY art_color;

/* Buscar un cliente do que se desco�ece o apelido exacto, pero se sabe que
as d�as primeiras letras son 'RO'. */
SELECT clt_id AS ID,
	clt_cif AS CIF,
	clt_apelidos AS Apelidos,
	clt_nome AS Nome
FROM clientes
WHERE clt_apelidos LIKE ('Ro%');

/* Buscar clientes que te�an o nome de 5 letras, empezando por 'B' e termi-
nando por 'A'. */
SELECT clt_id AS ID,
	clt_cif AS CIF,
	clt_apelidos AS Apelidos,
	clt_nome AS Nome
FROM clientes
WHERE clt_nome LIKE ('B___A');

-- Buscar todos os artigos para os que non se gravou o seu color.
SELECT *
FROM artigos
WHERE art_color IS NULL;

-- Clasificar os artigos tendo en conta o seu peso, por orden decrecente.
SELECT *
FROM artigos
ORDER BY art_peso DESC;

/* Mostrar c�digo de artigo, nome, prezo de compra, prezo de venda e marxe
de beneficio (prezo de venda � prezo de compra) dos artigos que te�en un prezo de
compra superior a 3000 euros, ordenados pola marxe. */
SELECT art_pv - art_pc AS MarxeBeneficio,
	art_codigo AS C�digo,
	art_nome AS Nome,
	art_pc AS PrecioCompra,
	art_pv AS PrecioVenta
FROM artigos
WHERE art_pc > 3000
ORDER BY MarxeBeneficio DESC;

/* Clasificar nome, provedor, stock e peso dos artigos que te�en un peso me-
nor ou igual de 1000 gramos, por orden crecente do provedor. Cando os provedores
coincidan, deben clasificarse polo stock en orden decrecente. */
SELECT art_nome AS Nome,
	art_provedor AS Proveedor,
	art_stock AS Stock,
	art_peso AS Peso
FROM artigos  
WHERE art_peso >= 1000
ORDER BY art_provedor ASC, art_stock DESC; 

/* Seleccionar nome e apelidos dos clientes que te�an un apelido que empece
por 'F' e remate por 'Z'. */
SELECT clt_nome AS Nome,
	clt_apelidos AS Apelidos
FROM clientes
WHERE clt_apelidos LIKE ('% F%z')
	OR clt_apelidos LIKE ('F%z %');


/* Seleccionar todos os artigos que leven a palabra LED, en mai�sculas, na
s�a descrici�n. */
SELECT *
FROM artigos
WHERE art_nome REGEXP BINARY 'LED';

/* Seleccionar todos os artigos que te�an unha descrici�n que empece por
'CABI', sen diferenciar mai�sculas de min�sculas. */
SELECT *
FROM artigos
WHERE art_nome REGEXP '^Cabi';

/* Comprobar que un n�mero � un valor enteiro, que pode empezar polos
s�mbolos + ou -. */

-- ????????????????????

/* Seleccionar os clientes que te�an un apelido que empece pola letra 'a' ou
pola letra 'f'. */
SELECT *
FROM clientes
WHERE clt_apelidos REGEXP '^[af]'
	OR clt_apelidos LIKE ('% A%')
	OR clt_apelidos LIKE ('% F%');

/* Seleccionar os clientes que te�an un apelido que non empece por 'a','b','c',
ou 'd', ordenados alfabeticamente. */
SELECT *
FROM clientes
WHERE clt_apelidos NOT REGEXP '^[a-d]' -- Segue tomando o "A" con acento
ORDER BY clt_apelidos ASC;

-- Seleccionar os artigos que te�an un prezo de venta que remata en .00.
SELECT *
FROM artigos
WHERE art_pv REGEXP '\\.0{2}';

/* Seleccionar os clientes que te�en un nome que te�a exactamente 5 car�cte-
res. */
SELECT *
FROM clientes
WHERE clt_nome REGEXP '^.{5}$';


-- ##Sobre a base de datos traballadores##

USE A22DavidCR_traballadores;
/* Unha nova normativa non permite que as comisi�ns superen o 10% do sa-
lario. Mostrar os n�mero de departamento (de forma ordenada) dos departamentos nos
que exista alg�n empregado que incumpra esta normativa. */
SELECT empDepartamento AS N�meroDepartamento
FROM empregado
WHERE empComision > empSalario*0.1
ORDER BY empDepartamento ASC;

/* A campa�a de axuda familiar posta en marcha pola empresa, establece que
os empregados que te�an m�is de 3 fillos, cobrar�n unha paga extra de 30 euros por fi-
llo a partir do terceiro e inclu�ndo este. Mostrar nome, salario, comisi�n, n�mero de fi-
llos, importe da paga extra e salario mensual final dos empregados, ordenados alfabeti-
camente polo nome, aplicando a axuda familiar. Ax�date da funci�n ifnull para contro-
lar as comisi�ns nulas. */

-- ????????????????????

/* Mostrar os nomes dos empregados con apelido 'MORA' ou que empece
por 'MORA' ordenados alfabeticamente. */
SELECT empNome AS Nome 
FROM empregado 
WHERE empNome LIKE ('Mora, %')
	OR empNome LIKE ('Mora%, %');

/* A empresa vai organizar un espect�culo para os fillos dos empregados que
durar� dous d�as. O primeiro d�a invitarase aos empregados con apelido que empece
polas letras dende a 'A' ata a 'L', ambas inclusive. O segundo d�a invitarase ao resto dos
empregados. Cada empregado recibir� unha invitaci�n por fillo e d�as m�is. Cada fillo
recibir� un regalo durante o espect�culo. Mostrar unha lista ordenada alfabeticamente
polo nome do empregado na que aparezan os nomes dos empregados que se invitar�n
no primeiro d�a, o n�mero de invitaci�n que lle corresponden e o n�mero de regalos
que hai que preparar para el. */

/* Mostrar os nomes e salarios dos empregados que cumpran algunha das se-
guintes condici�ns:
� Non te�en fillos e ga�an m�is de 1200 euros.
� Te�en fillos e ga�an menos de 1800 euros. */
SELECT empNome AS Nome,
	empSalario AS Salario
FROM empregado
WHERE (empFillos = 0 AND empSalario > 1200)
	OR (empFillos > 0 AND empSalario < 1800);

/* Mostrar nome e salario base dos empregados que non te�en fillos ordena-
dos de maior a menor polo salario base. */
SELECT empNome AS Nome,
	empSalario AS Salario
FROM empregado
WHERE empFillos = 0
ORDER BY empSalario DESC;

/* Mostrar por orde alfab�tico, os nomes e salarios base dos empregados que
traballen no departamento 111 e te�an unha comisi�n que supere o 15% do seu salario
base. */
SELECT empNome AS Nome,
	empSalario AS Salario
FROM empregado
WHERE empDepartamento = 111 AND empComision > empSalario*0.15
ORDER BY empNome ASC;

/* A empresa decide aumentar a comisi�n nun 15% aos empregados que te-
�an m�is de 2 fillos. Mostrar ordenados alfabeticamente polo nome de empregado: no-
me do empregado, n�mero de fillos, importe da comisi�n antes do aumento e importe
da comisi�n despois do aumento. */




