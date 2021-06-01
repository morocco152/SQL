CREATE DATABASE CadenaTelo;

USE CadenaTelo;
		
CREATE TABLE CadenaHotelera (
   id INTEGER,
   Nombre CHAR(25),
   id_Hotel INTEGER,
   PRIMARY KEY (id,id_Hotel)
);

CREATE TABLE Hotel (
   Código INTEGER PRIMARY KEY,
   nombre CHAR(25),
   direccion CHAR(25),
   departamento CHAR(25),
   id_cuartos INTEGER
);
		
CREATE TABLE cuartos (
   id_cuarto INTEGER PRIMARY KEY,
   piso INTEGER,
   Número INTEGER,
   precio INTEGER,
   Númerodecamas INTEGER
);
		
CREATE TABLE amenidades (
   id_cuarto INTEGER PRIMARY KEY,
   amenidades INTEGER
);
		
CREATE TABLE estandar (
   id_caurto INTEGER PRIMARY KEY,
   pago_anticipado INTEGER
);
		
CREATE TABLE lujo (
   id_cuarto INTEGER PRIMARY KEY,
   pago_anticipado INTEGER
);
		
CREATE TABLE super_lujo (
   id_cuarto INTEGER PRIMARY KEY,
   pago_anticipado INTEGER
);
		
CREATE TABLE bacon (
  id_caurto INTEGER PRIMARY KEY
);
		
CREATE TABLE sin_balcon (
  id_caurto INTEGER PRIMARY KEY
);
		
CREATE TABLE reservación (
   id_reservacon INTEGER PRIMARY KEY,
   fecha_reserva DATE,
   fecha_inicio DATE,
   fecha_fin DATE,
   dias INTEGER
);
		
CREATE TABLE Hotel_reseva (
   id_hotel INTEGER,
   id_reservacion INTEGER,
   PRIMARY KEY (id_hotel, id_reservacion)
);
		
CREATE TABLE cliente (
   codigo_cliente INTEGER PRIMARY KEY,
   nombres CHAR(25),
   primrapellido CHAR(25),
   doapellido CHAR(25)
);
		
CREATE TABLE correo (
   codigo_cliente INTEGER PRIMARY KEY,
   correo CHAR(25)
);
		
CREATE TABLE telefono(
   codigo_cliente INTEGER PRIMARY KEY,
   telefono INTEGER
);
		
CREATE TABLE realizar_reserva (
   id_reservacion INTEGER,
   codigo_cliente INTEGER,
   PRIMARY KEY (id_reservacion,codigo_cliente)
);
		
CREATE TABLE peruano (
   codigo_cliente INTEGER PRIMARY KEY,
   DNI INTEGER
);
		
CREATE TABLE extranjero (
   codigo_cliente INTEGER PRIMARY KEY,
   Pasaporte INTEGER
);

ALTER TABLE  CadenaHotelera ADD FOREIGN KEY (id_Hotel) REFERENCES Hotel (Código);
ALTER TABLE  Hotel ADD FOREIGN KEY (id_cuartos) REFERENCES cuartos (id_cuarto);
ALTER TABLE  cuartos ADD FOREIGN KEY (id_cuarto) REFERENCES amenidades (id_cuarto);
ALTER TABLE  cuartos ADD FOREIGN KEY (id_cuarto) REFERENCES super_lujo (id_cuarto);
ALTER TABLE  estandar ADD FOREIGN KEY (id_caurto) REFERENCES cuartos (id_cuarto);
ALTER TABLE  lujo ADD FOREIGN KEY (id_cuarto) REFERENCES cuartos (id_cuarto);
ALTER TABLE  super_lujo ADD FOREIGN KEY (id_cuarto) REFERENCES sin_balcon (id_caurto);
ALTER TABLE  bacon ADD FOREIGN KEY (id_caurto) REFERENCES super_lujo (id_cuarto);
ALTER TABLE  Hotel_reseva ADD FOREIGN KEY (id_reservacion) REFERENCES reservación (id_reservacon);
ALTER TABLE  Hotel_reseva ADD FOREIGN KEY (id_hotel) REFERENCES Hotel (Código);
ALTER TABLE  realizar_reserva ADD FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente);
ALTER TABLE  correo ADD FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente);
ALTER TABLE  telefono ADD FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente);
ALTER TABLE  reservación ADD FOREIGN KEY (id_reservacon) REFERENCES realizar_reserva (id_reservacion);
ALTER TABLE  peruano ADD FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente);
ALTER TABLE  extranjero ADD FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente);