/*Sobre a base de datos tendaBD*/
USE A22DavidCR_tendaB;

/*? Tarefa 1.1. Seleccionar os artigos de cor negra e mostrar o seu número, nome e peso,
así como o nome do provedor.*/
SELECT a.art_codigo AS Código, a.art_nome AS Artigo, a.art_peso AS Peso, p.prv_nome AS Proveedor
FROM artigos a 
JOIN provedores p ON p.prv_id = a.art_provedor
WHERE a.art_color = 'Negro';

/*? Tarefa 1.2. Seleccionar para todos os clientes os apelidos, nome e o nome da provincia
na que residen. Os dous primeiros díxitos do código postal (clt_cp) corresponden ao
código da provincia na que reside o cliente. Ordenar o resultado polo nome da provin-
cia, e dentro da provincia, polos apelidos e nome, alfabeticamente.*/


/*? Tarefa 1.3. Mostrar para cada venda: nome e apelidos do cliente, día, mes, e ano da
venda (cada un nunha columna).*/
SELECT c.clt_nome AS Nome, c.clt_apelidos AS Apelidos, DAY(ven_data) AS Día, MONTH(ven_data) AS Mes, YEAR(ven_data) AS Ano
FROM vendas v
JOIN clientes c ON c.clt_id = v.ven_cliente;

/*? Tarefa 1.4. Seleccionar para cada artigo o seu código, nome, peso e o nome que corres-
ponde ao peso (peso_nome), tendo en conta a información contida na táboa pesos, que
da un nome aos pesos en función do intervalo ao que pertence. Ordenar o resultado po-
lo peso do artigo, de maior a menor.*/
SELECT art_codigo AS Código, art_nome AS Nome, art_peso AS Pesp
FROM artigos a 
ORDER BY art_peso

/*? Tarefa 1.5. Mostrar para cada venta: nome e apelidos do cliente, a data da venta con
formato dd/mm/aa e os días transcorridos dende que se fixo a venta. Ordenar o resulta-
do polo número de días transcorridos dende a venta.*/

/*? Tarefa 1.6. Seleccionar para cada venda:
– Datos da venda: identificador e data da venda.
– Datos do cliente: nome do cliente (nome e apelidos separados por coma).
– Datos do empregado: nome do empregado (nome e apelidos separados por coma).
Mostrar os datos ordenados polos apelidos e nome do cliente.*/

/*Sobre a base de datos traballadores*/

/*? Tarefa 1.7. Seleccionar o número e nome de departamento, xunto co nome do director,
para os departamentos independentes, é dicir, que non dependen de ningún outro depar-
tamento.*/

/*? Tarefa 1.8. Mostrar nome (apelidos, nome) dos empregados e enderezo do centro ao
que pertence o departamento no que traballa, dos empregados cun apelido que empece
por 'A'.*/




/*Tarefa 2. Realizar consultas con datos de máis dunha táboa
utilizando unha composición externa
A tarefa consiste en realizar as seguintes consultas utilizando unha composición externa.*/

/*Sobre a base de datos tendaBD*/

/*? Tarefa 2.1. Para todos os clientes con identificador inferior ou igual a 10, seleccionar os
datos das vendas que se lle fixeron. Hai que mostrar para cada venda, o identificador do
cliente, apelidos, nome e data de venda. Se a algún deses clientes non se lle fixo ningu-
nha venda, deberá aparecer na lista co seu identificador, nome, apelidos, e o texto 'SEN
COMPRAS' na columna da data da venda.*/

/*? Tarefa 2.2. Seleccionar o código (emp_id), apelidos e nome de todos os empregados.
Engadir unha columna na lista de selección, co alias Vendas, na que se mostre o literal
'Si' se o empregado fixo algunha venda, ou o literal 'Non' no caso de que aínda non fi-
xera ningunha venda.*/




/*Tarefa 3. Realizar consultas dunha táboa consigo mesma
A tarefa consiste en realizar as seguintes consultas compoñendo unha táboa consigo mes-
ma.*/

/*Sobre a base de datos tendaBD*/

/*? Tarefa 3.1. Obter unha lista de todos os artigos (código e nome) que teñan un prezo de
compra superior ao prezo de compra do artigo con código ' 0713242'.*/




/*Tarefa 4. Combinar o resultado de varias sentenzas SELECT
para obter un conxunto de resultados único utilizando UNION
A tarefa consiste en realizar as seguintes consultas utilizando UNION.*/

/*Sobre a base de datos tendaBD*/

/*? Tarefa 4.1. Seleccionar todos os artigos negros, xunto cos artigos que pesan máis de
5000 gramos, escribindo dúas consultas, e empregando o operador de unión de consul-
tas.*/

/*? Tarefa 4.2. Para facer un envío de cartas con información dunha nova campaña por co-
rreo postal, seleccionar apelidos, nome, enderezo, código postal e poboación de todos
os clientes e de todos os empregados. Na lista hai que diferenciar se a persoa é cliente
ou empregado. Ordenar o resultado por orden alfabético de apelidos e nome.*/



