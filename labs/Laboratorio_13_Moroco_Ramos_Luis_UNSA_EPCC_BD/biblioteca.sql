CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE Biblioteca (
    id_biblioteca INTEGER PRIMARY KEY,
    direccion VARCHAR(30),
    nombre VARCHAR(30));

CREATE TABLE categoría (
    id_categoria INTEGER PRIMARY KEY,
    descripcion VARCHAR(30),
    id_biblioteca INTEGER);

CREATE TABLE libro(
	ISBN INTEGER,
    titulo_español VARCHAR(30),
    titulo_ingles VARCHAR(30),
    año INTEGER,
    id_categoria INTEGER
    PRIMARY KEY (ISBN,id_autor));

CREATE TABLE autor (
   id_autor INTEGER PRIMARY KEY,
    nombres VARCHAR(30),
    primer_apellido VARCHAR(30),
    segundo_apellido VARCHAR(30),
    sexo TINYINT,
    ISBN INTEGER);


ALTER TABLE categoría ADD FOREIGN KEY(id_biblioteca) REFERENCES Biblioteca(id_biblioteca);
ALTER TABLE libro ADD FOREIGN KEY(id_categoria) REFERENCES categoría(id_categoria);
ALTER TABLE autor ADD FOREIGN KEY(ISBN) REFERENCES libro(ISBN);
ALTER TABLE libro ADD FOREIGN KEY (id_autor) REFERENCES autor (id_autor);
