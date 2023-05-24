-- Mostrar os datos de todas as tendas.
SELECT *
FROM tendas;

/* Mostrar os nomes de todos os provedores. A columna mostrada no resulta-
do debe chamarse Nome. */
SELECT prv_nome AS Nome
FROM provedores;

/* Obter a lista das poboacións nas que existen clientes ordenadas alfabetica-
mente. */
SELECT DISTINCT clt_poboacion
FROM clientes;

/* Mostrar o prezo de venda de todos os artigos e o prezo que resultaría des-
pois de aplicarlles un incremento do 10%. */
SELECT art_pv AS PrezoVenta,
	art_pv*1.1 AS PrezoFinal
FROM artigos;

/* Mostrar o número de cliente, apelidos e nome de todos os clientes de Ma-
drid. */
SELECT clt_id,
	clt_apelidos,
	clt_nome
FROM clientes
WHERE clt_poboacion IN ('Madrid');

/* Seleccionar o código, descrición e peso dos artigos que pesen máis de 500
gramos. */
SELECT art_codigo,
	art_nome,
	art_peso 
FROM artigos 
WHERE art_peso > 500;

/* Seleccionar todos os artigos que teñan prezo de venda superior ou igual ao
dobre do prezo de compra. */
SELECT art_codigo AS Código, 
	art_nome AS Nome, 
	art_pc AS PrecioCompra,
	art_pv AS PrecioVenta
FROM artigos
WHERE art_pv >= 2*art_pc;

/* Seleccionar apelidos, nome, poboación e desconto, de todos clientes de As-
turias ou Valencia que teñan un desconto superior ao 2% ou que non teñan desconto. */
SELECT clt_apelidos AS Apelidos,
	clt_nome AS Nome,
	clt_poboacion AS Poboación,
	clt_desconto AS Desconto
FROM clientes
WHERE (clt_poboacion IN ('Asturias') OR clt_poboacion IN ('Valencia'))
	AND (clt_desconto > 2 OR clt_desconto = 0);

-- Seleccionar todos os artigos de cor negra que pesen máis de 5000 gramos.
SELECT *
FROM artigos 
WHERE art_color IN ('Negro') AND art_peso > 5000;

/* Obter todos os artigos que non son de cor negra ou que teñan un peso me-
nor ou igual de 5000 gramos, é dicir, obter o resultado complementario da consulta an-
terior. */
SELECT *
FROM artigos 
WHERE !(art_color IN ('Negro') OR art_peso > 5000);

/* Seleccionar os artigos que son de cor negra e pesan máis de 100 gramos,
ou ben son de cor cyan. */
SELECT *
FROM artigos
WHERE (art_color IN ('Negro') AND art_peso > 100)
	OR art_color IN ('Cyan');

/* Facer unha lista dos artigos que teñan un prezo de compra entre 12 e 18
euros, ambos prezos incluídos. */
SELECT *
FROM artigos
WHERE art_pc >= 12
	AND art_pc <= 18;

-- Mostrar unha lista de artigos de cor negra ou de cor cyan.
SELECT art_nome AS Nome,
	art_codigo AS Código,
	art_color AS Color
FROM artigos
WHERE art_color IN ('Negro')
	OR art_color IN ('Cyan')
ORDER BY art_color;

/* Buscar un cliente do que se descoñece o apelido exacto, pero se sabe que
as dúas primeiras letras son 'RO'. */
SELECT clt_id AS ID,
	clt_cif AS CIF,
	clt_apelidos AS Apelidos,
	clt_nome AS Nome
FROM clientes
WHERE clt_apelidos LIKE ('Ro%');

/* Buscar clientes que teñan o nome de 5 letras, empezando por 'B' e termi-
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

/* Mostrar código de artigo, nome, prezo de compra, prezo de venda e marxe
de beneficio (prezo de venda – prezo de compra) dos artigos que teñen un prezo de
compra superior a 3000 euros, ordenados pola marxe. */
SELECT art_pv - art_pc AS MarxeBeneficio,
	art_codigo AS Código,
	art_nome AS Nome,
	art_pc AS PrecioCompra,
	art_pv AS PrecioVenta
FROM artigos
WHERE art_pc > 3000
ORDER BY MarxeBeneficio DESC;

/* Clasificar nome, provedor, stock e peso dos artigos que teñen un peso me-
nor ou igual de 1000 gramos, por orden crecente do provedor. Cando os provedores
coincidan, deben clasificarse polo stock en orden decrecente. */
SELECT art_nome AS Nome,
	art_provedor AS Proveedor,
	art_stock AS Stock,
	art_peso AS Peso
FROM artigos  
WHERE art_peso >= 1000
ORDER BY art_provedor ASC, art_stock DESC; 

/* Seleccionar nome e apelidos dos clientes que teñan un apelido que empece
por 'F' e remate por 'Z'. */
SELECT clt_nome AS Nome,
	clt_apelidos AS Apelidos
