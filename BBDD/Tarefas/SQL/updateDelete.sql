USE A22DavidCR_traballadores_modificar_borrar;

/*Tarefa 1.1. Inserir unha fila na táboa centros cos seguintes datos:
Nome columna Valor ou observacións
cenNumero 40
cenNome FRANQUICIA LUGO
cenEnderezo C/ PROGRESO, 8 - LUGO*/
INSERT INTO centro
VALUES (40, 'FRANQUICIA LUGO', 'C/ PROGRESO, 8 - LUGO');


/*? Tarefa 1.2. Inserir na táboa empregado, nunha única sentenza INSERT, as filas cos da-
tos do seguintes empregados.
– Primeiro empregado:
Nome columna Valor ou observacións
empNome BARCIA, ANGELES
empNumero 750
empDepartamento 110
empExtension 25
empDataNacemento 12 de febreiro de 1990
empDataIngreso Hoxe
empSalario 825
empComision 50
empFillos 1
– Segundo empregado:
Nome columna Valor ou observacións
empNome MENDEZ, RICARDO
empNumero 751
empDepartamento 110
empExtension 25
empDataNacemento 22 outubro de 1985
empDataIngreso Fai 15 días
empSalario 900
empComision Descoñecida polo momento
empFillos 0
– Terceiro empregado:
Nome columna Valor ou observacións
empNome BERNARDEZ, LUCIA
empNumero 752
empDepartamento 120
empExtension 45
empDataNacemento 9 de maio de 1992
empDataIngreso Descoñecida. Pendente de facer contrato
empSalario 1200
empComision 150
empFillos 2
– Cuarto empregado:
Nome columna Valor ou observacións
empNome VALIN, EVA
empNumero 753
empDepartamento 100
empExtension 200
empDataNacemento 5 de novembro de 1980
empDataIngreso Hoxe
empSalario 1000
empComision 300
empFillos 1*/
INSERT INTO empregado (empNome, empNumero, empDepartamento, empExtension, empDataNacemento, empDataIngreso, empSalario, empComision, empFillos)
VALUES ('BARCIA, ANGELES', 750, 110, 25, '1990-02-12', CURDATE(), 825, 50, 1),
	('MENDEZ, RICARDO', 751, 110, 25, '1985-10-25', DATE_SUB(CURDATE(), INTERVAL 15 DAY), 900, NULL, 0),
	('BERNARDEZ, LUCIA', 752, 120, 45, '1992-05-09', NULL, 1200, 120, 2),
	('VALIN, EVA', 753, 100, 200, '1980-11-05', CURDATE(), 1000, 300, 1);


/*? Tarefa 1.3. Acórdase aumentar o salario a todos os empregados un 5% e a comisión un
6,5% como consecuencia da revisión do convenio. Facer as modificacións correspon-
dentes na base de datos.*/
UPDATE empregado 
SET empSalario= empSalario * 1.05,
	empComision = empComision * 1.065;


/*? Tarefa 1.4. Cambiarlle a data de ingreso na empresa do empregado número 752, asig-
nándolle a data que corresponde ao día 1 do mes seguinte ao mes actual
(last_day(curdate()) devolve o último día do mes actual).*/
UPDATE empregado 
SET empDataIngreso = '2023-04-01'
WHERE empNumero = 752;

-- lastday?????????????????????

/*? Tarefa 1.5. Aumentar un 2% o salario a todos os empregados do departamento 120.*/
UPDATE empregado 
SET empSalario = empSalario *1.02
WHERE empDepartamento = 120;


/*? Tarefa 1.6. Aumentarlle 50 euros á comisión de todos os empregados que traballen nun
departamento que dependa do centro de traballo que ten por nome 'SEDE CENTRAL'.*/
UPDATE empregado
SET empComision = empComision +50
WHERE empNumero IN (SELECT empNumero
						 FROM empregado e 
						 JOIN departamento d ON e.empDepartamento = d.depNumero 
					     WHERE d.depNome = 'SEDE CENTRAL');

 
/*? Tarefa 1.7. Reducir nun 10% o presuposto anual do departamento que teña o presupos-
to máis alto na actualidadade*/
UPDATE departamento  
SET depPresuposto = depPresuposto *0.9
ORDER BY depPresuposto DESC LIMIT 1;
					    

/*
? Tarefa 1.8. Escribir un script para facer todos os seguintes cambios nos presupostos dos
departamentos pero sen modificar o presuposto total:
– Traspasar 20000 do presuposto do departamento de 'PERSOAL' ao departamento de
PROCESO DE DATOS.
– Reducir en 10000 o presuposto do departamento de 'SECTOR INDUSTRIAL', dos
que 4000 se traspasan ao departamento de 'ORGANIZACION' e 6000 ao departa-
mento de 'DIRECCION COMERCIAL'.
*/



/*? Tarefa 1.9. Borra o empregado co número 380.*/


/*? Tarefa 1.10. Borrar da táboa dos empregados aos que teñan cumpridos os 60 anos.*/


/*? Tarefa 1.11. Escribir unha única sentenza que permita borrar da táboa departamento o
departamento número 121 e da táboa empregado todos os empregados que traballan
nese departamento.*/


/*? Tarefa 1.12. Executar o seguinte script para poder crear unha táboa temporal co nome
empregado_120:
create temporary table empregado_120 like empregado;
Inserir na táboa empregado_120 os datos de todas as filas da táboa empregado que te-
ñan o valor 120 na columna empDepartamento;
Sobre a base de datos tendaBD*/


/*? Tarefa 1.13. Inserir filas na táboa facturas collendo os datos de todos os clientes que
teñan vendas no mes 5 de 2015 sen facturar (ven_factura toma o valor null). As colum-
nas que non se obteñen da táboa clientes, teñen os seguintes valores:
Nome columna Valor ou observacións
fac_numero Valor autoincrementado
fac_mes 5
fac_ano 2015
fac_data A data actual do sistema
fac_importe 0*/


/*? Tarefa 1.14. Inserir na táboa vendas unha fila cos seguintes datos; se existe unha venda
co mesmo id, debe ser substituída por esta:
Nome columna Observacións
ven_id 151
ven_tenda 8
ven_empregado 25
ven_cliente 12
ven_data 10 de xuño de 2015 ás 12:25:00
ven_factura Descoñecida. Aínda non se facturou a venda*/

