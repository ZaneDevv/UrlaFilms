/*-----------------------------
    CREATING TABLES
-----------------------------*/

-- Entities

CREATE TABLE CuerpoTecnico(
    id INT NOT NULL,
    profesion VARCHAR2(100) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    apellido1 VARCHAR2(20) NOT NULL,
    apellido2 VARCHAR2(20) NOT NULL
);

CREATE TABLE Guionistas(
    id INT NOT NULL,
    trabajoPrevio VARCHAR2(100),
    nombre VARCHAR2(20) NOT NULL,
    apellido1 VARCHAR2(20) NOT NULL,
    apellido2 VARCHAR2(20) NOT NULL
);

CREATE TABLE Productores(
    id INT NOT NULL,
    trabajoPrevio VARCHAR2(100),
    nombre VARCHAR2(20) NOT NULL,
    apellido1 VARCHAR2(20) NOT NULL,
    apellido2 VARCHAR2(20) NOT NULL
);

CREATE TABLE Actores(
    id INT NOT NULL,
    esApto VARCHAR2(1) NOT NULL,
    nacionalidad VARCHAR2(20) NOT NULL,
    edad INT NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    apellido1 VARCHAR2(20) NOT NULL,
    apellido2 VARCHAR2(20) NOT NULL
);

CREATE TABLE Directores(
    id INT NOT NULL,
    nacionalidad VARCHAR2(20) NOT NULL,
    edad INT NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    apellido1 VARCHAR2(20) NOT NULL,
    apellido2 VARCHAR2(20) NOT NULL
);

CREATE TABLE Peliculas(
    id INT NOT NULL,
    duracion INT NOT NULL,
    anioEmision INT,
    tipoEscenario VARCHAR2(100),
    titulo VARCHAR2(50)
);

CREATE TABLE Salas(
    id INT NOT NULL,
    tipoProyeccion VARCHAR2(2) NOT NULL
);

-- Multievaluated attributes

CREATE TABLE PaisRodacion(
    idPelicula INT NOT NULL,
    pais VARCHAR2(50)
);

CREATE TABLE GeneroPelicula(
    idPelicula INT NOT NULL,
    genero VARCHAR2(20)
);

-- Relations

CREATE TABLE Aparece(
    idActor INT NOT NULL,
    idPelicula INT NOT NULL
);

CREATE TABLE Dirige(
    idDirector INT NOT NULL,
    idPelicula INT NOT NULL
);

CREATE TABLE Proyecta(
    idPelicula INT NOT NULL,
    idSala INT NOT NULL,
    precio NUMBER(4, 2),
    horario VARCHAR2(5)
);

/*-----------------------------
    ADDING KEYS
-----------------------------*/

-- Primary keys

ALTER TABLE CuerpoTecnico ADD CONSTRAINT cuerpoTecnicoPrimaryKey PRIMARY KEY(id);
ALTER TABLE Guionistas ADD CONSTRAINT guionistasPrimaryKey PRIMARY KEY(id);
ALTER TABLE Productores ADD CONSTRAINT productoresPrimaryKey PRIMARY KEY(id);
ALTER TABLE Actores ADD CONSTRAINT actoresPrimaryKey PRIMARY KEY(id);
ALTER TABLE Directores ADD CONSTRAINT directoresPrimaryKey PRIMARY KEY(id);
ALTER TABLE Peliculas ADD CONSTRAINT peliculasPrimaryKey PRIMARY KEY(id);
ALTER TABLE Salas ADD CONSTRAINT salasPrimaryKey PRIMARY KEY(id);
ALTER TABLE PaisRodacion ADD CONSTRAINT paisRodacionPrimaryKey PRIMARY KEY(idPelicula, pais);
ALTER TABLE GeneroPelicula ADD CONSTRAINT generoPeliculaPrimaryKey PRIMARY KEY(idPelicula, genero);
ALTER TABLE Aparece ADD CONSTRAINT aparecePrimaryKey PRIMARY KEY(idActor, idPelicula);
ALTER TABLE Dirige ADD CONSTRAINT dirigePrimaryKey PRIMARY KEY(idDirector, idPelicula);
ALTER TABLE Proyecta ADD CONSTRAINT proyectaPrimaryKey PRIMARY KEY(idPelicula, idSala);

-- Foreign keys

ALTER TABLE PaisRodacion ADD CONSTRAINT paisRodacionPeliculaForeignKey FOREIGN KEY(idPelicula) REFERENCES Peliculas(id);

ALTER TABLE GeneroPelicula ADD CONSTRAINT generoPeliculaForeignKey FOREIGN KEY(idPelicula) REFERENCES Peliculas(id);

ALTER TABLE Aparece ADD CONSTRAINT apareceActorForeignKey FOREIGN KEY(idActor) REFERENCES Actores(id);
ALTER TABLE Aparece ADD CONSTRAINT apareceEnPeliculaForeignKey FOREIGN KEY(idPelicula) REFERENCES Peliculas(id);

ALTER TABLE Dirige ADD CONSTRAINT dirigidoPorDirectorForeignKey FOREIGN KEY(idDirector) REFERENCES Directores(id);
ALTER TABLE Dirige ADD CONSTRAINT dirigePeliculaForeignKey FOREIGN KEY(idPelicula) REFERENCES Peliculas(id);

ALTER TABLE Proyecta ADD CONSTRAINT proyectaPeliculaForeignKey FOREIGN KEY(idPelicula) REFERENCES Peliculas(id);
ALTER TABLE Proyecta ADD CONSTRAINT proyectaEnSalaForeignKey FOREIGN KEY(idSala) REFERENCES Salas(id);

/*-----------------------------
    CHECKS
-----------------------------*/

ALTER TABLE Salas ADD CONSTRAINT checkTipoProyeccion CHECK(REGEXP_LIKE(tipoProyeccion, '^[0-9]D$'));

ALTER TABLE Actores ADD CONSTRAINT checkEsApto CHECK(UPPER(esApto) IN ('Y', 'N'));
ALTER TABLE Actores ADD CONSTRAINT checkActoresEdad CHECK(edad > 0 AND edad < 65);

ALTER TABLE Directores ADD CONSTRAINT checkDirectoresEdad CHECK(edad > 0 AND edad < 65);

ALTER TABLE Peliculas ADD CONSTRAINT checkDuracion CHECK(duracion > 0);
ALTER TABLE Peliculas ADD CONSTRAINT checkAnioEmision CHECK(anioEmision > 0);

/*-----------------------------
    CHECKING TABLES
-----------------------------*/

DESCRIBE CuerpoTecnico;
DESCRIBE Guionistas;
DESCRIBE Productores;
DESCRIBE Actores;
DESCRIBE Directores;
DESCRIBE Peliculas;
DESCRIBE Salas;
DESCRIBE PaisRodacion;
DESCRIBE GeneroPelicula;
DESCRIBE Aparece;
DESCRIBE Dirige;
DESCRIBE Proyecta;

/*-----------------------------
    REMOVING TABLES
-----------------------------*/

DROP TABLE CuerpoTecnico;
DROP TABLE Guionistas;
DROP TABLE Productores;
DROP TABLE Actores;
DROP TABLE Directores;
DROP TABLE Peliculas;
DROP TABLE Salas;
DROP TABLE PaisRodacion;
DROP TABLE GeneroPelicula;
DROP TABLE Aparece;
DROP TABLE Dirige;
DROP TABLE Proyecta;