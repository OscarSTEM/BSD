# OSCAR MANUEL BENITO MARTIN 
USE SAKILA;
# TODOS LOS EJERCICIOS SE DEBEN RESOLVER HACIENDO USO DE LA CLÁUSULA JOIN

# EJ1 - SELECCIONA UNA LISTA DE LOS ACTORES (CONCATENA NOMBRE Y APELLIDOS) 
#Y MUESTRA CUANTAS PELÍCULAS HA HECHO CADA ACTOR. ORDENA DE MAYOR A MENOR CANTIDAD DE PELÍCULAS (ACTOR Y FILM_ACTOR).
SELECT * FROM ACTOR;
SELECT CONCAT(ACTOR.FIRST_NAME,"-",ACTOR.LAST_NAME) AS NOMBRE_Y_APELLIDO, COUNT(FA.FILM_ID) AS CANTIDAD_PELIS 
FROM FILM_ACTOR 
JOIN FILM_ACTOR AS FA 
ON FA.ACTOR_ID = ACTOR.ACTOR_ID
ORDER BY CANTIDAD_PELIS DESC;
# EJ2 - MUESTRA UNA LISTA DE LAS PELÍCULAS Y SU IDIOMA EN MAYÚSCULA (FILM Y LANGUAGE).
SELECT UPPER(FL.TITLE), UPPER(LA.NAME) FROM FILM AS FL JOIN LANGUAGE AS LA ON FL.LANGUAGE_ID=LA.LANGUAGE_ID;
# EJ3 - MUESTRA UNA LISTA DE LAS PELÍCULAS Y 
#LA CANTIDAD DE CADA PELÍCULA QUE TENEMOS EN EL INVENTARIO (FILM E INVENTORY).
SELECT UPPER(FL.TITLE), COUNT(INV.INVENTORY_ID) FROM FILM AS FL JOIN INVENTORY AS INV ON FL.FILM_ID=INV.FILM_ID GROUP BY FL.TITLE;
# EJ4 - MUESTRA EL NOMBRE 
#Y LOS APELLIDOS DEL USUARIO QUE MÁS PELÍCULAS HA ALQUILADO (CUSTOMER Y RENTAL) (USA LIMIT 1).
SELECT  FIRST_NAME, LAST_NAME, COUNT(RENTAL_ID) AS ALQUILER FROM CUSTOMER JOIN RENTAL ON CUSTOMER.CUSTOMER_ID=RENTAL.CUSTOMER_ID GROUP BY CUSTOMER.CUSTOMER_ID ORDER BY ALQUILER DESC LIMIT 1;
# EJ5 - MUESTRA UNA LISTA DE LAS CATEGORÍAS 
#Y LA DURACIÓN MEDIA DE LAS PELÍCULAS DE CADA CATEGORÍA (FILM, CATEGORY Y FILM_CATEGORY).
SELECT CATEGORY.NAME, AVG(FL.LENGTH) 
FROM FILM AS FL 
JOIN FILM_CATEGORY ON FL.FILM_ID=FL.FILM_ID=CATEGORY.FILM_ID 
JOIN CATEGORY ON FILM_CATEGORY_ID=CATEGORY.CATEGORY_ID 
GROUP BY CATEGORY.NAME;