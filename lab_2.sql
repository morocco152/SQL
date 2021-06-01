/*Pregunta 1*/

insert into Provincias
values ("37","Castelao");
insert into Provincias
values ("36","Camiño Real");
insert into Provincias
values ("78","Cañadilla");
insert into Provincias
values ("77","Reyes Católicos");
insert into Provincias
values ("27","Plaza de España");


insert into Pueblos
values("49155","La Bóveda de Toro","37");
insert into Pueblos
values("48370","Bermeo","36");
insert into Pueblos
values("21730","Almonte","78");
insert into Pueblos
values("09500","Medina de Pomar","77");
insert into Pueblos
values("15578","Narón","27");

insert into Clientes
values("10000","Catrian Varela Pina","direccion0","A110","49155");
insert into Clientes
values("10001","Catrian Varela Pina","direccion1","A111","48370");
insert into Clientes
values("10002","Adena Menéndez Zambrano","direccion2","A112","21730");
insert into Clientes
values("10003","Catrian Varela Pina","direccion3","A113","09500");
insert into Clientes
values("10004","Elda Monroy Montez","direccion4","A114","15578");

insert into Vendedores
values("10001","Agop Avilés Vaca","Visitación de la Encina 66","A110","49155","10001");
insert into Vendedores
values("10002","Desiderio Núñez Esparza","Salzillo, 97","A111","48370","10002");
insert into Vendedores
values("10003","Eneyén Ruvalcaba Cazares","Ventanilla de Beas, 25","A112","21730","10003");
insert into Vendedores
values("10004","Saraid Blanco Gamez","Ctra. de la Puerta, 15","A113","09500","10004");
insert into Vendedores
values("10005","Hipólito Roque Barrera","C/ Eras, 4","A114","15578","10005");

insert into Articulos
values("Pro01","pretty",100,100,10);
insert into Articulos
values("Pro02","very nice",200,100,10);
insert into Articulos
values("Pro03","big",100,500,10);
insert into Articulos
values("Pro04","small",100,540,10);
insert into Articulos
values("Pro05","carefull",1000,100,10);

insert into Facturas
values("100001","2000-10-11",10000,10001,10,20);
insert into Facturas
values("100002","2020-11-04",10001,10002,14,30);
insert into Facturas
values("100003","1980-12-07",10002,10003,10,5);
insert into Facturas
values("100004","2000/06/15",10003,10004,12,10);
insert into Facturas
values("100005","1999/01/26",10004,10005,54,15);

insert into Lineas_fac
values("100001","11",11,"Pro01",1000,14);
insert into Lineas_fac
values("100002","12",15,"Pro02",3409,24);
insert into Lineas_fac
values("100003","13",16,"Pro03",5678,5);
insert into Lineas_fac
values("100004","14",12,"Pro04",2867,30);
insert into Lineas_fac
values("100005","15",11,"Pro05",9898,10);

/*EJERCICIOS*/ 

/* 1er ejercicio */
SELECT DISTINCT Clientes.codcli
    , Clientes.nombre
    , COUNT(Facturas.codcli)
FROM Clientes 
INNER JOIN Facturas 
    on Clientes.codcli = Facturas.codcli where year(Facturas.fecha) = year(now())-1 
GROUP BY Facturas.codfac
/*ejercicio 2*/
SELECT DISTINCT Facturas.codfac
    , Facturas.fecha 
    , Lineas_fac.precio
FROM Facturas
INNER JOIN Lineas_fac
	on Facturas.codfac = Lineas_fac.codfac 
/*ejercicio 3*/
SELECT DISTINCT Vendedores.codven
	,Vendedores.nombre
	,SUM(Lineas_fac.precio)
FROM Facturas 
INNER JOIN Vendedores
	on Vendedores.codven = Facturas.codven 
INNER JOIN Lineas_fac
	on Facturas.codfac = Lineas_fac.codfac 
group by Vendedores.codven
/*ejercicio 4*/
SELECT DISTINCT pu.nombre
	,SUM(lf.cant) 
From Clientes c 
INNER JOIN Lineas_fac lf
INNER JOIN Pueblos pu
	on pu.codpue = c.codpue
INNER JOIN Facturas f
	where year(f.fecha) = year(now())-1
group by pu.nombre
/*ejercicio 5 */
select distinct codcli, c.nombre
from Clientes c join Pueblos p on c.codpue = p.codpue
join Facturas f using (codcli)
join Vendedores v using (codven)
join Pueblos pu on v.codpue = pu.codpue
where p.codpro <> pu.codpro;
/*ejercicio 6*/
select distinct codcli, a.nombre
from Lineas_fac l join Facturas f using (codfac)
join Clientes c using(codcli)
join Pueblos pu using (codpue)
join Provincias pro using (codpro)
where upper (pro.nombre) = "Valencia"
group by codfac, codcli, c.nombre
having count(*) >9;
/*ejercicio 7*/
select distinct a.codart, a.descript
from Articulos a
inner join Facturas f 
where month(f.fecha) - (month(f.fecha)-1) = -1;
/*eercicio 8*/
select codcli, c.nombre
from Clientes c join Facturas f using (codcli)
join Lineas_fac l using (codfac)
join Pueblos p using (codpue)
where p.codpro= '12'
group bt codcli, c.nombre
having sum(cant*precio) >6000.00
/*eercicio 9*/
/*eercicio 10*/
/*eercicio 11*/
/*eercicio 12*/



