CREATE DATABASE tienda;

USE tienda;

CREATE TABLE empresa(
	id_empresa INTEGER PRIMARY KEY,
    direccion VARCHAR(30),
    nombre VARCHAR(30));

CREATE TABLE categoria(
	id_categoria INTEGER PRIMARY KEY,
    descripcion VARCHAR(30),
    id_empresa INTEGER);

CREATE TABLE producto(
	id_producto INTEGER PRIMARY KEY,
    nombre VARCHAR(30),
    id_categoria INTEGER);


CREATE TABLE pedido(
	id_pedido INTEGER PRIMARY KEY,
    fecha DATE,
    descripcion VARCHAR(30),
    total INTEGER,
    id_producto INTEGER);

CREATE TABLE tipo(
	id_estado INTEGER PRIMARY KEY);

CREATE TABLE cliente(
	id_cliente INTEGER PRIMARY KEY,
    nombres VARCHAR(30),
    primerapellido VARCHAR(30),
    segundoapellido VARCHAR(30),
    telefono INTEGER,
    direccion INTEGER,
    correo INTEGER,
    edad INTEGER,
    limite_credito INTEGER,
    id_estado INTEGER,
    id_pedido INTEGER);


ALTER TABLE categoria ADD FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa);
ALTER TABLE producto ADD FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria);
ALTER TABLE pedido ADD FOREIGN KEY (id_producto) REFERENCES producto(id_producto);
ALTER TABLE cliente ADD FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido);
ALTER TABLE cliente ADD FOREIGN KEY (id_estado) REFERENCES tipo(id_estado);