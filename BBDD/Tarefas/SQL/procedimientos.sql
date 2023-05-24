/*1. Rutinas almacenadas
Tarefa 1. Crear e executar procedementos almacenados
A tarefa consiste en escribir os guións de sentenzas SQL necesarios para crear procedemen-
tos almacenados atendendo a varios supostos, documentando os guións, e executando os
procedementos creados.
 Tarefa 1.1.
Crea un procedemento almacenado “actualizar_depEmpregados” na base de datos
“traballadores” que actualice a columna depEmpregados da táboa departamento, para
todos os departamentos, contando o número de empregados que traballan nese departa-
mento tendo en conta a información da columna empDepartamento da táboa empregado.
– Crea o procedemento. Unha vez creado aparecerá en Stored Procedures na base
de datos traballadores.*/
DROP PROCEDURE actualizar_depEmpregados;
DELIMITER //
CREATE PROCEDURE actualizar_depEmpregados()
BEGIN
    UPDATE departamento
    SET depEmpregados = (
        SELECT COUNT(*) 
        FROM empregado 
        WHERE empDepartamento = departamento.depNumero 
    );
END //
DELIMITER ;

-- Consulta antes de executar o procedemento:
select * from departamento;

-- Executa e comproba o funcionamento do procedemento.
call actualizar_depEmpregados();

/*Comprobarás que non produce ningunha saída en pantalla; unicamente in-
forma na zona de saída do número de filas modificadas. Para comprobar o co-
rrecto funcionamento do procedemento almacenado hai que consultar o con-
tido da columna depEmpregados da táboa departamento e contrastar os valo-
res dalgún departamento cos datos da táboa empregado.*/

-- Consulta despois de executar o procedemento:
select * from departamento;

-- Consulta cantos empregados hai no departamento 122, na táboa empregado:
select count(*) from empregado where empDepartamento = 122;


/* Tarefa 1.2 (Resolta). Crear un procedemento almacenado co nome vertaboas na base
de datos utilidades, que utilice a información contida na base de datos in-
formation_schema para mostrar información das táboas que hai nas bases de datos. O
procedemento recibe como parámetro de entrada unha cadea de texto que pode ser o nome
dunha base de datos, ou ben, o carácter asterisco ('*').
– Cando se lle pasa o carácter '*' debe mostrar todas as táboas do servidor. Para cada
táboa nos interesan as columnas: table_schema, table_name, table_type, engine,
table_rows da táboa information_schema .tables, ordenando o resultado polo nome
do esquema e o nome da táboa.
– Cando se lle pasa o nome dunha base de datos, hai que comprobar que a base de
datos existe na táboa schemata. No caso de existir, se mostrarán todas as táboas
desa base de datos. Para cada táboa nos interesan as columnas: table_name, ta-
ble_type, engine, table_rows da táboa information_schema .tables, ordenando o re-
sultado polo nome da táboa. No caso de non existir a base de datos, se mostrará
unha mensaxe de erro: ' A base de datos xxxxx non existe no servidor '.*/

Solución:
– Código do procedemento
/*
Tarefa_1_2.sql
___________________________________________________________________________________
NOME RUTINA: utilidades.vertaboas (procedemento)
DATA CREACIÓN: 30/04/2022
AUTOR: Profesor
TAREFA A AUTOMATIZAR: - Mostrar información resumida das táboas que hai nun
servidor, ou dunha base de datos concreta, tendo en conta a
información almacenada nas columnas table_schema, table_name
table_name, table_type, engine, table_rows da táboa tables
da base de datos information_schema. Os datos deben saír
ordenados polo nome da base de datos, e o nome da táboa.
PARAMETROS REQUERIDOS: - IN: pBaseDatos se lle poden pasar como valores válidos
o carácter * que significa que se quere ver información das
táboas de todas as bases de datos, ou o nome dunha base de
datos no caso de querer ver información das táboas dunha
base de datos concreta. Calquera outro valor produce unha
mensaxe de erro. O tipo de dato do parámetro ten que ser
o mesmo que a columna table_schema para poder comparalas.
RESULTADOS PRODUCIDOS: - Mostrar en pantalla a información solicitada
___________________________________________________________________________________
*/
delimiter //
-- creación do procedemento usando un nome cualificado
create procedure utilidades.vertaboas(pBaseDatos varchar(64) character set utf8)
begin
declare existe bit default 0;
if pBaseDatos='*' then
select concat(upper(table_schema),'.',lower(table_name)) as `táboa`,
lower(table_type) as tipo,
lower(engine) as motor,
table_rows as filas,
create_time as data_creacion
from information_schema.tables
order by `táboa`;
else
select count(*) into existe
from information_schema.SCHEMATA
where SCHEMA_NAME=pBaseDatos;
if existe = 1 then
select table_name as `táboa`,
lower(table_type) as tipo,
lower(engine) as motor,
table_rows as filas,
create_time as data_creacion
from information_schema.tables
where table_schema=pBaseDatos
order by `táboa`;
else
select concat('A base de datos "',pBaseDatos,'" non existe') as Error;
end if;
end if;
end
//
delimiter ;
– Execución e comprobación do funcionamento do procedemento. Fanse dúas probas
pasando dous valores válidos para o parámetro, e unha terceira proba cun valor que
non é válido, para comprobar que se mostra a mensaxe de erro.
call utilidades.vertaboas('*');
call utilidades.vertaboas('traballadores');
call utilidades.vertaboas('pepiño');
 Tarefa 1.3.
