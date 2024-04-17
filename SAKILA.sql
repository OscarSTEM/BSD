USE SAKILA;
SELECT * FROM FILM;
SELECT * FROM ACTOR;
#EJ1 MUESTRA LA PELICULA MAS LARGA
SELECT TITLE, LENGTH FROM FILM ORDER BY LENGTH DESC LIMIT 1;
SELECT TITLE , LENGTH FROM FILM WHERE LENGTH = (SELECT MAX(LENGTH) FROM FILM);
#EJ2 MUESTRA LA PELICULA CON MENOR DURACION
SELECT TITLE, LENGTH FROM FILM ORDER BY LENGTH ASC LIMIT 1;
SELECT TITLE , LENGTH FROM FILM WHERE LENGTH = (SELECT MIN(LENGTH) FROM FILM);
#EJ3 MUESTRA LOS DISTINTOS RATING DE EDAD USADOS

#EJ4 CUANTAS PELICULAS DURAN MAS DE 2H
SELECT COUNT(*) FROM FILM WHERE LENGTH > 120;
#EJ5 MUESTRA EL NOMBRE LA PELICULAS Y SU DURACION DE HORAS (ORDENA DE MENOR A MAYOR)
SELECT TITTLE, LENGTH/60 AS DURACION_HORAS FROM FILM ORDER BY LENGTH ASC;
#EJ6 CUANTAS PELICULA DURAN MAS DE 2H
SELECT COUNT(*) FROM FILM WHERE SPECIAL_FEATURES LIKE "%DELETED SCENES%";
#EJ7 QUE PELICULAS TIENEN ALIEN EN SU NOMBRE MUESTRA POR ORDEN ALFABETICO
SELECT * FROM FILM WHERE TITLE LIKE "%ALIEN%" ORDER BY TITLE;
#EJ8 CUAL ES LA PELICULA MAS LARGA QUE PODEMOS VER 
SELECT TITLE , LENGTH FROM FILM WHERE RENTAL_RATE<1 ORDER BY LENGTH DESC LIMIT 1;
#EJ9 CUANTAS PELICULAS SON DOCUMENTALES COLUMNA DESCRIPCION
SELECT COUNT(*) FROM FILM WHERE DESCRIPTION LIKE "%DOCUMENTARY%";
#EJ10 CUAL ES EL PRECIO DE REEMPLAZO MEDIO DE LAS PELICULAS CON RATING "R"
SELECT AVG(REPLACEMENT_COST) FROM FILM WHERE RATING = "R";
#EJ11 CUANTOS DIAS TARDARIAMOS EN VER TODAS LAS PELICULAS 
SELECT SUM(LENGTH)/60/24/365 FROM FILM;
#EJ12 MUESTRA LOS PRECIOS DE ALQUILER(RENTAL_RATE) Y CUANTAS PELICULAS SE ALQUILAN DE CADA PRECIO
SELECT RENTAL_RATE, COUNT(*) AS PELICULAS_ALQUILADAS FROM FILM  GROUP BY RENTAL_RATE;

