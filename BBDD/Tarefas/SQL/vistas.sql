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
FROM departamento # créase a vista sobre unha que xa existe
WHERE id_provincia = 27
WITH LOCAL CHECK OPTION;


USE A22DavidCR_traballadores;

-- Tarefa 1.1 Crear unha vista sen CHECK OPTION para os empregados da em-
-- presa cos datos: número de empregado, nome, extensión telefónica, número e nome do
-- departamento no que traballa. Utilizar a vista para:
CREATE OR REPLACE VIEW Empregados 
AS
SELECT e.empNumero AS "Número Empregado", e.empNome AS Nome, e.empExtension AS "Extensión Telefónica", 
e.empDepartamento AS "Número Departamento", d.depNome AS "Nome Departamento"
FROM empregado e
JOIN departamento d ON d.depNumero = e.empDepartamento;

-- – Inserir os datos dun empregado no departamento 110.
INSERT INTO Empregados (Nome, `Extensión Telefónica`, `Número Departamento`)
VALUES ('Deigo Saeone', '981' , '110'); # Funciona

-- – Inserir os datos dun empregado no departamento 5.
INSERT INTO Empregados (Nome, `Extensión Telefónica`, `Número Departamento`)
VALUES ('Diego Rianxoven', '555' , '5'); # FALLA

-- – Inserir os datos dun empregado co nome NULL.
INSERT INTO Empregados (Nome, `Extensión Telefónica`, `Número Departamento`)
VALUES (NULL, '981' , '110'); # FALLA
-- – Inserir os datos dun empregado sen nome.
INSERT INTO Empregados (`Extensión Telefónica`, `Número Departamento`)
VALUES ('981' , '110'); # FALLA
-- – Consultar os datos ordenados alfabeticamente polo nome do empregado. 
SELECT *
FROM Empregados
ORDER BY Nome;



-- Tarefa 1.2 (Resolta). Crear unha vista con CHECK OPTION asociada á táboa departa-
-- mentos, que realiza as seguintes comprobacións:
-- – Existe o empregado que é director.
-- – Existe o centro do que depende.
-- – O presuposto está entre 100000 e 2000000 euros.
-- – O tipo de director só admite os valores P ou F.

CREATE OR REPLACE VIEW Directores
AS
SELECT *
FROM departamento
WHERE depDirector IN (SELECT empNumero FROM empregado)
	AND depCentro IN (SELECT cenNumero FROM centro)
	AND depPresuposto BETWEEN 100000 AND 200000
	AND deptipoDirector IN ('P', 'F')
WITH CHECK OPTION;

-- Utilizar a vista para consultar os datos e comprobar se é posible utilizala con INSERT,
-- DELETE ou UPDATE
SELECT * 
FROM Directores; # Funciona :)

SELECT *
FROM information_schema.VIEWS; # A columna IS_UPDATABLE ten o valor YES. Si se poden usar



-- Sobre a base de datos tendasBD
USE A22DavidCR_tendaB;

-- Tarefa 1.3. Crear unha vista sen CHECK OPTION cos seguintes datos, re-
-- feridos aos artigos: código, nome e prezo do artigo e número de provedor que o submi-
-- nistra.
CREATE OR REPLACE VIEW Artículos 
AS
SELECT art_codigo AS "Código artigo", art_nome AS "Nome artigo", art_pv AS "Precio", art_provedor AS "Número proveedor" 
FROM artigos;

-- Antes de inserir os datos modifica a táboa artigos para que non dea erro cando non inse-
-- rimos valores en todos os campos e non teñen valores por defecto:
ALTER TABLE artigos ALTER COLUMN art_pv SET DEFAULT 0.0;
ALTER TABLE artigos ALTER COLUMN art_alta SET DEFAULT '0000-00-00';

-- Utilizar a vista para:
-- – Inserir os datos do artigo '4065091' que existe na táboa artigos, subministrado polo
-- provedor 1 que existe na táboa de provedores. Comproba se a inserción é posible.
INSERT INTO Artículos


-- – Inserir os datos do artigo '0001122' que non existe na táboa artigos, subministrado
-- polo provedor 100 que non existe na táboa de provedores. Comproba se a inserción é
-- posible.

-- – Inserir os datos do artigo '0001122' que non existe na táboa artigos, subministr ado
-- polo provedor 1 que existe na táboa de provedores. Comproba se a inserción é posible.

-- – Consultar os datos ordenados alfabeticamente polo nome do artigo.






