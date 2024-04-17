USE SEGUROS;

# EJ1 - CREA UN INDICE  TIPO HASH Y UNICO PARA LA MATRICULA DE LOS VEHICULOS
DROP INDEX MATRICULAS_IX ON VEHICULO;
CREATE UNIQUE INDEX MATRICULA_IX USING HASH ON VEHICULO(MATRICULA);

# EJ2 - CREA UN INDICE PARA LA FECHA DE PERMISO Y DE NACIMIENTO DE LOS CLIENTES
CREATE INDEX FECHA_NACIMIENTO_IX ON CLIENTE(FECHA_NACIMIENTO);
CREATE INDEX FECHA_PERMISO_IX ON CLIENTE(FECHA_PERMISO);
# Claves primarias (Primary Keys): La clave primaria es un tipo especial de índice único que se utiliza para identificar 
#de manera única cada fila en una tabla. Se utiliza la sentencia ALTER TABLE para agregar una clave primaria a una tabla. 

# Por ejemplo:
ALTER TABLE table_name ADD PRIMARY KEY (column_name);
# Claves externas (Foreign Keys): Aunque no son índices en sí mismos, las claves externas son importantes para mantener 
#la integridad referencial entre tablas. Se crean utilizando la sentencia ALTER TABLE y 
#estableciendo una restricción de clave externa. 

# Por ejemplo:
#Cambiar o descartar un valor predeterminado de columna.
ALTER TABLE table_name ADD FOREIGN KEY (column_name) REFERENCES other_t;


USE WORLD;
# EJ3 - INDICA QUE LA COLUMNA CAPITAL ES UNA CLAVE EXTERNA
SELECT * FROM COUNTRY;
ALTER TABLE COUNTRY ADD FOREIGN KEY (CAPITAL) REFERENCES CITY(ID);
# EJ4 - AÑADE UN INDICE A LAS COLUMNAS DE REGION Y CONTINENTE
CREATE INDEX COUNTRY_REGION_IX ON COUNTRY(REGION);
CREATE INDEX COUNTRY_CONTINENT_IX ON COUNTRY(CONTINENT);
# EJ5 - AÑADE UN INDICE UNICO AL NOMBRE DE LOS PAISES
CREATE UNIQUE INDEX NAME_IX USING HASH ON COUNTRY(NAME);