FROM clientes
WHERE clt_apelidos LIKE ('% F%z')
	OR clt_apelidos LIKE ('F%z %');


/* Seleccionar todos os artigos que leven a palabra LED, en maiúsculas, na
súa descrición. */
SELECT *
FROM artigos
WHERE art_nome REGEXP BINARY 'LED';

/* Seleccionar todos os artigos que teñan unha descrición que empece por
'CABI', sen diferenciar maiúsculas de minúsculas. */
SELECT *
FROM artigos
WHERE art_nome REGEXP '^Cabi';

/* Comprobar que un número é un valor enteiro, que pode empezar polos
símbolos + ou -. */

-- ????????????????????

/* Seleccionar os clientes que teñan un apelido que empece pola letra 'a' ou
pola letra 'f'. */
SELECT *
FROM clientes
WHERE clt_apelidos REGEXP '^[af]'
	OR clt_apelidos LIKE ('% A%')
	OR clt_apelidos LIKE ('% F%');

/* Seleccionar os clientes que teñan un apelido que non empece por 'a','b','c',
ou 'd', ordenados alfabeticamente. */
SELECT *
FROM clientes
WHERE clt_apelidos NOT REGEXP '^[a-d]' -- Segue tomando o "A" con acento
ORDER BY clt_apelidos ASC;

-- Seleccionar os artigos que teñan un prezo de venta que remata en .00.
SELECT *
FROM artigos
WHERE art_pv REGEXP '\\.0{2}';

/* Seleccionar os clientes que teñen un nome que teña exactamente 5 carácte-
res. */
SELECT *
FROM clientes
WHERE clt_nome REGEXP '^.{5}$';


-- ##Sobre a base de datos traballadores##

USE A22DavidCR_traballadores;
/* Unha nova normativa non permite que as comisións superen o 10% do sa-
lario. Mostrar os número de departamento (de forma ordenada) dos departamentos nos
que exista algún empregado que incumpra esta normativa. */
SELECT empDepartamento AS NúmeroDepartamento
FROM empregado
WHERE empComision > empSalario*0.1
ORDER BY empDepartamento ASC;

/* A campaña de axuda familiar posta en marcha pola empresa, establece que
os empregados que teñan máis de 3 fillos, cobrarán unha paga extra de 30 euros por fi-
llo a partir do terceiro e incluíndo este. Mostrar nome, salario, comisión, número de fi-
llos, importe da paga extra e salario mensual final dos empregados, ordenados alfabeti-
camente polo nome, aplicando a axuda familiar. Axúdate da función ifnull para contro-
lar as comisións nulas. */

-- ????????????????????

/* Mostrar os nomes dos empregados con apelido 'MORA' ou que empece
por 'MORA' ordenados alfabeticamente. */
SELECT empNome AS Nome 
FROM empregado 
WHERE empNome LIKE ('Mora, %')
	OR empNome LIKE ('Mora%, %');

/* A empresa vai organizar un espectáculo para os fillos dos empregados que
durará dous días. O primeiro día invitarase aos empregados con apelido que empece
polas letras dende a 'A' ata a 'L', ambas inclusive. O segundo día invitarase ao resto dos
empregados. Cada empregado recibirá unha invitación por fillo e dúas máis. Cada fillo
recibirá un regalo durante o espectáculo. Mostrar unha lista ordenada alfabeticamente
polo nome do empregado na que aparezan os nomes dos empregados que se invitarán
no primeiro día, o número de invitación que lle corresponden e o número de regalos
que hai que preparar para el. */

/* Mostrar os nomes e salarios dos empregados que cumpran algunha das se-
guintes condicións:
– Non teñen fillos e gañan máis de 1200 euros.
– Teñen fillos e gañan menos de 1800 euros. */
SELECT empNome AS Nome,
	empSalario AS Salario
FROM empregado
WHERE (empFillos = 0 AND empSalario > 1200)
	OR (empFillos > 0 AND empSalario < 1800);

/* Mostrar nome e salario base dos empregados que non teñen fillos ordena-
dos de maior a menor polo salario base. */
SELECT empNome AS Nome,
	empSalario AS Salario
FROM empregado
WHERE empFillos = 0
ORDER BY empSalario DESC;

/* Mostrar por orde alfabético, os nomes e salarios base dos empregados que
traballen no departamento 111 e teñan unha comisión que supere o 15% do seu salario
base. */
SELECT empNome AS Nome,
	empSalario AS Salario
FROM empregado
WHERE empDepartamento = 111 AND empComision > empSalario*0.15
ORDER BY empNome ASC;

/* A empresa decide aumentar a comisión nun 15% aos empregados que te-
ñan máis de 2 fillos. Mostrar ordenados alfabeticamente polo nome de empregado: no-
me do empregado, número de fillos, importe da comisión antes do aumento e importe
da comisión despois do aumento. */




