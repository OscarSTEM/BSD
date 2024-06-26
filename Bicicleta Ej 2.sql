DROP SCHEMA IF EXISTS COMPETICION;
CREATE SCHEMA COMPETICION;
USE COMPETICION;

CREATE TABLE CICLISTA (
	DNI CHAR (9) PRIMARY KEY,
	NOMBRE VARCHAR (50),
    NACIONALIDAD VARCHAR (40),
    FECHA_NACIMIENTO DATE 
);
CREATE TABLE EQUIPO (
NOMBRE CHAR (50) PRIMARY KEY,
NACIONALIDAD VARCHAR (40),
NOMBRE_DIRECTOR VARCHAR (50)
);
CREATE TABLE PRUEBA (
NOMBRE VARCHAR (30),
ANIO SMALLINT, 
ETAPAS TINYINT, 
KM_TOTALES SMALLINT,
DNI_GANADOR CHAR(9),
PRIMARY KEY (NOMBRE,ANIO),
FOREIGN KEY (DNI_GANADOR) REFERENCES CICLISTA (DNI)
);
CREATE TABLE CICLISTA_PERTENECE_EQUIPO(
DNI_CICLISTA CHAR (9),
NOMBRE_EQUIPO VARCHAR (30),
FECHA_INICIO DATE,
FECHA_FIN DATE, 
PRIMARY KEY (DNI_CICLISTA, NOMBRE_EQUIPO, FECHA_INICIO),
FOREIGN KEY (DNI_CICLISTA) REFERENCES CICLISTA(DNI),
FOREIGN KEY (NOMBRE_EQUIPO)REFERENCES EQUIPO(NOMBRE)
);
CREATE TABLE EQUIPO_PARTICIPA_PRUEBA(
NOMBRE_EQUIPO VARCHAR (50),
NOMBRE_PRUEBA VARCHAR (50),
ANIO_PRUEBA SMALLINT,
PUESTO SMALLINT,
PRIMARY KEY (NOMBRE_EQUIPO, NOMBRE_PRUEBA, ANIO_PRUEBA),
FOREIGN KEY (NOMBRE_EQUIPO) REFERENCES EQUIPO(NOMBRE),
FOREIGN KEY (NOMBRE_PRUEBA, ANIO_PRUEBA) REFERENCES PRUEBA(NOMBRE, ANIO)

);
# -------------- INSERTAR DATOS ----------------------------#
SELECT * FROM CICLISTA; 
INSERT INTO CICLISTA 
VALUES 
("12345678H", "FULANO", "ESPAÑOL", "2000-01-04"),
("78945612J", "MERENGUE", "FRANCES", "2000-01-04"),
("1597534B", "CRACK", "INGLES", "2000-01-04");
INSERT INTO EQUIPO VALUES 
("ALPINO", "SUIZA", "ADOLFO");
SELECT * FROM PRUEBA;
INSERT INTO PRUEBA VALUES 
("VUELTA", 2002 , 56, 4000, NULL),
("VUELTA", 2003, 56, 4000, "12345678H");
SELECT * FROM CICLISTA_PERTENECE_EQUIPO;
INSERT INTO CICLISTA_PERTENECE_EQUIPO VALUES
("12345678H", "ALPINO","2008-01-01","2008-12-31");
SELECT * FROM EQUIPO_PARTICIPA_PRUEBA;
INSERT INTO EQUIPO_PARTICIPA_PRUEBA VALUES 
("ALPINO","VUELTA",2003,5);

