CREATE DATABASE Investigacion;
USE Investigacion;
		
CREATE TABLE Persona (
   DNI INTEGER PRIMARY KEY,
   nombres CHAR(25),
   Primapellido CHAR(25),
   Segdoapellido CHAR(25),
   nacimiento DATE
);
		
CREATE TABLE telefono_persona (
   DNI INTEGER PRIMARY KEY,
   telefono INTEGER
);
		
CREATE TABLE correo_persona (
   id INTEGER PRIMARY KEY,
   correos CHAR(25)
);
		
CREATE TABLE alumno (
   DNI INTEGER,
   carrera CHAR(25),
   DNI_nobeca INTEGER,
   PRIMARY KEY (DNI,DNI_nobeca)
);
		
CREATE TABLE profesor (
   DNI INTEGER PRIMARY KEY,
   especialidad CHAR(25)
);
		
CREATE TABLE alumno_beca (
   DNI INTEGER PRIMARY KEY,
   DNI_profesor INTEGER
);
		
CREATE TABLE alum_nobeca (
   DNI INTEGER,
   pension INTEGER,
   DNI_nobeca INTEGER,
   PRIMARY KEY (DNI,DNI_nobeca)
);
		
CREATE TABLE proyectos (
   codigo_proyecto INTEGER PRIMARY KEY,
   fechainicio DATE,
   fechafin DATE,
   presupuesto INTEGER,
   hito INTEGER
);
		
CREATE TABLE basica (
   codigo_proyectyo INTEGER PRIMARY KEY,
   cod_univerdidad INTEGER NULL DEFAULT NULL,
   nombre CHAR(25),
   DNI_profesor INTEGER,
   DNI_becario INTEGER
);
		
CREATE TABLE aplicada (
   codigo_proyecto INTEGER PRIMARY KEY,
   cod_empresa INTEGER,
   nombre CHAR(25)
);
		
CREATE TABLE hito (
   numero_it INTEGER PRIMARY KEY,
   id_objetivo INTEGER,
   fechainicio DATE,
   fechafin DATE
);
		
CREATE TABLE objetivos (
   id_objetivo INTEGER PRIMARY KEY,
   objetivos CHAR(25)
);

ALTER TABLE  telefono_persona  ADD FOREIGN KEY (DNI) REFERENCES Persona (DNI);
ALTER TABLE  correo_persona ADD FOREIGN KEY (id) REFERENCES Persona (DNI);
ALTER TABLE  alumno ADD FOREIGN KEY (DNI) REFERENCES Persona (DNI);
ALTER TABLE  alum_nobeca ADD FOREIGN KEY (DNI_nobeca) REFERENCES alumno (DNI);
ALTER TABLE  profesor ADD FOREIGN KEY (DNI) REFERENCES Persona (DNI);
ALTER TABLE  alumno_beca ADD FOREIGN KEY (DNI) REFERENCES alumno (DNI);
ALTER TABLE  alumno_beca ADD FOREIGN KEY (DNI_profesor) REFERENCES profesor (DNI);
ALTER TABLE  alum_nobeca ADD FOREIGN KEY (DNI) REFERENCES alumno (DNI);
ALTER TABLE  basica ADD FOREIGN KEY (codigo_proyectyo) REFERENCES proyectos (codigo_proyecto);
ALTER TABLE  basica ADD FOREIGN KEY (DNI_profesor) REFERENCES profesor (DNI);
ALTER TABLE  basica ADD FOREIGN KEY (DNI_becario) REFERENCES alumno_beca (DNI);
ALTER TABLE  aplicada ADD FOREIGN KEY (codigo_proyecto) REFERENCES proyectos (codigo_proyecto);
ALTER TABLE  proyectos ADD FOREIGN KEY (hito) REFERENCES hito (numero_it);
ALTER TABLE  hito ADD FOREIGN KEY (id_objetivo) REFERENCES objetivos (id_objetivo);