Crea un procedemento almacenado (“inserir_vendas”) que nos permita inserir datos
de proba na táboa vendas na base de datos tendaBD.
– O número de filas a inserir se lle pasa como un parámetro.
– En cada fila, os datos para as columnas ven_cliente, ven_tenda e ven_empregado
obtéñense buscando unha fila de maneira aleatoria nas táboas clientes, tendas e
empregados respectivamente e collendo o código que corresponde. Para buscar
unha fila aleatoria podes utilizar a seguinte sintaxe:
/*seleccionar un empregado aleatoriamente*/
select emp_id into vEmpregado
from empregados
order by rand()
limit 1;
– A columna ven_data colle a data do sistema (now()).
– Nas columnas ven_id e ven_factura non se cargan datos. Na primeira porque é de
tipo autoincremental e xa a calcula o servidor, e a segunda porque non se cubre ata
que se facture a venda.
– Como recomendación, podes:
 Consultar o número de filas antes de executar o procedemento almacenado,
e id da última venda.
select count(*), max(ven_id) from tendaBD.vendas;
 Executar o procedemento pasándolle como parámetro o número de filas que
se van a inserir, e despois executar unha consulta con SELECT para ver os
datos inseridos.
 Se non se desexan conservar estas filas engadidas e son as únicas feitas na
data actual, pódense borrar cunha sentenza DELETE.
 Tarefa 1.4 (Resolta). Crear un procedemento almacenado na base de datos ten-
