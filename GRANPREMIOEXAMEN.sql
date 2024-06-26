DROP SCHEMA IF EXISTS COCHES;
CREATE SCHEMA COCHES;
USE COCHES;
CREATE TABLE INTEGRANTE(
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR (30),
EDAD INT,
SALARIO DECIMAL (9,2), 
FOREIGN KEY (NOMBRE_EQUIPO) REFERENCES EQUIPO(NOMBRE)
);
CREATE TABLE EQUIPO(
NOMBRE VARCHAR (30) PRIMARY KEY, 
MOTOR VARCHAR (50), 
PATROCINADOR_PRINCIPAL VARCHAR (50), 
ID_INTEGRANTE INT,
FOREIGN KEY (ID_INTEGRANTE) REFERENCES INTEGRANTE(ID)
);
CREATE TABLE MECANICO(
ID INT PRIMARY KEY AUTO_INCREMENT,
HORAS_FORMACION DATE, 
FUNCION VARCHAR(50)
);
CREATE TABLE INGENIERO(
ID INT PRIMARY KEY AUTO_INCREMENT,
AÑO_EXPERIENCIA DATETIME, 
ROL VARCHAR (50)
);
CREATE TABLE PILOTO(
ID INT PRIMARY KEY AUTO_INCREMENT, 
TITULOS_CAMPEON VARCHAR (50),
CARRERAS_GANADAS INT,
POLES_LOGRADAS INT
);
CREATE TABLE TEMPORADA(
ID INT PRIMARY KEY AUTO_INCREMENT, 
ANIO DATE, 
FECHA_INICIO DATETIME,
FECHA_FIN DATETIME
);
CREATE TABLE COCHE(
ID INT PRIMARY KEY AUTO_INCREMENT,
PESO FLOAT,
ACELERACION_MAXIMA INT, 
ID_INGENIERO INT, 
ID_PILOTO INT,
FOREIGN KEY (ID_PILOTO) REFERENCES PILOTO(ID),
FOREIGN KEY (ID_INGENIERO) REFERENCES INGENIERO(ID)
);
CREATE TABLE GRAN_PREMIO(
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR (30),
CIRCUITO VARCHAR (50),
FECHA DATETIME, 
HORA_CARRERA TIME
);
CREATE TABLE EQUIPO_PARTICIPA_TEMPORADA(
NOMBRE_EQUIPO VARCHAR (50),
ID_TEMPORADA INT,
PRIMARY KEY(NOMBRE_EQUIPO, ID_TEMPORADA),
FOREIGN KEY (NOMBRE_EQUIPO) REFERENCES EQUIPO(NOMBRE),
FOREIGN KEY(ID_TEMPORADA) REFERENCES TEMPORADA(ID)
);
CREATE TABLE TEMPORADA_DIVIDE_GRAN_PREMIO(
ID_TEMPORADA INT,
ID_GRAN_PREMIO INT,
PRIMARY KEY (ID_TEMPORADA, ID_GRAN_PREMIO),
FOREIGN KEY (ID_TEMPORADA) REFERENCES TEMPORADA(ID),
FOREIGN KEY(ID_GRAN_PREMIO) REFERENCES GRAN_PREMIO(ID)
);
CREATE TABLE MECANICO_MANTIENE_COCHE(
ID_MECANICO INT, 
ID_COCHE INT,
PRIMARY KEY (ID_MECANICO, ID_COCHE),
FOREIGN KEY (ID_MECANICO) REFERENCES MECANICO(ID),
FOREIGN KEY (ID_COCHE) REFERENCES COCHE(ID)
);
PILOTO_COMPITE_GRAN_PREMIO: (ID_PILOTO, ID_GRAN_PREMIO)