#EJ13 MUESTRA LA DURACION MEDIA DE LAS PELICULAS AGRUPADAS POR RATING
SELECT RATING, ROUND(AVG(LENGTH)) AS DURACION_MEDIA FROM FILM GROUP BY RATING;
SELECT*FROM FILM;
#EJ14 MUESTRA LA DURACION MEDIA DE LAS PELICULAS SIN ESCENAS ELIMINADAS POR RATING
SELECT RATING, ROUND(AVG(LENGTH)) AS DURACION_MEDIA FROM FILM WHERE SPECIAL_FEATURES NOT LIKE "%DELETED SCENES%"  GROUP BY RATING;
# EJ 15 ¿ CUANTO NOS COSTARIA REEMPLAZAR (REPLACEMENT_COST) LAS PELICULAS DE JENNIFER DAVIS (TABLA ACTOR Y FILM_ACTOR) SI VAMOS AL VIDEOCLUB Y LAS DESTRUIMOS?
SELECT SUM(REPLACE_COST) FROM FILM WHERE FILM_ID IN (SELECT FILM_ID FROM FILM_ACTOR WHERE ACTOR_ID =(SELECT ACTOR_ID FROM ACTOR WHERE FIRST_NAME= "JENNIFER" AND LAST_NAME="DAVIS%"));
SELECT LOWER(TITLE) AS NOMBRE_MINUSCULA FROM FILM;
#EJ 16 
#EJ 17 CREA UN CODIGO CONCATENANDO LAS 4 PRIMERAS LETRAS DE CADA PELICULA Y LOS 2 ULTIMOS DIGITOS DE LA FECHA DE LANZAMIENTO CONCAT
SELECT  (LEFT(TITLE,4)) AS CODIGO, (RIGHT (RELEASE_YEAR,2)) AS FECHA_LANZAMIENTO, CONCAT(TITLE, RELEASE_YEAR) AS TITULO_FECHA FROM FILM;
SELECT * FROM FILM;
#EJ 18 IGUAL QUE EL 17 PERO EN MINUSCULA
SELECT  LOWER(LEFT(TITLE,4)) AS LETRAS, (RIGHT (RELEASE_YEAR,2)) AS FECHA_LANZAMIENTO, LOWER(CONCAT(TITLE, RELEASE_YEAR)) FROM FILM;
#EJ 19 CREA UN CODIGO CONCATENANDO LAS 3 PRIMERAS LETRAS DEL NOMBRE Y LAS 3 PRIMERAS LETRAS DE LOS APELLIDOS DE CADA ACTOR 
#DANDOLE LA VUELTA A LA CADENA. EN MINUSCULA
SELECT FIRST_NAME,LAST_NAME, REVERSE(LOWER(CONCAT(LEFT(FIRST_NAME, 3),LEFT(LAST_NAME, 3)))) AS CODIGO FROM ACTOR;
SELECT * FROM ACTOR;
#EJ 20 MUESTRA LA DURACION MEDIA DE LAS PELICULAS AGRUPADAS POR RATING (REDONDEA 2 DECIMALES)
SELECT RATING, ROUND(AVG(LENGTH)) AS DURACION_MEDIA FROM FILM GROUP BY RATING;
SELECT * FROM FILM;
#EJ 21 SUPONIENDO QUE RENTAL_DURATION ES LA DURACION EN DIAS DEL ALQUILER, Y QUE RENTAL_RATE ES EL PRECIO DIARIO DE CADA PELICULA
# MUESTRA:
# - EL NOMBRE DE LA PELICULA
# - LOS DIAS DE ALQUILER
# - EL PRECIO DIARIO
# - EL PRECIO TOTAL
# - UNA COLUMNA QUE ME DIGA CUANTOS BILLETES DE 10 DOLARES
# NECESITARIA PARA ALQUILAR LA PELICULA
SELECT TITLE,RENTAL_DURATION,RENTAL_RATE,RENTAL_DURATION*RENTAL_RATE AS TOTAL_RATE, CEIL(RENTAL_DURATION*RENTAL_RATE/10) AS BILLETE_10 FROM FILM;
# USO TIPO DEL CEIL ES LA MONEDA
SELECT * FROM FILM;
#EJ 22 SELECCIONA EL TITUTLO DE LAS PELICULAS, UNA COLUMNA QUE MUESTRE SI DURA MAS O MENOS 2 H,
#OTRA COLUMNA QUE MUESTRE SI TIENE O NO ESCENAS ELIMINADAS Y OTRA QUE MUESTRE SI TINE O NO TRAILERS (COLUMNA BOOLEANA)
SELECT TITLE,TITLE=LENGTH >120 AS DURACION_PELICULA,  
TITLE= SPECIAL_FEATURES LIKE "%DELETED_SCENES%" AS ESCENAS_ELIMINADAS,
TITLE=SPECIAL_FEATURES LIKE "%TRAILERS%" AS TRAILERS FROM FILM;
#EJ 23 SELECCIONA EL TITULO DE LAS PELICULAS Y UNA  QUE MUESTRE SI LA PELICULA ES APTA PARA ADULTOS
SELECT * FROM FILM;
SELECT TITLE, TITLE= RATING IN ("G","PG","PG-13") AS APTO_TODOS_PUBLICOS FROM FILM;
#EJ 24 SELECCIONA LA DURACION MAXIMA DE LAS PELICULAS AGRUPADAS POR RENTAL_DURATION
SELECT * FROM FILM;
SELECT RENTAL_DURATION, MAX(LENGTH) AS MAXIMA_DURACION FROM FILM GROUP BY RENTAL_DURATION;
#EJ 25 SELECCIONA EL COSTE DE REEMPLAZO MEDIO DE LAS PELICULAS AGRUPADA POR DURACION>120
SELECT REPLACEMENT_COST, AVG(REPLACEMENT_COST) FROM FILM WHERE LENGTH>120 GROUP BY REPLACEMENT_COST;
#EJ 26 ¿CUAL ES EL ACTOR QUE MAS PELICULAS HA HECHO? TABLAS DE ACTOR Y ACTOR_FILM
#(USA LIMIT 1). MUESTRA EL NOMBRE DEL ACTOR Y SU APELLIDO CONCATENADO
SELECT * FROM ACTOR;
SELECT  CONCAT(FIRST_NAME,"-",LAST_NAME)  AS NOMBRE_APELLIDOS FROM ACTOR WHERE ACTOR_ID= (SELECT ACTOR_ID FROM FILM_ACTOR GROUP BY ACTOR_ID ORDER BY COUNT(FILM_ID) DESC LIMIT 1);
# EJ 27 MUESTRA LAS CATEGORIAS DE PELICULA (COD DE CATEGORIA) QUE HAY Y CUANTAS PELICULAS HAY DE CADA CATEGORIA
#TABLA FILM_CATEGORY
SELECT CATEGORY_ID, COUNT(FILM_ID) FROM FILM_CATEGORY GROUP BY CATEGORY_ID;
SELECT * FROM FILM_CATEGORY;
# EJ 28 MUESTRA LOS DISTINTOS AÑOS DE LANZAMIENTO 
# EJ 29 MUESTRA EN MINUSCULA EL NOMBRE DE LOS APELLIDOS DE LOS ACTORES QUE HAN HECHO MAS DE 15 PELICULAS (CUENTA SOLO PELICULAS MAS DE 100 MINUTOS)
SELECT 
	LOWER(FIRST_NAME), 
	LOWER(LAST_NAME) 
