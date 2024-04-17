# ========================================== PT 12 - GESTIÓN DE USUARIOS Y ROLES ========================================== #

# NOMBRE Y APELLIDOS: OSCAR MANUEL BENITO MARTIN

# ------------------------------------------------------------------------------------------------------------------------- #

# EJ1 - CREA UN USUARIO "externo" QUE SOLO PUEDA CONECTARSE AL SERVIDOR MYSQL DESDE LA IP DE SU EQUIPO (10.239.56.34)
CREATE USER 'EXTERNO'@'10.239.56.34' IDENTIFIED BY '1234'; # ENTRA SOLO A LA IP PUESTA
# EJ2 - CREA UN USUARIO "encargado" QUE TENGA TODOS LOS PERMISOS SOBRE LA BASE DE DATOS SAKILA Y 
#QUE PUEDA DAR CUALQUIERA 
        #DE ESOS PERMISOS A OTRO USUARIO. 
        CREATE USER 'ENCARGADO' IDENTIFIED BY '1234';
        GRANT ALL PRIVILEGES ON SAKILA.* TO 'SYSTEM' WITH GRANT OPTION;
        
# EJ3 - CREA UN USUARIO "gestion_clientes" QUE TENGA PERMISOS DE CONSULTA, 
#MODIFICACION, INSERCION Y BORRADO SOBRE LA TABLA 
        #customer DE LA BASE DATOS SAKILA. TAMBIEN LE PERMITIREMOS QUE PUEDA CREAR Y 
        #EJECUTAR PROCEDIMIENTOS Y FUNCIONES EN 
        #ESTA BASE DE DATOS PARA QUE HAGA CARGA AUTOMATICA DE CLIENTES. 
CREATE USER 'GESTION_CLIENTES' IDENTIFIED BY '1234';
GRANT SELECT,INSERT, DELETE ON SAKILA.CUSTOMER TO 'GESTION_CLIENTES' ; 
GRANT ALTER ROUTINE, EXECUTE ON SAKILA.* TO 'GESTION_CLIENTES';
# EJ4 - QUITA EL PERMISO DE BORRADO SOBRE LA TABLA "customer" AL USUARIO "gestion_clientes" 
#Y PERMITE QUE PUEDA AÑADIR 
 #COLUMNAS A LA TABLA.
 REVOKE DELETE ON SAKILA.CUSTOMER FROM 'GESTION_CLIENTES';
 
 # EJ5 - CREA UN ROL "inspector" QUE INICIALMENTE TENGA PERMISOS DE 
 #CONSULTA SOBRE TODAS LAS TABLAS DE LA BASE DE DATOS SAKILA, WORLD Y SEGUROS.
 CREATE ROLE 'INSPECTOR';
 GRANT SELECT ON SAKILA.* TO 'INSPECTOR';
 GRANT SELECT ON WORLD.* TO 'INSPECTOR';
 GRANT SELECT ON SEGUROS.* TO 'INSPECTOR';
 # EJ6 - CREA LOS USUARIOS "inspector1" E "inspector2" Y DALES EL ROL DE "inspector".
 #POSTERIORMENTE, SE DECIDE QUE TODOS LOS INSPECTORES TIENEN QUE TENER, ADEMAS, 
 #PERMISOS DE EJECUCION SOBRE TODOS LOS PROCEDIMIENTOS Y FUNCIONES DE LAS 3 BASES DE DATOS (SAKILA, WORLD Y SEGUROS).
 CREATE USER 'INSPECTOR1' IDENTIFIED BY '1234';
 CREATE USER 'INSPECTOR2' IDENTIFIED BY '1234';
GRANT 'INSPECTOR' TO 'INSPECTOR1' WITH ADMIN OPTION;
GRANT 'INSPECTOR' TO 'INSPECTOR2' WITH ADMIN OPTION;
GRANT EXECUTE ON SAKILA.* TO 'INSPECTOR1';
GRANT EXECUTE ON WORLD.* TO 'INSPECTOR1';
 GRANT EXECUTE ON SEGUROS.* TO 'INSPECTOR1';
 
 GRANT EXECUTE ON SAKILA.* TO 'INSPECTOR2';
GRANT EXECUTE ON WORLD.* TO 'INSPECTOR2';
 GRANT EXECUTE ON SEGUROS.* TO 'INSPECTOR2';