daBD que permita controlar os intentos de acceso errados dos usuarios da base de datos.
Os parámetros de entrada son o login e password do usuario.
A táboa usuario garda información dos usuarios que poden acceder á base de datos, e
terá o seguinte esquema:
Nome columna Tipo Null Clave Observacións
login varchar(16) N P Nome de usuario
password char(40) N Contrasinal do usuario
A táboa de log_erro_conexion rexistra os intentos de acceso errados, e terá o seguinte
esquema:
Nome columna Tipo Null Clave Observacións
id integer N P Código autoincremental
login varchar(16) N Nome de usuario
password char(40) N Contrasinal do usuario
data_hora timestamp N Data e hora do intento de acceso
O procedemento debe comprobar se existe na táboa usuario algún usuario co login e
password que se pasan como parámetro. No caso de non existir, gárdase na táboa de
rexistro log_erro_conexion a información correspondente ao intento de acceso errado.
No caso de que o usuario faga máis de 5 intentos errados nos últimos 3 minutos, bloque-
arase a súa conta cambiándolle o contrasinal, poñendo unha contrasinal fixa establecida
polo administrador, como por exemplo: 'H347B52(((]ERR'.
O procedemento utilizará un parámetro de saída para poder comprobar se o intento de
acceso tivo éxito ou non. O parámetro ten o valor 0 se o login e o password corresponden
a un usuario que existe na táboa; o valor 1 se o usuario non existe; o valor 2 no caso de
bloqueo da conta por superar o número de intentos permitidos.
Solución
– Código do procedemento
/*
Tarefa_1_4.sql
___________________________________________________________________________________
NOME RUTINA: erro_login (procedemento)
DATA CREACIÓN: 01/05/2022
AUTOR: Profesor
TAREFA A AUTOMATIZAR: - Controlar intentos de acceso dos usuarios, comprobando se
o usuario que intenta acceder está na táboa de usuarios.
No caso de non existir o usuario na táboa se rexistra a
información do intento de acceso nunha táboa de rexistro.
No caso de que un usuario faga máis de 5 intentos errados nos
últimos 3 minutos se lle bloqueará a súa conta cambiándolle o
password por un valor fixo establecido polo administrador
PARAMETROS REQUERIDOS: - IN: pLogin: login do usuario.
- IN: pPassword: contrasinal do usuario
- OUT: pMensaxe: devolve o valor 0 se o login e password
corresponden a un usuario que existe na táboa de usuarios, o
valor 1 se o usuario non existe, e o valor 2 no caso en que
se lle cambie á password ao usuario por superar o número de
intentos permitidos.
RESULTADOS PRODUCIDOS: - Non mostra nada en pantalla, pero devolve os valores 0,1,2
no parámetro de saída.
___________________________________________________________________________________
*/
use tendaBD;
drop procedure if exists erro_login;
delimiter //
create procedure erro_login (pUsuario char(16), pPassword char(40), out pMensaxe
tinyint(1))
begin
declare vIntentos int; /*contador de intentos errados nos tres últimos minutos*/
declare vUsuarioValido boolean default 0; /*vale 1 cando usuario existe na táboa*/
/*Comprobación da existencia do usuario co login e password pasados como parámetro */
select count(*) into vUsuarioValido
from usuario
where login=pUsuario and password=pPassword;
/*No caso de que non sexa correcta a conta de usuario rexístrase o intento errado en
log_erro_conexion e cóntanse o número de intentos errados nos últimos 3 minutos*/
if vUsuarioValido = 0 then /*No caso de non existir o usuario*/
insert into log_erro_conexion (login, password) values (pUsuario, pPassword);
select count(*) into vIntentos /*Contar intentos nos últimos 3 minutos*/
from log_erro_conexion
where login = pUsuario and timestampdiff(minute,data_hora,now()) <=3;
/* timestampdiff devolve os minutos que hay entre data_hora e a
hora actual */
if vIntentos <= 5 then
set pMensaxe = 1;
else
set pMensaxe = 2;
update usuario set password = 'H347B52(((]ERR' where login = pUsuario;
end if;
else /*No caso de existir o usuario*/
set pMensaxe = 0;
end if;
end
//
delimiter ;
– Execución e comprobación do funcionamento do procedemento. O primeiro para
facer a comprobación é crear as táboas no caso de non existir, e dar de alta algún
usuario. Para facer as probas se van a inserir usuarios co seu password sen cifrar,
aínda que na práctica real a password dos usuarios debería gardarse cifrada utili-
zando para elo funcións que xa incorpora MySQL, como MD5, SHA1, ou SHA2.
use tendaBD;
create table if not exists usuario (
login varchar(16),
password char(40),
primary key (login)
)engine = innodb;
create table if not exists log_erro_conexion (
id integer unsigned auto_increment not null,
login varchar(16),
password char(40),
data_hora timestamp default now(),
primary key (id)
)engine = innodb;
insert into usuario values ('pepe','pepe');
insert into usuario values ('pepa','pepa');
Execútase o procedemento e mírase cal é o valor que devolve o parámetro de saída en
cada execución. Primeiro pásanse como parámetros un login e un pasword dun usuario
que exista, e compróbase que devolva o valor 0, e despois execútase 6 veces o procede-
mento pasando sempre o mesmo login, pero cunha password errónea. Despois dos seis
intentos compróbase que o password do usuario foi modificado.
call erro_login('pepe','pepe',@proba);
select @proba;
call erro_login('pepe','aa',@proba);
select @proba;
call erro_login('pepe','ee',@proba);
select @proba;
call erro_login('pepe','el',@proba);
select @proba;
select * from usuario;
call erro_login('pepe','es',@proba);
select @proba;
call erro_login('pepe','ex',@proba);
select @proba;
call erro_login('pepe','EX',@proba);
select @proba;
select * from log_erro_conexion;
select * from usuario;
1.1.1 Tarefa 2. Crear e utilizar funcións definidas polo usuario
A tarefa consiste en escribir os guións de sentenzas SQL necesarios para crear funcións
atendendo a varios supostos, e facer as probas de funcionamento utilizando as funcións cre-
adas nunha consulta coa sentenza SELECT.
 Tarefa 2.1 (Resolta). Crear unha función na base de datos utilidades á que se lle pasa