FROM ACTOR 
WHERE ACTOR_ID IN
			(SELECT ACTOR_ID FROM  FILM_ACTOR
			WHERE FILM_ID IN (SELECT FILM_ID FROM FILM WHERE LENGTH>100)
            GROUP BY ACTOR_ID 
            HAVING COUNT(FILM_ID)>15);
# EL HAVING VA CON EL COUNT, CON EL SUM, ETC...
# EJ 30 ¿CUAL ES EL RENTAL_RATE MEDIO DE LAS PELICULAS EN LAS QUE APARECE UN FRISBEE?
SELECT AVG(RENTAL_RATE) FROM FILM WHERE DESCRIPTION LIKE "%FRISBEE%";
# EJ 31 ¿QUE ACTOR HA PARTICIPADO EN MAS PELICULAS CON FRISBEE? (USA LIMIT 1)
SELECT FIRST_NAME, LAST_NAME FROM ACTOR
WHERE ACTOR_ID = (SELECT ACTOR_ID FROM FILM_ACTOR 
WHERE  FILM_ID IN (SELECT FILM_ID FROM FILM WHERE DESCRIPTION LIKE "%FRISBEE%")
GROUP BY ACTOR_ID ORDER BY COUNT(*) DESC LIMIT 1);
#EJ 32 MUESTRA LA DIRECCION DE LAS TIENDAS Y CUANTAS PELICULAS HAY EN CADA UNA
SELECT * FROM ADDRESS;
SELECT AD.ADDRESS, COUNT(INV.INVENTORY_ID) FROM ADDRESS AS AD JOIN STORE AS ST ON AD.ADDRESS_ID=ST.ADDRESS_ID JOIN INVENTORY AS INV ON INV.STORE_ID= ST.STORE_ID GROUP BY ST.STORE_ID; ;
#EJ 33 ¿CUAL ES LA PELICULA DE LA QUE TENEMOS MAS COPIAS?
SELECT * FROM FILM;
SELECT MAX(NUMERO)
FROM
	(SELECT FI.TITLE, COUNT(INV.INVENTORY_ID) AS NUMERO FROM FILM AS FI 
JOIN INVENTORY AS INV ON INV.FILM_ID= FI.FILM_ID 
GROUP BY FI.FILM_ID) AS QTY_POR_TITULO
HAVING QTY_PELICULAS = (SELECT MAX(QTY_PELICULAS) 
FROM
(SELECT
	F.TITLE, COUNT(*) AS QTY_PELICULAS
    FROM
		INVENTORY AS INV
	JOIN FILM AS F ON INV.FILM_ID=F.FILM_ID
    GROUP BY F.FILM_ID) AS QTY_POR_TITULO);

