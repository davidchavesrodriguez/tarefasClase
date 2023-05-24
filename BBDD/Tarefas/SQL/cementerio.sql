USE A22DavidCR_cementerio
CREATE TABLE IF NOT EXISTS Empleado(
	DNIEmpleado char(10) NOT NULL UNIQUE,
	NSS char(12) NOT NULL UNIQUE,
	ApelidosEmpleado char(30) NOT NULL,
	DireccionEmpleado char(30) NOT NULL,
	TelefonoEmpleado int NOT NULL,
	Salario float NOT NULL,
	Antiguedade int NOT NULL,
	PRIMARY KEY (DNIEmpleado)
);

CREATE TABLE IF NOT EXISTS Administrativo(
	DNIAdministrativo char(10) NOT NULL UNIQUE,
	CONSTRAINT fk_administrativoEmpleado FOREIGN KEY (DNIAdministrativo) REFERENCES Empleado (DNIEmpleado)
);

CREATE TABLE IF NOT EXISTS Enterrador(
	DNIEnterrador char(10) NOT NULL UNIQUE,
	CONSTRAINT fk_enterradorEmpleado FOREIGN KEY (DNIEnterrador) REFERENCES Empleado (DNIEmpleado)
);

CREATE TABLE IF NOT EXISTS Jardinero(
	DNIJardinero char(10) NOT NULL UNIQUE,
	CONSTRAINT fk_jardineroEmpleado FOREIGN KEY (DNIJardinero) REFERENCES Empleado (DNIEmpleado)
);

CREATE TABLE IF NOT EXISTS Factura(
	IDFactura int NOT NULL UNIQUE AUTO_INCREMENT,
	FechaFactura date NOT NULL,
	PrezoFactura double NOT NULL,
	DNIAdministrativo char(10) NOT NULL, 
	PRIMARY KEY (IDFactura),
	CONSTRAINT fk_facturaAdministrativo FOREIGN KEY (DNIAdministrativo) REFERENCES Administrativo (DNIAdministrativo)
);

CREATE TABLE IF NOT EXISTS Falecido(
	DNIFalecido char(10) NOT NULL UNIQUE,
	NomeFalecido char(20) NOT NULL,
	ApelidosFalecido char(30) NOT NULL,
	NacementoFalecido date NOT NULL,
	FalecementoFalecido date NOT NULL,
	DNIEnterrador char(10) NOT NULL,
	IDTumba int NOT NULL UNIQUE AUTO_INCREMENT,
	PRIMARY KEY (DNIFalecido),
	CONSTRAINT fk_falecidoEnterrador FOREIGN KEY (DNIEnterrador) REFERENCES Enterrador (DNIEnterrador),
	CONSTRAINT fk_falecidoFamiliar FOREIGN KEY (DNIFalecido) REFERENCES Familiar (DNIFamiliar),
	CONSTRAINT fk_falecidoTumba FOREIGN KEY (IDTumba) REFERENCES Tumba (IDTumba)
);

CREATE TABLE IF NOT EXISTS Sector(
	IDSector int NOT NULL UNIQUE AUTO_INCREMENT,
	CapacidadSector int NOT NULL,
	Extension int NOT NULL,
	DNIJardinero char(10) NOT NULL,
	PRIMARY KEY (IDSector),
	CONSTRAINT fk_sectorJardinero FOREIGN KEY (DNIJardinero) REFERENCES Jardinero (DNIJardinero)
);

CREATE TABLE IF NOT EXISTS Tumba(
	IDTumba int NOT NULL UNIQUE AUTO_INCREMENT,
	PRIMARY KEY (IDTumba),
	CONSTRAINT fk_tumbaSector FOREIGN KEY (IDTumba) REFERENCES Sector (IDSector)
);

CREATE TABLE IF NOT EXISTS Familiar(
	DNIFamiliar char(10) NOT NULL UNIQUE,
	TelefonoFamiliar int NOT NULL UNIQUE,
	NomeFamiliar char(20) NOT NULL,
	ApelidosFamiliar char(30) NOT NULL,
	IDFactura int NOT NULL UNIQUE AUTO_INCREMENT,
	PRIMARY KEY (DNIFamiliar),
	CONSTRAINT fk_familiarFactura FOREIGN KEY (IDFactura) REFERENCES Factura (IDFactura)
);

CREATE TABLE IF NOT EXISTS Panteon(
	IDPanteon int NOT NULL UNIQUE AUTO_INCREMENT,
	InscripcionPanteon char(50),
	CapacidadPanteon int NOT NULL,
	DNIFamiliar char(10) NOT NULL UNIQUE, 
	CONSTRAINT fk_panteonTumba FOREIGN KEY (IDPanteon) REFERENCES Tumba (IDTumba),
	CONSTRAINT fk_panteonFamiliar FOREIGN KEY (DNIFamiliar) REFERENCES Familiar (DNIFamiliar)
);

CREATE TABLE IF NOT EXISTS Nicho(
	IDNicho int NOT NULL UNIQUE AUTO_INCREMENT,
	InscripcionNicho char(50),
	AlturaNicho int NOT NULL,
	CONSTRAINT fk_nichoTumba FOREIGN KEY (IDNicho) REFERENCES Tumba (IDTumba)
);

CREATE TABLE IF NOT EXISTS FosaComun(
	IDFosa int NOT NULL UNIQUE AUTO_INCREMENT,
	CapacidadFosa int NOT NULL,
	CONSTRAINT fk_fosaTumba FOREIGN KEY (IDFosa) REFERENCES Tumba (IDTumba)
);
































