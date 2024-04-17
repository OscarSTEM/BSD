DROP SCHEMA IF EXISTS ESPECIES;
CREATE SCHEMA ESPECIES;
USE ESPECIES;
#RESTRICCIONES 
# DESCRIPCION Y NOMRE COMUN NO PUEDEN SER NULOS
#EL CLIMA POR DEFECTO ES "SOLEADO"
# EL TIEMPO DEL RECORRIDO DEBE SER MAYOR DE 30 MINUTOS
# LA LONGITUD DEL RECORRIDO NO PUEDE SER NEGATIVA
#EL INDICE DE VULNERABILIDAD ES UN NUMERO ENTRE 0 Y 10 
#Especie: (N.CIENTIFICO, DESCRIPCION, FOTO)
CREATE TABLE ESPECIE(
NOMBRE_CIENTIFICO VARCHAR (50) PRIMARY KEY NOT NULL,
DESCRIPCION VARCHAR (50) NOT NULL,
FOTO BLOB
);
INSERT INTO ESPECIE VALUES
("Gorilla beringei", "CUADRUPEDO","");
SELECT * FROM ESPECIE; 
#N.COMUN: (N.CIENTIFICO_ESPECIE)
CREATE TABLE ESPECIE_TIENE_NOMBRE_COMUN(
NOMBRE_CIENTIFICO VARCHAR (50) PRIMARY KEY,
NOMBRE_COMUN VARCHAR (50) NOT NULL
);
INSERT INTO ESPECIE_TIENE_NOMBRE_COMUN VALUES
("Gorilla beringei","GORILA");
SELECT * FROM ESPECIE_TIENE_NOMBRE_COMUN;
#RECORRIDO(COD, LONGITUD, TIEMPO, MAX VISITANTES)
CREATE TABLE RECORRIDO(
CODIGO INT PRIMARY KEY, 
LONGITUD DECIMAL (9,2) UNSIGNED,
TIEMPO TIME, 
MAXIMO_VISITANTES INT,
CONSTRAINT TIEMPO_MAYOR CHECK (TIEMPO>"00:30:00")
);
INSERT INTO RECORRIDO VALUES
("123456789", "105","00:45:00","50");
SELECT * FROM RECORRIDO;
#HABITAT(NOMBRE, CLIMA, VEGETACION, COD_RECORRIDO)
CREATE TABLE HABITAT(
NOMBRE VARCHAR (50) PRIMARY KEY,
CLIMA CHAR (20),
VEGETACION VARCHAR (50), 
CODIGO_RECORRIDO INT,
FOREIGN KEY(CODIGO_RECORRIDO) REFERENCES RECORRIDO(CODIGO)
);
INSERT INTO HABITAT VALUES
("SELVA", "SOLEADO", "ABUNDANTE", "123456789");
SELECT * FROM HABITAT; 
#ESPECIE_VIVE_HABITAT: ID.VULNERABILIDAD
CREATE TABLE ESPECIE_VIVE_HABITAT(
INDICE_VULNERABILIDAD TINYINT,
NOMBRE_HABITAT VARCHAR(50),
NOMBRE_CIENTIFICO VARCHAR (50),
PRIMARY KEY (NOMBRE_CIENTIFICO, NOMBRE_HABITAT),
FOREIGN KEY (NOMBRE_CIENTIFICO) REFERENCES ESPECIE(NOMBRE_CIENTIFICO),
FOREIGN KEY (NOMBRE_HABITAT) REFERENCES HABITAT(NOMBRE),
CONSTRAINT INDICE_VULNERABILIDAD_0_10 CHECK (INDICE_VULNERABILIDAD BETWEEN 0 AND 10)
);
INSERT INTO ESPECIE_VIVE_HABITAT VALUES
("123456789", "SELVA", "GORILLA BERINGEI");
SELECT * FROM ESPECIE_VIVE_HABITAT
#--------------------------------INSERTAR DATOS--------------------------------------------

