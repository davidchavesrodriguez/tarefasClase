USE A22DavidCR_pinacoteca;
CREATE TABLE IF NOT EXISTS Pinacoteca (
	NomePinacoteca char(20) NOT NULL UNIQUE,
	CidadePinacoteca char(20) NOT NULL,
	Direccion char(20) NOT NULL,
	Superficie int NOT NULL,
	PRIMARY KEY (NomePinacoteca)
);

CREATE TABLE IF NOT EXISTS Cadro (
	CodigoCadro int NOT NULL UNIQUE,
	NomeCadro char(20) NOT NULL,
	Medidas int NOT NULL,
	Fecha date NOT NULL,
	Tecnica char(20) NOT NULL,
	NomePinacoteca char(20) NOT NULL UNIQUE,
	IDPintor int NOT NULL UNIQUE,
	CONSTRAINT fk_cadroPinacoteca FOREIGN KEY (NomePinacoteca) REFERENCES Pinacoteca (NomePinacoteca),
	CONSTRAINT fk_cadroPintor FOREIGN KEY (IDPintor) REFERENCES Pintor (IDPintor),
	PRIMARY KEY (CodigoCadro)
);

CREATE TABLE IF NOT EXISTS Pintor (
	IDPintor int NOT NULL UNIQUE,
	NomePintor char(20) NOT NULL,
	PaisPintor char(20) NOT NULL,
	CidadePintor char(20) NOT NULL,
	NacementoPintor date NOT NULL,
	FalecementoPintor date,
	IDEscola int NOT NULL UNIQUE,
	IDMaestro int UNIQUE,
	NomeMaestro char(20) UNIQUE,
	CONSTRAINT fk_pintorEscola FOREIGN KEY (IDEscola) REFERENCES Escola (IDEscola),
	CONSTRAINT fk_pintorMaestro FOREIGN KEY (IDMaestro) REFERENCES Pintor (IDPintor),
	PRIMARY KEY (IDPintor)
);

ALTER TABLE Merchant_Pending_Functions Modify NumberOfLocations int NULL;

CREATE TABLE IF NOT EXISTS Escola (
	IDEscola int NOT NULL UNIQUE,
	NomeEscola char(20) NOT NULL,
	PRIMARY KEY (IDEscola)
);

CREATE TABLE IF NOT EXISTS Mecenas (
	IDMecenas int NOT NULL UNIQUE,
	NomeMecenas char(20) NOT NULL,
	PaisMecenas char(20) NOT NULL,
	CidadeMecenas char(20) NOT NULL,
	NacementoMecenas date NOT NULL,
	IDPintor int NOT NULL UNIQUE,
	PRIMARY KEY (IDMecenas)
);

CREATE TABLE IF NOT EXISTS Ten (
	IDMecenasIDPintor int NOT NULL UNIQUE,
	IDMecenas int NOT NULL UNIQUE,
	IDPintor int NOT NULL UNIQUE,
	PRIMARY KEY (IDMecenasIDPintor),
	CONSTRAINT fk_tenMecenas FOREIGN KEY (IDMecenas) REFERENCES Mecenas (IDMecenas),
	CONSTRAINT fk_tenPintor FOREIGN KEY (IDPintor) REFERENCES Pintor (IDPintor)
);

-- Tablas rematadas
-- Primeiras columnas de datos

INSERT INTO Escola (IDEscola, NomeEscola)
VALUES ('0', 'Proba')

INSERT INTO Pintor (IDPintor, NomePintor, PaisPintor, CidadePintor, NacementoPintor, IDEscola, IDMaestro, NomeMaestro)
VALUES ('0', 'Marcos Castro', 'Andorra', 'Andorra la Vella', '1984-05-27', '0', '0', 'David Chaves');

INSERT INTO Pinacoteca (NomePinacoteca, CidadePinacoteca, Direccion, Superficie)
VALUES ('Cadrolandia', 'Boiro', 'Avenida Barraña, 30', '999');