#EJ 34 MUESTRA LA DIRECCION DE LAS TIENDAS Y CUANTO EN TOTAL HA FACTURADO CADA UNA
SELECT 
	A.ADDRESS,
    SUM(PAY.AMOUNT) AS FACTURACION
FROM PAYMENT PAY
JOIN RENTAL RENT ON PAY.RENTAL_ID=RENT.RENTAL_ID
JOIN INVENTORY INV ON RENT.INVENTORY_ID = INV.INVENTORY_ID
JOIN STORE S ON INV.STORE_ID=S.STORE_ID
JOIN ADDRESS A ON S.ADDRESS_ID=A.ADDRESS_ID
GROUP BY S.STORE_ID;

#EJ 35 MUESTRA UNA LISTA DE LAS PELICULAS, Y CUANTO HAN PAGADO DE MEDIA POR ALQUILARLAS
SELECT FI.TITLE, ROUND(AVG(PA.AMOUNT),2) AS MEDIA_ALQUILER 
FROM FILM AS FI 
JOIN INVENTORY AS INV ON FI.FILM_ID= INV.FILM_ID
JOIN RENTAL AS RE ON INV.INVENTORY_ID= RE.INVENTORY_ID
JOIN PAYMENT AS PA ON RE.RENTAL_ID = PA.RENTAL_ID 
GROUP BY FI.TITLE ;
SELECT * FROM PAYMENT;

#EJ 36 ¿CUAL HA SIDO LA PELICULA MAS RENTABLE?
SELECT FI.TITLE, SUM(PA.AMOUNT) AS INGRESOS 
FROM FILM AS FI 
JOIN INVENTORY AS INV ON FI.FILM_ID= INV.FILM_ID
JOIN RENTAL AS RE ON INV.INVENTORY_ID= RE.INVENTORY_ID
JOIN PAYMENT AS PA ON RE.RENTAL_ID = PA.RENTAL_ID 
GROUP BY FI.TITLE
ORDER BY INGRESOS ;

#EJ 37 MUESTRA UNA LISTA DE LOS CLIENTES, Y CUANTO DINERO HA GASTADO CADA UNO
SELECT CONCAT(CU.FIRST_NAME, "-", CU.LAST_NAME) AS CLIENTES, SUM(PA.AMOUNT) AS GASTADO  FROM CUSTOMER AS CU 
JOIN PAYMENT AS PA ON CU.CUSTOMER_ID=PA.CUSTOMER_ID
GROUP BY CLIENTES;

#EJ 38 ¿QUIEN HA SIDO EL CLIENTE MAS RENTABLE?
SELECT CONCAT(CU.FIRST_NAME, "-", CU.LAST_NAME) AS CLIENTES, SUM(PA.AMOUNT) AS INGRESOS_GENERADOS FROM CUSTOMER AS CU 
JOIN PAYMENT AS PA ON CU.CUSTOMER_ID=PA.CUSTOMER_ID
GROUP BY CLIENTES
ORDER BY INGRESOS_GENERADOS DESC LIMIT 1;
#EJ 39 ¿HAY ALGUNA PELICULA PARA LA QUE NO TENGAMOS COPIA?
SELECT * 
FROM FILM
WHERE FILM_ID
NOT IN (SELECT FILM_ID FROM INVENTORY);
SELECT *
FROM FILM AS FI
LEFT JOIN INVENTORY AS INV ON FI.FILM_ID=INV.FILM_ID
WHERE INV.INVENTORY_ID IS NULL;

#EJ 40 MUESTRA UNA LISTA DE LAS PELICULAS QUE NOS FALTAN EN LA TIENDA 2
SELECT *
FROM FILM AS FI
LEFT JOIN INVENTORY AS INV ON FI.FILM_ID=INV.FILM_ID AND INV.STORE_ID=2
WHERE INV.INVENTORY_ID IS NULL ;
#EJ 41 ¿CUAL ES EL ACTOR MAS FAMOSO? (AQUEL CUYAS PELICULAS SE HAYAN ALQUILADO MAS VECES)
SELECT 
	ACTOR.FIRST_NAME,
    ACTOR.LAST_NAME,
    COUNT(*) AS PELICULAS_ALQUILADAS