como parámetro o número do mes, e devolva o nome do mes en galego.
Solución
– Código da función
/*
Tarefa_2_1.sql
___________________________________________________________________________________
NOME RUTINA: mesGalego (función)
DATA CREACIÓN: 01/05/2022
AUTOR: Profesor
TAREFA A AUTOMATIZAR: - Obter o nome do mes en galego partindo do número do mes
PARAMETROS REQUERIDOS: - Número do mes
RESULTADOS PRODUCIDOS: - Nome do mes en galego
___________________________________________________________________________________
*/
use utilidades;
drop function if exists mesGalego ;
delimiter //
create function mesGalego(pMes tinyint(2)) returns char(10)
deterministic
begin
declare vMesLetra char(10) default null;
case pMes
when 1 then set vMesLetra="xaneiro";
when 2 then set vMesLetra="febreiro";
when 3 then set vMesLetra="marzo";
when 4 then set vMesLetra="abril";
when 5 then set vMesLetra="maio";
when 6 then set vMesLetra="xuño";
when 7 then set vMesLetra="xullo";
when 8 then set vMesLetra="agosto";
when 9 then set vMesLetra="setembro";
when 10 then set vMesLetra="outubro";
when 11 then set vMesLetra="novembro";
when 12 then set vMesLetra="decembro";
end case;
return vMesLetra;
end
//
delimiter ;
– Proba do funcionamento da función
select mesGalego(2); #febreiro
select mesGalego(month(curdate())); #mes da data actual
 Tarefa 2.2.
Crea unha función “notaLetra” na base de datos utilidades á que se lle pase como pa-
rámetro a nota numérica (dous enteiros e dous decimais) dun alumno,
e devolva a nota
en letra tendo en conta a seguinte táboa:
Nota numérica Nota en letra
>= 0 < 5 suspenso
>= 5 < 6 aprobado
>= 6 < 7 ben
>= 7 < 9 notable
>= 9 <= 10 sobresaínte
Outro valor erro na nota
 Tarefa 2.3 (Resolta). Crear unha función na base de datos utilidades que pasándolle
como parámetro AS 8 cifras correspondentes ao número do DNI,
devolva a letra que lle
corresponde.
A letra do DNI obtense mediante un algoritmo coñecido como módulo 23. O algo-
ritmo consiste en dividir o número correspondente ao DNI entre 23 e obter o resto da
división enteira. O resultado é un número comprendido entre o 0 e o 22. A cada un destes
números se lles fai corresponder unha letra tendo en conta a seguinte táboa:
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
T R W A G M Y F P D X B N J Z S Q V H L C K E
Non se utilizan AS letras: I,
Ñ,
O,
e U. AS letras I e O se descartan para evitar confu-
sións con outros carácteres,
como 1,
l o 0.
Solución
– Código da función
/*
Tarefa_2_3.sql
___________________________________________________________________________________
NOME RUTINA: letraDni (función)
DATA CREACIÓN: 01/05/2022
AUTOR: Profesor
TAREFA A AUTOMATIZAR: - Obter a letra correspondente a un DNI a partir do algoritmo
coñecido como módulo 23
PARAMETROS REQUERIDOS: - Número enteiro, correspondente ao número dun DNI
RESULTADOS PRODUCIDOS: - Cadea de 1 carácter correspondente a letra do DNI
___________________________________________________________________________________
*/
USE utilidades;
create function letraDni (pDni integer) returns char(1)
deterministic
return substring('TRWAGMYFPDXBNJZSQVHLCKE', pDni % 23 + 1, 1);
– Proba do funcionamento da función
select letraDni(33585123);
 Tarefa 2.4.
Crea unha función “letraNIE” na base de datos utilidades que pasándolle como pará-
metro os 8 primeiros carácteres correspondentes ao Número de Identidade de Estranxeiro
(NIE), devolva a letra que lle corresponde.
Utilízase o mesmo algoritmo que para o DNI, coa diferenza de que o NIE pode em-
pezar por unha letra, polo que hai que engadirlle as seguintes restricións:
– No caso de que o NIE empece pola letra X, se calcula desprezando a X, e utilizando
os 7 díxitos restantes.
– No caso de que o NIE empece pola letra Y, se substitúe a letra Y polo número 1.
– No caso de que o NIE empece pola letra Z, se substitúe a letra Z polo número 2.
– Se empeza por calquera outro carácter devolve un cero.
– Podes axudarte coas funcións left(), right() y concat().
– Proba o funcionamento da función:
select letraNIE('X7128990');
select letraNIE('Y0801462');
select if(letraNIE('30801462')=0,'Erro no NIE',letraNIE('30801462')) as letraNIE;
 Tarefa 2.5.
Crea unha función “ganancias_por_provedor” na base de datos tendabd que pasán-
dolle como parámetro o nome dun provedor, devolva as ganancias que se obterán
coa venta de todos os artigos que temos en stock dese provedor.
select ganancias_por_provedor ('APPLE');