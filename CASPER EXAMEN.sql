DROP SCHEMA IF EXISTS CASPER;
CREATE SCHEMA CASPER;
USE CASPER;
CREATE TABLE GRUPO(
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR (30) NOT NULL,
FECHA_FORMACION DATETIME,
FECHA_DISOLUCION DATETIME,
ID_CAZAFANTASMA INT,
FOREIGN KEY (ID_CAZAFANTASMA) REFERENCES CAZAFANTASMA(ID),
CONSTRAINT FECHA_DISOLUCION CHECK (FECHA_DISOLUCION>FECHA_FORMACION)
);
CREATE TABLE CAZAFANTASMA(
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR (30) NOT NULL, 
ANIOS_EXPERIENCIA DATE,
ESPECIALIZACION VARCHAR (50),
CONSTRAINT ANIOS_EXPERIENCIA CHECK (ANIOS_EXPERIENCIA>0)
);
CREATE TABLE EQUIPO(
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR (50) NOT NULL UNIQUE,
DIFICULTAD_USO VARCHAR (50) DEFAULT "MEDIA",
FOTO BLOB, 
DESCRIPCION MEDIUMTEXT
);
CREATE TABLE FANTASMA(
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR (50) NOT NULL UNIQUE,
EDAD INT, 
TIPO VARCHAR (20), 
DESCRIPCION MEDIUMTEXT,
ID_CAZAFANTASMA INT,
FOREIGN KEY (ID_CAZAFANTASMA)REFERENCES CAZAFANTASMA(ID),
CONSTRAINT EDAD_FANTASMA_1_1000 CHECK (EDAD BETWEEN 1 AND 1000)
);
CREATE TABLE PERSONA(
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR (50) NOT NULL,
FECHA_NACIMIENTO DATETIME,
FECHA_DEFUNCION DATETIME
);
CREATE TABLE GRUPO_PERTENECE_CAZAFANTASMA(
FUNCION VARCHAR (50),
ID_GRUPO INT,
ID_CAZAFANTASMA INT,
PRIMARY KEY (ID_GRUPO,ID_CAZAFANTASMA, FUNCION),
FOREIGN KEY (ID_GRUPO)REFERENCES GRUPO(ID),
FOREIGN KEY (ID_CAZAFANTASMA) REFERENCES CAZAFANTASMA(ID)
);
CREATE TABLE CAZAFANTASMA_MANEJA_EQUIPO(
ID_CAZAFANTASMA INT,
ID_EQUIPO INT,
PRIMARY KEY (ID_CAZAFANTASMA,ID_EQUIPO),
FOREIGN KEY (ID_CAZAFANTASMA)REFERENCES CAZAFANTASMA(ID),
FOREIGN KEY (ID_EQUIPO) REFERENCES GRUPO(ID)
);
CREATE TABLE FANTASMA_ATRAPA_CAZAFANTASMA(
FECHA DATETIME,
ID_CAZAFANTASMA INT,
ID_FANTASMA INT,
PRIMARY KEY (FECHA, ID_CAZAFANTASMA,ID_FANTASMA),
FOREIGN KEY (ID_CAZAFANTASMA)REFERENCES CAZAFANTASMA(ID),
FOREIGN KEY (ID_FANTASMA) REFERENCES FANTASMA(ID)
);
CREATE TABLE GRUPO_INVESTIGA_FANTASMA(
ID_GRUPO INT,
ID_FANTASMA INT,
PRIMARY KEY (ID_GRUPO, ID_FANTASMA),
FOREIGN KEY (ID_GRUPO)REFERENCES GRUPO(ID),
FOREIGN KEY (ID_FANTASMA) REFERENCES FANTASMA(ID)
);
CREATE TABLE FANTASMA_AVISTA_PERSONA(
 LUGAR VARCHAR (50),
 FECHA DATETIME,
 ID_PERSONA INT,
 ID_FANTASMA INT,
PRIMARY KEY (LUGAR, FECHA, ID_PERSONA, ID_FANTASMA),
FOREIGN KEY (ID_PERSONA)REFERENCES PERSONA(ID),
FOREIGN KEY (ID_FANTASMA) REFERENCES FANTASMA(ID)
 );

