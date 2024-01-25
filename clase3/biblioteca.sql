DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE biblioteca;


use biblioteca;

create table autores(
	idAutor int NOT NULL AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    nacionalidad varchar(50) NOT NULL,
    PRIMARY KEY(idAutor)
    
);


create table libros(
	idLibro INT NOT NULL AUTO_INCREMENT,
    titulo varchar(50) NOT NULL,
    editorial varchar(50) NOT NULL,
    area_ varchar(50) NOT NULL,
    PRIMARY KEY(idLibro)
);

create table libros_autores(
	idLibroAutor int NOT NULL AUTO_INCREMENT,
    idLibro int NOT NULL,
    idAutor int NOT NULL,
    PRIMARY KEY(idLibroAutor),
    FOREIGN KEY(idLibro) REFERENCES libros(idLibro),
    FOREIGN KEY (idAutor) REFERENCES autores(idAutor)
);

create table estudiantes(
	idLector INT NOT NULL AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    direccion varchar(50) NOT NULL,
    carrera varchar(50) NOT NULL,
    edad INT NOT NULL,
    PRIMARY KEY(idLector)
);

create table prestamos(
	idPrestamo INT NOT NULL AUTO_INCREMENT,
    idLector INT NOT NULL,
    idLibro INT NOT NULL,
    fechaPrestamo DATE NOT NULL,
    fechaDevolucion DATE NOT NULL,
    devuelto BOOL NOT NULL,
    PRIMARY KEY(idPrestamo),
    FOREIGN KEY (idLector) REFERENCES estudiantes(idLector),
    FOREIGN KEY(idLibro) REFERENCES libros(idLibro)
);


INSERT INTO autores(nombre,nacionalidad) VALUES('J.K. Rowling','italiano');
INSERT INTO autores(nombre,nacionalidad) VALUES('autor2','italiano');
INSERT INTO autores(nombre,nacionalidad) VALUES('autor3','mexicano');
INSERT INTO autores(nombre,nacionalidad) VALUES('autor4','argentino');
INSERT INTO autores(nombre,nacionalidad) VALUES('autor5','argentino');

INSERT INTO libros(titulo,editorial,area_) VALUES('El Universo: Guía de viaje','salamandra','internet');
INSERT INTO libros(titulo,editorial,area_) VALUES('libro2','salamandra','libro');
INSERT INTO libros(titulo,editorial,area_) VALUES('libro3','editorial2','internet');
INSERT INTO libros(titulo,editorial,area_) VALUES('libro4','editorial3','libro');
INSERT INTO libros(titulo,editorial,area_) VALUES('libro5','editorial4','internet');

INSERT INTO libros_autores(idLibro,idAutor) VALUES(1,1);
INSERT INTO libros_autores(idLibro,idAutor) VALUES(2,2);
INSERT INTO libros_autores(idLibro,idAutor) VALUES(3,3);
INSERT INTO libros_autores(idLibro,idAutor) VALUES(4,4);
INSERT INTO libros_autores(idLibro,idAutor) VALUES(5,5);

INSERT INTO estudiantes(nombre,apellido,direccion,carrera,edad) VALUES ('Filippo Galli','apellido1','direccion1','comunicacion',12);
INSERT INTO estudiantes(nombre,apellido,direccion,carrera,edad) VALUES ('Estudiante2 G','apellido1','direccion2','informatica',21);
INSERT INTO estudiantes(nombre,apellido,direccion,carrera,edad) VALUES ('Estudiante3','apellido2','direccion3','informatica',24);
INSERT INTO estudiantes(nombre,apellido,direccion,carrera,edad) VALUES ('Estudiante4','apellido3','direccion4','informatica',10);
INSERT INTO estudiantes(nombre,apellido,direccion,carrera,edad) VALUES ('Estudiante5','apellido4','direccion5','informatica',8);

INSERT INTO prestamos(idLector,idLibro,fechaPrestamo,fechaDevolucion,devuelto) VALUES(1,1,'2021-07-10','2021-07-16',False);
INSERT INTO prestamos(idLector,idLibro,fechaPrestamo,fechaDevolucion,devuelto) VALUES(1,2,'2021-03-05','2021-05-11',True);
INSERT INTO prestamos(idLector,idLibro,fechaPrestamo,fechaDevolucion,devuelto) VALUES(2,3,'2021-06-16','2021-07-16',True);
INSERT INTO prestamos(idLector,idLibro,fechaPrestamo,fechaDevolucion,devuelto) VALUES(3,4,'2021-02-19','2021-03-11',False);
INSERT INTO prestamos(idLector,idLibro,fechaPrestamo,fechaDevolucion,devuelto) VALUES(4,1,'2021-04-11','2021-05-12',True);




