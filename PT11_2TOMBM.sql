#OSCAR MANUEL BENITO MARTIN 
USE WORLD;

# EJ1 - MUESTRA EL NOMBRE DE LOS PAÍSES Y SU GNPold.
#     - SI EL GNPold ES NULO, MUESTRA EL GNP.
#     - ADEMÁS, MUESTRA UNA COLUMNA QUE CLASIFIQUE LOS PAÍSES DEL SIGUIENTE MODO:
#          - GNP MENOR QUE 20.000: PAÍS POBRE.
#          - GNP ENTRE 20.000 Y 200.000: PAÍS PROMEDIO.
#          - GNP MAYOR QUE 200.000: PAÍS RICO.
SELECT * FROM COUNTRY;
SELECT NAME, IFNULL(NULL,GNPOLD), GNP,
CASE
		WHEN GNP < 20000 THEN "PAÍS POBRE"
		WHEN GNP BETWEEN 20000 AND 2000000 THEN "PAÍS PROMEDIO"
		WHEN GNP > 200000 THEN "PAÍS RICO"
		ELSE "NO HAY PAIS"
        END AS CLASIFICACION_PAISES
 FROM COUNTRY;
# EJ2 - CREA UN ÍNDICE PARA LAS COLUMNAS LANGUAGE E ISOFFICIAL DE LA TABLA 
#       COUNTRYLANGUAGE (SOLO UN ÍNDICE).
SELECT * FROM COUNTRYLANGUAGE;
CREATE INDEX LANGUAGE_IX ON COUNTRYLANGUAGE(LANGUAGE);
CREATE INDEX ISO_IX ON COUNTRYLANGUAGE(ISOFFICIAL);
USE SAKILA;

# EJ3 - ¿CUÁNTOS AÑOS LLEVA CERRADO EL VIDEOCLUB? (SE CERRÓ EL DÍA DEL ÚLTIMO ALQUILER)
SELECT * FROM RENTAL;
SELECT * FROM STORE;
SELECT ST.STORE_ID, DATEDIFF(MAX(R.RENTAL_DATE) , CURRENT_DATE()) 
FROM STORE AS ST 
JOIN RENTAL R ON ST.LAST_UPDATE=R.LAST_UPDATE;
# EJ4 - ¿LA QUINCENA INFLUYE EN LOS INGRESOS POR ALQUILER? MUESTRA EL PAGO PROMEDIO DE 
#       ALQUILER AGRUPANDO POR PRIMERA Y SEGUNDA QUINCENA.
SELECT AVG(AMOUNT), 
CASE
		WHEN DATE_FORMAT(PAYMENT_DATE, "%Y") <=15 THEN "PRIMERA QUINCENA"
		WHEN DATE_FORMAT(PAYMENT_DATE, "%Y") >15 THEN "SEGUNDA QUINCENA"
		ELSE "NO HAY DIAS"
        END AS QUINCENA
 FROM PAYMENT
 GROUP BY QUINCENA;
# EJ5 - LAS PELÍCULAS NC-17 NO PUEDEN SER ALQUILADAS POR NADIE MENOR DE 17 AÑOS.
#       MUESTRA UNA LISTA CON EL NOMBRE DE LA PELÍCULA ALQUILADA (SOLO PELÍCULAS NC-17), 
#       LA FECHA DEL ALQUILER Y LA FECHA DE NACIMIENTO MÍNIMA QUE DEBERÍA TENER EL CLIENTE 
#       EN ESE MOMENTO.
SELECT * FROM FILM;
SELECT * FROM RENTAL;
SELECT * FROM INVENTORY;
SELECT * FROM FILM WHERE RATING="NC-17";
SELECT FI.TITLE,RE.RENTAL_DATE, DATE_ADD(NOW(), INTERVAL 17 YEAR) 
FROM FILM FI 
JOIN INVENTORY INV ON INV.FILM_ID=FI.INVENTORY_ID
JOIN RENTAL RE ON INV.INVENTORY_ID=RE.INVENTORY_ID
WHERE RATING="NC-17";