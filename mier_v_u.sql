create database dba;
use dba;
show tables;

create table jugadores(
	jnum varchar(2) primary key,
    nombre varchar(10) not null,
    nivel int null,
    fecha date not null
);
describe jugadores;

create table campeones(
	cnum varchar(2) primary key,
    nombre varchar(10) not null,
    tipo varchar(10) not null,
    precio int null,
    fecha date not null
);
describe campeones;

create table batallas(
	jnum varchar(2) not null,
    cnum varchar(2) not null,
    cant int null,
    constraint batallas_jugadores foreign key (jnum) 
	references jugadores (jnum)
    on delete cascade
    on update cascade,
    constraint batallas_campeones foreign key(cnum)
    references campeones(cnum)
    on delete restrict 
    on update cascade,
    constraint batallas_pk primary key (jnum,cnum)
);
describe batallas;
delete from campeones where cnum = "C2";

select * from campeones;



///////////////////////////////////////////



create database lab_2;
use lab_2;
show tables; 

create table Provincias(
	codpre varchar(2) primary key not null,
    nombre varchar(30) not null
);
describe Provincias;

create table Pueblos(
	codpue varchar(5) primary key not null,
    nombre varchar(40) not null,
    codpro varchar(2) not null, 
    constraint Pueblos_Provincias foreign key(codpro)
    references Provincias(codpre)
);
describe Pueblos;

create table Clientes(
	codcli int(5) primary key not null,
    nombre varchar(50) not null,
    direccion varchar(50) not null,
    codpostal varchar(5),
    codpue varchar(5) not null,
	constraint Clientes_Pueblos foreign key(codpue)
    references Pueblos(codpue)
);
describe Clientes;

create table Vendedores(
	codven int(5) primary key not null,
    nombre varchar(50) not null,
    direccion varchar(50) not null,
    codpostal varchar(6),
    codpue varchar(5) not null,
    codjefe int(5)not null,
    constraint Vendedores_Pueblos foreign key(codpue)
    references Pueblos(codpue),
    constraint vendedor_jefe foreign key (codjefe)
    references Vendedores(codven)
);
describe Vendedores;

create table Articulos(
	codart varchar(8) primary key not null,
    descript varchar(40) not null,
    precio int(10) not null,
    stock int(6),
    stock_min int(6)
);
describe Articulos;

create table Facturas(
	codfac int(6) primary key not null,
    fecha date not null,
    codcli int(5),
    codven int(5),
    iva int(2),
    dto int(2),
	constraint Facturas_Clientes foreign key(codcli)
    references Clientes(codcli),
	constraint Facturas_Vendedores foreign key(codven)
    references Vendedores(codven)
);
describe Facturas;

create table Lineas_fac(
	codfac int(6) not null,
	linea int(2) not null,
    cant int(5),
    codart varchar(8) not null,
    precio int(10),
    dto int(2),
	constraint Lineas_fac_Facturas foreign key(codfac)
    references Facturas(codfac),
	constraint Lineas_fac_Articulos foreign key(codart)
    references Articulos(codart)
);
describe Lineas_fac


insert into Provincias
values ("10","person1");
insert into Provincias
values ("11","person2");
insert into Provincias
values ("13","person3");
insert into Provincias
values ("14","person4");
insert into Provincias
values ("10","person1");
insert into Provincias
values ("11","person2");
insert into Provincias
values ("13","person3");
insert into Provincias
values ("14","person4");