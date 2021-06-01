/*Pregunta 1*/

#imagen en el informe  

/*Pregunta 2*/

/*empleados*/
insert into empleados
values("Antonio Arjona","12345678A",5000);
insert into empleados
values("Carlota Cerezo","12345678C",1000);
insert into empleados
values("Laura Lopez","12345678L",1500);
insert into empleados
values("Pedro Perez","12345678P",2000);

/*codigos postales*/
insert into codigos_postales
values(08050,"Parets","Barcelona");
insert into codigos_postales
values(14200,"Penarroya","Cordova");
insert into codigos_postales
values(14900,"Lucena","Cordova");
insert into codigos_postales
values(28040,"Madrid","Madrid");
insert into codigos_postales
values(50008,"Zaragoza","Zaragoza");
insert into codigos_postales
values(28004,"Arganda","Madrid");
insert into codigos_postales
values(08050,"Madrid","Madrid");

/*domicilios*/
insert into domicilios
values("12345678A","Av Complutense",28040);
insert into domicilios
values("12345678A","Cantaro",28004);
insert into domicilios
values("12345678P","Diamante",15200);
insert into domicilios
values("12345678P","Carbon",14900);
insert into domicilios
values("12345678L","Diamante",14200);

/*telefonos*/
insert into telefonos
values("12345678C",611111111);
insert into telefonos
values("12345678C",931111111);
insert into telefonos
values("12345678L",913333333);
insert into telefonos
values("12345678P",913333333);
insert into telefonos
values("12345678P",644444444);

/*Pregunta 3 */

SELECT nombre,calle,codigo_postal
FROM empleados
INNER JOIN domicilios
ON empleados.DNI = domicilios.DNI ORDER BY codigo_postal;

/*Pregunta 4*/

SELECT DISTINCT empleados.nombre
    , empleados.DNI
    , domicilios.calle
    , domicilios.codigo_postal
    , telefonos.telefono
FROM empleados 
INNER JOIN domicilios
    on empleados.DNI = domicilios.DNI
INNER JOIN telefonos 
    on empleados.DNI = telefonos.DNI
ORDER BY empleados.nombre ASC 

/*Pregunta 5*/

SELECT DISTINCT empleados.nombre
    , empleados.DNI
    , domicilios.calle
	, domicilios.codigo_postal
    , codigos_postales.poblacion
    , codigos_postales.provincial
FROM domicilios
INNER JOIN empleados
    on empleados.DNI = domicilios.DNI
INNER JOIN codigos_postales
    on domicilios.codigo_postal = codigos_postales.codigo_postal    
ORDER BY empleados.nombre ASC

/*Pregunta 6*/

SELECT DISTINCT empleados.nombre
    , empleados.DNI
    , domicilios.calle
    , codigos_postales.poblacion
    , codigos_postales.provincial
    , domicilios.codigo_postal
    , telefonos.telefono
FROM domicilios
INNER JOIN empleados
    on empleados.DNI = domicilios.DNI
INNER JOIN codigos_postales
    on domicilios.codigo_postal = codigos_postales.codigo_postal    
INNER JOIN telefonos
    on telefonos.DNI = empleados.DNI
ORDER BY empleados.nombre ASC

/*Pregunta 7*/

UPDATE empleados
SET sueldo=sueldo*1.1
WHERE sueldo <= 1900;

/*Pregunta 8*/

UPDATE empleados
SET sueldo=(sueldo*10)/11
WHERE sueldo <= 1900;

/*Pregunta 9*/

UPDATE empleados
SET sueldo=sueldo*1.1
WHERE sueldo <= 1600;

/*Pregunta 9.1*/

UPDATE empleados
SET sueldo=(sueldo*10)/11
WHERE sueldo <= 1600;

/*Pregunta 10*/

SELECT MAX(sueldo), MIN(sueldo), AVG(sueldo)
FROM empleados

/*Pregunta 11*/

#null

/*Pregunta 12*/

#null

/*Pregunta 13*/

#null

/******************************/