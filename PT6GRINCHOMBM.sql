DROP SCHEMA IF EXISTS NAVIDAD;
CREATE SCHEMA NAVIDAD;
USE NAVIDAD;
CREATE TABLE QUIEN(
ID INT PRIMARY KEY AUTO_INCREMENT, 
NOMBRE VARCHAR (30),
EDAD INT
);
INSERT INTO QUIEN VALUES
("1","Jose","22"),
("2","Paco","25");
SELECT * FROM QUIEN;

CREATE TABLE QUIEN_DE_VILLAQUIEN(
DIRECCION VARCHAR (50),
OFICIO VARCHAR (50), 
ID_QUIEN INT,
 PRIMARY KEY(ID_QUIEN),
FOREIGN KEY (ID_QUIEN) REFERENCES QUIEN(ID)
);
INSERT INTO QUIEN_DE_VILLAQUIEN VALUES
("AV CADIZ","PESCADOR","1");
SELECT * FROM QUIEN;
CREATE TABLE EL_GRINCH(
NOMBRE_MASCOTA VARCHAR (30) UNIQUE,
COLOR_PELO BOOLEAN UNIQUE,
ID_QUIEN INT AUTO_INCREMENT,
PRIMARY KEY (ID_QUIEN),
FOREIGN KEY (ID_QUIEN) REFERENCES QUIEN(ID)
);
INSERT INTO EL_GRINCH VALUES
("Max","Verde","1");
SELECT * FROM EL_GRINCH;


CREATE TABLE REGALO(
ID INT PRIMARY KEY,
NOMBRE VARCHAR (50),
PRECIO DECIMAL (9,2)
);
INSERT INTO REGALO VALUES
("1","Jose","50"),
("2","PACO","30");
SELECT * FROM REGALO;

CREATE TABLE OBJETO(
PESO DECIMAL (9,2),
MATERIAL VARCHAR (30),
ID_REGALO INT,
PRIMARY KEY (ID_REGALO),
FOREIGN KEY (ID_REGALO) REFERENCES REGALO(ID)
);
INSERT INTO OBJETO VALUES
("30","PLASTICO","1");
SELECT * FROM OBJETO;

CREATE TABLE EXPERIENCIA(
DURACION TIME,
UBICACION VARCHAR (50), 
FECHA_DE_CADUCIDAD DATETIME,
ID_REGALO INT,
PRIMARY KEY(ID_REGALO),
FOREIGN KEY (ID_REGALO) REFERENCES REGALO(ID)
);
INSERT INTO EXPERIENCIA VALUES
("60:00","AV QUINTERO","2050-05-05","1");
SELECT * FROM EXPERIENCIA;


CREATE TABLE ELECTRONICA(
BATERIA VARCHAR (50), 
ID_REGALO INT,
PRIMARY KEY(ID_REGALO),
FOREIGN KEY (ID_REGALO) REFERENCES REGALO(ID)
);
INSERT INTO ELECTRONICA VALUES
("LITIO","1");
SELECT * FROM ELECTRONICA;


CREATE TABLE JUGUETE_PERRO(
TAMAÑO MEDIUMTEXT, 
DURABILIDAD TIME,
ID_REGALO INT,
PRIMARY KEY (ID_REGALO),
FOREIGN KEY (ID_REGALO) REFERENCES REGALO(ID)
);
INSERT INTO JUGUETE_PERRO VALUES
("MEDIANO","2","1");
SELECT * FROM JUGUETE_PERRO;


CREATE TABLE QUIEN_DE_VILLAQUIEN_RECIBE_REGALO(
FECHA_HORA DATETIME,
 ID_QUIEN INT,
 ID_REGALO INT,
 PRIMARY KEY (ID_QUIEN,ID_REGALO),
 FOREIGN KEY (ID_QUIEN) REFERENCES QUIEN(ID),
 FOREIGN KEY (ID_REGALO) REFERENCES REGALO(ID)
 );
 INSERT INTO QUIEN_DE_VILLAQUIEN_RECIBE_REGALO VALUES
("2023-11-27 15:50:00","1","1");
SELECT * FROM QUIEN_DE_VILLAQUIEN_RECIBE_REGALO;
 
 
CREATE TABLE EL_GRINCH_ROBA_REGALO(
ID_QUIEN INT, 
ID_REGALO INT,
PRIMARY KEY(ID_REGALO, ID_QUIEN),
FOREIGN KEY (ID_QUIEN) REFERENCES QUIEN(ID),
FOREIGN KEY (ID_REGALO) REFERENCES REGALO(ID)
);
INSERT INTO EL_GRINCH_ROBA_REGALO VALUES
("1","1"),
("2","2"),
("3","3");
SELECT * FROM EL_GRINCH_ROBA_REGALO;


CREATE TABLE EL_GRINCH_COMPRA_JUGUETE_PERRO(
ID_QUIEN INT,
ID_REGALO INT,
PRIMARY KEY (ID_QUIEN,ID_REGALO),
FOREIGN KEY (ID_QUIEN) REFERENCES QUIEN(ID),
FOREIGN KEY (ID_REGALO) REFERENCES REGALO(ID)
);
INSERT INTO EL_GRINCH_ROBA_REGALO VALUES
("1","1"),
("2","2");
SELECT * FROM EL_GRINCH_ROBA_REGALO;
