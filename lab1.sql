create database empresa;
use empresa;
show tables;

create table empleados(
	nombre varchar(20) not null,
	DNI varchar(9) primary key,
    sueldo int 
);
describe empleados;

create table domicilios(
	DNI varchar(9) not null,
    calle varchar(50),
    codigo_postal int(5) not null,
	constraint domicilios_empleados foreign key (DNI) 
	references empleados (DNI)
);
describe domicilios;

create table telefonos(
	DNI varchar(9) not null,
    telefono int(9),
	constraint telefonos_empleados foreign key (DNI) 
	references empleados (DNI)
);
describe telefonos;

create table codigos_postales(
	codigo_postal int(5) not null,
    poblacion varchar(50) not null,
    provincial varchar(50) not null
);
describe codigos_postales;


#select * from empleados;
#select * from domicilios;
#select * from telefonos;
#select * from codigos_postales;