INSERT INTO Cadro (CodigoCadro, NomeCadro, Medidas, Fecha, Tecnica, NomePinacoteca, IDPintor)
VALUES ('0', 'MarcosQuente', '777', '2000-02-20', 'IA', 'Cadrolandia', '0');

INSERT INTO Mecenas (IDMecenas, NomeMecenas, PaisMecenas, CidadeMecenas, NacementoMecenas, IDPintor)
VALUES ('0', 'Jose Juan', 'Antigua y Barbudas', 'Barba Vieja', '1999-09-09', '0');

INSERT INTO Ten (IDMecenasIDPintor, IDMecenas, IDPintor)
VALUES ('0', '0', '0');

-- Segunda columna de datos

INSERT INTO Escola (IDEscola, NomeEscola)
VALUES ('1', 'Maxia');

INSERT INTO Pintor (IDPintor, NomePintor, PaisPintor, CidadePintor, NacementoPintor, IDEscola, IDMaestro, NomeMaestro)
VALUES ('1', 'Marcos Castro', 'Italia', 'Nápoles', '2002-04-29', '1', '1', 'Luisiño');

INSERT INTO Pinacoteca (NomePinacoteca, CidadePinacoteca, Direccion, Superficie)
VALUES ('VidaSoa', 'Santiago', 'Romero Donallo, 59', '25');

INSERT INTO Cadro (CodigoCadro, NomeCadro, Medidas, Fecha, Tecnica, NomePinacoteca, IDPintor)
VALUES ('1', 'A vida dura', '100', '2022-11-17', 'Realismo', 'VidaSoa', '1');

INSERT INTO Mecenas (IDMecenas, NomeMecenas, PaisMecenas, CidadeMecenas, NacementoMecenas, IDPintor)
VALUES ('1', 'Mario Bros', 'Japón', 'Nara', '1977-07-07', '1');

INSERT INTO Ten (IDMecenasIDPintor, IDMecenas, IDPintor)
VALUES ('1', '1', '1');

-- Columna datos clase

INSERT INTO Escola (IDEscola, NomeEscola)
VALUES ('2', 'E1'), ('3', 'E2'), ('4', 'E3');

INSERT INTO Pinacoteca (NomePinacoteca, CidadePinacoteca, Direccion, Superficie)
VALUES ('Museo1', 'c1', 'd1', '1'), ('Museo2', 'c1', 'd2', '2'), ('Museo3', 'c2', 'd3', '3');

INSERT INTO Pintor (IDPintor, NomePintor, PaisPintor, CidadePintor, NacementoPintor, FalecementoPintor, IDEscola, IDMaestro, NomeMaestro)
VALUES ('2', 'P1', 'p1', 'c1', '2022-12-12','1962-05-23', '2', '2', 'P3');

INSERT INTO Pintor (IDPintor, NomePintor, PaisPintor, CidadePintor, NacementoPintor, IDMaestro, NomeMaestro)
VALUES ('3', 'P2', 'p1', 'c2', '1969-04-23', '3', 'P1');

INSERT INTO Pintor (IDPintor, NomePintor, PaisPintor, CidadePintor, NacementoPintor, IDEscola)
VALUES ('4', 'P3', 'p1', 'c2', '1936-12-12', '3');

INSERT INTO Cadro (CodigoCadro, NomeCadro, Medidas, Fecha, Tecnica, NomePinacoteca, IDPintor)
VALUES ('1', 'A vida dura', '100', '2022-11-17', 'Realismo', 'VidaSoa', '1');

INSERT INTO Mecenas (IDMecenas, NomeMecenas, PaisMecenas, CidadeMecenas, NacementoMecenas, IDPintor)
VALUES ('1', 'Mario Bros', 'Japón', 'Nara', '1977-07-07', '1');

INSERT INTO Ten (IDMecenasIDPintor, IDMecenas, IDPintor)
VALUES ('1', '1', '1');



































