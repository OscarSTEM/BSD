#====================VISTAS======================
USE WORLD;
SELECT * FROM CIUDADES_PAIS;
CREATE VIEW CIUDADES_PAIS AS 
SELECT 
	CI.NAME AS CIUDAD,
	CO.NAME AS PAIS 
    FROM CITY CI 
JOIN COUNTRY CO ON CI.COUNTRYCODE= CO.CODE;

USE SAKILA;
# CREA UNA VISTA QUE MUESTRE EL ID DE LOS ACTORES EL NOMBRE Y LOS APELLIDOS CONCATENADOS 
#Y LA CANTIDAD DE PELICULAS QUE HA HECHO CADA ACTOR. ORDENADO DE MAYOR A MENOR NUM DE PELICULAS
SELECT * FROM ACTOR;
SELECT * FROM FILM_ACTOR;
CREATE VIEW ID_NOMBRE_APELLIDOS AS 
SELECT 
	AC.ACTOR_ID,
	CONCAT(AC.FIRST_NAME,"-",AC.LAST_NAME) AS ACTOR, 
    COUNT(*) AS PELICULAS
    FROM ACTOR AS AC 
    JOIN FILM_ACTOR AS FA ON AC.ACTOR_ID=FA.ACTOR_ID
    GROUP BY AC.ACTOR_ID
    ORDER BY PELICULAS DESC;
    SELECT * FROM ID_NOMBRE_APELLIDOS WHERE PELICULAS > 30;
    
    #FUNCIONES 
    CREATE FUNCTION HOLA_NOMBRE (NOMBRE CHAR(20))
    RETURNS CHAR(50) DETERMINISTIC
    RETURN CONCAT('HOLA, ',NOMBRE, '!');
    
    SELECT HOLA_NOMBRE("OSCAR");
    
    # CREA UNA FUNCION QUE RECIBA EL NOMBRE DE UN PAIS Y DEVUELVA EL NOMBRE DE SU CAPITAL
    DROP FUNCTION IF EXISTS GET_CAPITAL;
    CREATE FUNCTION GET_CAPITAL (CODIGO_PAIS CHAR(50))
    RETURNS CHAR(50) DETERMINISTIC
    RETURN (SELECT 
		CITY.NAME
	FROM CITY
    JOIN COUNTRY ON CITY.ID=COUNTRY.CAPITAL
    WHERE COUNTRY.CODE=CODIGO_PAIS);
    
    SELECT GET_CAPITAL("JPN");
    
    
# EJ3 - ESCRIBE UNA FUNCIÓN QUE DEVUELVA COMO SALIDA EL NÚMERO DE AÑOS QUE HAN TRANSCURRIDO 
#       ENTRE DOS FECHAS QUE SE RECIBEN COMO PARÁMETROS DE ENTRADA.
DROP FUNCTION IF EXISTS GET_FECHA;
CREATE FUNCTION GET_FECHA (FECHA1 DATE, FECHA2 DATE)
RETURNS INT DETERMINISTIC
RETURN YEAR(FECHA1) - YEAR(FECHA2);

SELECT   GET_FECHA("2024-02-05","1998-08-12");

# EJ4 - ESCRIBE UNA FUNCIÓN QUE RECIBA EL NOMBRE DE UN CONTINENTE Y DEVUELVA LA POBLACIÓN 
#       DEL CONTINENTE.
#       USA ESTA FUNCIÓN PARA CREAR UNA VISTA QUE MUESTRE UNA LISTA DE LOS PAÍSES Y EL 
#       PORCENTAJE DE POBLACIÓN QUE REPRESENTA CADA PAÍS EN SU CONTINENTE.
USE WORLD;
CREATE FUNCTION GET_CONTINENTE(CONTINENTE enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America'))
RETURNS INT DETERMINISTIC
RETURN (SELECT SUM(POPULATION) FROM COUNTRY WHERE CONTINENT=CONTINENTE);

SELECT GET_CONTINENTE("EUROPE");

# EJ5 - ESCRIBE UNA FUNCIÓN QUE RECIBA EL RADIO DE UN CÍRCULO Y DEVUELVA SU ÁREA.
DROP FUNCTION IF EXISTS GET_AREA;
CREATE FUNCTION GET_AREA(RADIO INT)
RETURNS INT DETERMINISTIC
RETURN RADIO*3.14;
SELECT GET_AREA(9);

# EJ6 - CREA UNA FIUNCIÓN QUE RECIBA UN AÑO Y DEVUELVA EL SIGLO EN EL QUE ESTÁ
CREATE FUNCTION GET_SIGLO (ANIO INT)
RETURNS INT DETERMINISTIC
RETURN (ANIO/100)+1;
SELECT GET_SIGLO(1998);
# EJ7 - CREA UNA FUNCIÓN QUE RECIBA UN AÑO E INIDQUE SI ES BISIESTO O NO
CREATE FUNCTION GET_BISIESTO (AÑO INT)
RETURNS INT DETERMINISTIC 
RETURN (AÑO % 4 = 0 AND AÑO % 100 != 0 ) OR (AÑO % 400 = 0);

SELECT GET_BISIESTO(2000);
# EJ8 - USA LAS DOS FUNCIONES ANTERIORES PARA CREAR UNA VISTA QUE MUESTRE LOS NOMBRE DE 
#       LOS PAÍSES, SU AÑO DE INIDEPENDENCIA, EL SIGLO EN QUE SE INDEPENDIZARON Y SI ESE 
#       AÑO ERA BISIESTO O NO. 
#       NO SE DEBEN MOSTRAR LOS PAÍSES CON AÑO DE INDEPENDENCIA A NULL.
SELECT * FROM COUNTRY;
CREATE VIEW GET_PAISES AS
SELECT 
	NAME AS NOMBRE,
    INDEPYEAR AS INDEPENDENCIA,
    GET_SIGLO(INDEPYEAR),GET_BISIESTO(INDEPYEAR)
    FROM COUNTRY
    WHERE INDEPYEAR IS NOT NULL;
    
SELECT GET_PAISES;