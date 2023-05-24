USE A22DavidCR_practicas5;


CREATE VIEW Ricos 
AS
SELECT dni, apelidos, nome, salario_bruto
FROM empregado
WHERE salario_bruto > 30000;


CREATE VIEW v_departamento
AS
SELECT nome, cidade, id_provincia
FROM departamento;


CREATE VIEW departamento_lugo
AS 
SELECT codigo, nome, tipo, id_provincia 
FROM departamento 
WHERE id_provincia = 27;


CREATE OR REPLACE
VIEW departamento_lugo (dl_codigo, dl_nome, dl_tipo, dl_cidade, dl_provincia)
AS
SELECT codigo, nome, tipo, cidade, id_provincia
FROM departamento
WHERE id_provincia = 27
WITH CHECK OPTION;


INSERT INTO departamento_lugo
VALUES (102,'proba local','H','',27);


CREATE VIEW vista_departamento_lugo
AS
SELECT nome, cidade, id_provincia
FROM departamento -- créase a vista sobre unha que xa existe
WHERE id_provincia = 27
WITH LOCAL CHECK OPTION;


USE A22DavidCR_traballadores;

-- Tarefa 1.1 (Resolta). Crear unha vista sen CHECK OPTION para os empregados da em-
-- presa cos datos: número de empregado, nome, extensión telefónica, número e nome do
-- departamento no que traballa. Utilizar a vista para:
CREATE VIEW Empregados 
AS
SELECT e.empNumero AS Número, e.empNome AS Nome, e.empExtension AS "Extensión Telefónica", 
d.depNumero AS "Número Departamento", d.depNome AS "Nome Departamento"
FROM empregado e
JOIN departamento d ON d.depNumero = e.empDepartamento;
-- – Inserir os datos dun empregado no departamento 110.
-- – Inserir os datos dun empregado no departamento 5.
-- – Inserir os datos dun empregado co nome NULL.
-- – Inserir os datos dun empregado sen nome.
-- – Consultar os datos ordenados alfabeticamente polo nome do empregado. 


















