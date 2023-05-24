/*Sobre a base de datos tendaBD*/
USE A22DavidCR_tendaB;

/*? Tarefa 1.1. Seleccionar os artigos de cor negra e mostrar o seu n�mero, nome e peso,
as� como o nome do provedor.*/
SELECT a.art_codigo AS C�digo, a.art_nome AS Artigo, a.art_peso AS Peso, p.prv_nome AS Proveedor
FROM artigos a 
JOIN provedores p ON p.prv_id = a.art_provedor
WHERE a.art_color = 'Negro';

/*? Tarefa 1.2. Seleccionar para todos os clientes os apelidos, nome e o nome da provincia
na que residen. Os dous primeiros d�xitos do c�digo postal (clt_cp) corresponden ao
c�digo da provincia na que reside o cliente. Ordenar o resultado polo nome da provin-
cia, e dentro da provincia, polos apelidos e nome, alfabeticamente.*/


/*? Tarefa 1.3. Mostrar para cada venda: nome e apelidos do cliente, d�a, mes, e ano da
venda (cada un nunha columna).*/
SELECT c.clt_nome AS Nome, c.clt_apelidos AS Apelidos, DAY(ven_data) AS D�a, MONTH(ven_data) AS Mes, YEAR(ven_data) AS Ano
FROM vendas v
JOIN clientes c ON c.clt_id = v.ven_cliente;

/*? Tarefa 1.4. Seleccionar para cada artigo o seu c�digo, nome, peso e o nome que corres-
ponde ao peso (peso_nome), tendo en conta a informaci�n contida na t�boa pesos, que
da un nome aos pesos en funci�n do intervalo ao que pertence. Ordenar o resultado po-
lo peso do artigo, de maior a menor.*/
SELECT art_codigo AS C�digo, art_nome AS Nome, art_peso AS Pesp
FROM artigos a 
ORDER BY art_peso

/*? Tarefa 1.5. Mostrar para cada venta: nome e apelidos do cliente, a data da venta con
formato dd/mm/aa e os d�as transcorridos dende que se fixo a venta. Ordenar o resulta-
do polo n�mero de d�as transcorridos dende a venta.*/

/*? Tarefa 1.6. Seleccionar para cada venda:
� Datos da venda: identificador e data da venda.
� Datos do cliente: nome do cliente (nome e apelidos separados por coma).
� Datos do empregado: nome do empregado (nome e apelidos separados por coma).
Mostrar os datos ordenados polos apelidos e nome do cliente.*/

/*Sobre a base de datos traballadores*/

/*? Tarefa 1.7. Seleccionar o n�mero e nome de departamento, xunto co nome do director,
para os departamentos independentes, � dicir, que non dependen de ning�n outro depar-
tamento.*/

/*? Tarefa 1.8. Mostrar nome (apelidos, nome) dos empregados e enderezo do centro ao
que pertence o departamento no que traballa, dos empregados cun apelido que empece
por 'A'.*/




/*Tarefa 2. Realizar consultas con datos de m�is dunha t�boa
utilizando unha composici�n externa
A tarefa consiste en realizar as seguintes consultas utilizando unha composici�n externa.*/

/*Sobre a base de datos tendaBD*/

/*? Tarefa 2.1. Para todos os clientes con identificador inferior ou igual a 10, seleccionar os
datos das vendas que se lle fixeron. Hai que mostrar para cada venda, o identificador do
cliente, apelidos, nome e data de venda. Se a alg�n deses clientes non se lle fixo ningu-
nha venda, deber� aparecer na lista co seu identificador, nome, apelidos, e o texto 'SEN
COMPRAS' na columna da data da venda.*/

/*? Tarefa 2.2. Seleccionar o c�digo (emp_id), apelidos e nome de todos os empregados.
Engadir unha columna na lista de selecci�n, co alias Vendas, na que se mostre o literal
'Si' se o empregado fixo algunha venda, ou o literal 'Non' no caso de que a�nda non fi-
xera ningunha venda.*/




/*Tarefa 3. Realizar consultas dunha t�boa consigo mesma
A tarefa consiste en realizar as seguintes consultas compo�endo unha t�boa consigo mes-
ma.*/

/*Sobre a base de datos tendaBD*/

/*? Tarefa 3.1. Obter unha lista de todos os artigos (c�digo e nome) que te�an un prezo de
compra superior ao prezo de compra do artigo con c�digo ' 0713242'.*/




/*Tarefa 4. Combinar o resultado de varias sentenzas SELECT
para obter un conxunto de resultados �nico utilizando UNION
A tarefa consiste en realizar as seguintes consultas utilizando UNION.*/

/*Sobre a base de datos tendaBD*/

/*? Tarefa 4.1. Seleccionar todos os artigos negros, xunto cos artigos que pesan m�is de
5000 gramos, escribindo d�as consultas, e empregando o operador de uni�n de consul-
tas.*/

/*? Tarefa 4.2. Para facer un env�o de cartas con informaci�n dunha nova campa�a por co-
rreo postal, seleccionar apelidos, nome, enderezo, c�digo postal e poboaci�n de todos
os clientes e de todos os empregados. Na lista hai que diferenciar se a persoa � cliente
ou empregado. Ordenar o resultado por orden alfab�tico de apelidos e nome.*/