FROM RENTAL RENT
JOIN INVENTORY INV ON RENT.INVENTORY_ID=INV.INVENTORY_ID
JOIN FILM FI ON INV.FILM_ID=FI.FILM_ID
JOIN FILM_ACTOR FA ON FA.FILM_ID=FI.FILM_ID
JOIN ACTOR ON FA.ACTOR_ID=ACTOR.ACTOR_ID
GROUP BY ACTOR.ACTOR_ID
ORDER BY PELICULAS_ALQUILADAS DESC
LIMIT 1;
#EJ 42 ¿CUAL ES LA PELICULA MAS ALQUILADA EN LA TIENDA 2?
SELECT FI.TITLE,
COUNT(*) AS PELICULA_MAS_ALQUILADA
FROM RENTAL AS RE
JOIN INVENTORY AS INV ON RE.INVENTORY_ID=INV.INVENTORY_ID AND INV.STORE_ID=2 
JOIN FILM AS FI ON INV.FILM_ID=FI.FILM_ID 
GROUP BY FI.FILM_ID
ORDER BY PELICULA_MAS_ALQUILADA DESC LIMIT 1;
#EJ 43 ¿DESDE QUE PAIS NOS HAN ALQUILADO MAS PELICULAS? (CUSTOMER)
SELECT 
CO.COUNTRY, COUNT(RE.RENTAL_ID) AS MAYOR_CANTIDAD
FROM COUNTRY AS CO
JOIN CITY AS CI ON CO.COUNTRY_ID=CI.COUNTRY_ID
JOIN ADDRESS AS AD ON CI.CITY_ID=AD.CITY_ID
JOIN CUSTOMER AS CU ON AD.ADDRESS_ID=CU.ADDRESS_ID
JOIN RENTAL AS RE ON CU.CUSTOMER_ID=RE.CUSTOMER_ID
GROUP BY CO.COUNTRY 
ORDER BY MAYOR_CANTIDAD DESC LIMIT 1;
#EJ 44 MUESTRA LA DIRECCION DE CADA TIENDA Y LA CANTIDAD USUARIOS INACTIVOS QUE HAY EN CADA UNA
SELECT 
	AD.ADDRESS,
    COUNT(*)
FROM CUSTOMER CU
JOIN STORE ON CU.STORE_ID=STORE.STORE_ID
JOIN ADDRESS AS AD ON STORE.ADDRESS_ID=AD.ADDRESS_ID
WHERE CU.ACTIVE = FALSE
GROUP BY STORE.STORE_ID;

#EJ 45 ¿CUANTOS USUARIOS SIN TELEFONO TENEMOS?
#EJ 46 MUESTRA UN LISTADO DE LAS CATEGORIAS Y CUANTO DINERO HEMOS GANADO CON CADA UNA DE ELLAS
#=======================================FECHA======================================================
# FECHA DEL SERVIDOR (ESTAS DOS HACEN LO MISMO)
SELECT NOW();
SELECT CURRENT_TIMESTAMP();

#DA LA FECHA ACTUAL
SELECT CURRENT_DATE();

#DA LA HORA ACTUAL
SELECT CURRENT_TIME();

#DEVUELVE LAS DIFERENCIAS EN DIAS ENTRE LAS DOS FECHAS
SELECT DATEDIFF("2017-06-25","2017-06-15");

#AÑADIR INTERVALOS A UNA FECHA Y HORA
SELECT DATE_ADD("2017-06-15", INTERVAL 10 WEEK);

# EXTRAER PARTES DE UNA FECHA ES (MUESTRA LO QUE TU LE PONGAS)
SELECT DATE(NOW());

SELECT DAY(NOW()); #LA VERSION ESTA ES MEJOR QUE PONER LA EXTRACT
SELECT MONTH(NOW());
SELECT EXTRACT(MONTH FROM NOW());
SELECT YEAR(NOW());
SELECT EXTRACT(YEAR FROM NOW());
SELECT QUARTER(NOW());

SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());
SELECT MICROSECOND(NOW());
SELECT TIME(NOW());
# DA LA SEMANA DEL AÑO
SELECT WEEK(NOW()); # OJITO: LAS SEMANAS COMIENZAN EN DOMINGO AQUI
SELECT EXTRACT(WEEK FROM NOW());


#PARA QUE TE DE EL AÑO Y EL MES
SELECT CONCAT(YEAR(NOW()),"-",MONTH(NOW())); # ESTO ESTA FEO, PERO ES UNA FORMA DE HACERLO
# FORMATEA FECHAS
SELECT DATE_FORMAT(NOW(), "%Y-%m");


