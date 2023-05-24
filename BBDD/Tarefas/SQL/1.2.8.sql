-- TAREFA 5.1

-- Creamos tabla "Empregados"
CREATE TABLE Empregados(
	nome varchar(20),
	PRIMARY KEY (nome)
)

-- Creamos tabla "Alumnos"
CREATE TABLE Alumnos(
	id_alumno integer UNSIGNED NOT NULL AUTO_INCREMENT ,
	nome varchar(20) NOT NULL , 
	apelidos varchar(40) NOT NULL ,
	id_curso integer UNSIGNED NOT NULL ,
	data_matricula date NOT NULL,
	PRIMARY KEY (id_alumno)
)
	
-- Mostramos as tablas existentes
SHOW TABLES;

-- Describimos a tabla "Alumnos"
DESCRIBE Alumnos;

-- Describimos a creación da tabla
SHOW CREATE TABLE Empregados;


-- TAREA 5.2

-- Mostramos tablas almacenadas
SHOW TABLES;

-- Creamos tablas "Fabricantes" e "Alumnos"

CREATE TABLE Fabricantes (
	id_fabricante int NOT NULL,
	nome varchar(20),
	PRIMARY KEY(id_fabricante)
);

CREATE TABLE Artigos (
	id_artigo int NOT NULL,
	nome varchar(20) NOT NULL,
	precio float NOT NULL,
	PRIMARY KEY(id_artigo),
	id_fabricante int NOT NULL,
	CONSTRAINT fk_artigosfabricante FOREIGN KEY(id_fabricante) REFERENCES Fabricantes(id_fabricante) 
	-- Definimos unha foreign key
);


-- TAREA 5.3

CREATE TABLE Fabricante (
	idFabricante char(5) NOT NULL COMMENT "Código que identifica a cada fabricante", -- Incluimos un comentario
	nome varchar(80) NOT NULL,
	PRIMARY KEY (idFabricante)
)	engine = InnoDB; -- Definimos un motor de almacenamento


-- TAREA 5.4

CREATE TABLE Pelicula (
	codPelicula int NOT NULL AUTO_INCREMENT,
	nacionalidade char(15) NOT NULL,
	anoRodaxe date,
	xenero char(10) NOT NULL,
	duracion float UNSIGNED NOT NULL,
	titulo varchar(100) NOT NULL,
	PRIMARY KEY (codPelicula)
);

CREATE TABLE Nacionalidade (
	codNacionalidade int NOT NULL,
	codPelicula int NOT NULL AUTO_INCREMENT,
	nacionalidade varchar(20) NOT NULL,
	CONSTRAINT fk_nacionalidadepelicula FOREIGN KEY(codPelicula) REFERENCES Pelicula(codPelicula),
	PRIMARY KEY (codNacionalidade)
);


-- TAREA 5.5

CREATE TABLE Equipo(
	codEquipo char(9),
	nome char(20) NOT NULL,
	director char(20) NOT NULL,
	urlWeb varchar(50) NOT NULL,
	PRIMARY KEY(codEquipo)
);

CREATE TABLE Ciclista(
	fichaFederativa int NOT NULL,
	dataNacemento date NOT NULL,
	nome char(20) NOT NULL,
	apelidos char(40) NOT NULL,
	PRIMARY KEY(fichaFederativa)
);


-- TAREA 5.5

CREATE TABLE Grupo (
	codGrupo int NOT NULL ,
	nome char(20) NOT NULL,
	cache int NOT NULL,
	dataFormacion date NOT NULL,
	PRIMARY KEY(codGrupo),
	CHECK(cache <= 5000000),
	INDEX idx_grupo_nome (nome)
);

CREATE TABLE Concerto(
	codConcerto int NOT NULL,
	nome char(20) NOT NULL,
	data date NOT NULL,
	aforo int NOT NULL,
	prezo float NOT NULL UNSIGNED,
	PRIMARY KEY(codConcerto)
);

CREATE TABLE Actua(
	
	codGrupo int NOT NULL,
	codConcerto int NOT NULL,
	CONSTRAINT fk_actuaGrupo FOREIGN KEY(codGrupo) REFERENCES Grupo(codGrupo),
	CONSTRAINT fk_actuaConcerto FOREIGN KEY(codConcerto) REFERENCES Concerto(codConcerto)
);




































