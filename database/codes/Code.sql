/*
    Alumnos: Álvaro Fernández Barrero
             Rubén Catalon Orza
 */

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

ALTER TABLE Salas ADD CONSTRAINT checkTipoProyeccion CHECK(REGEXP_LIKE(tipoProyeccion, '^[2-9]D$'));

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

/*-----------------------------
    TRIGGERS
-----------------------------*/

CREATE OR REPLACE TRIGGER trigger_director_pais_rodaje
BEFORE INSERT OR UPDATE ON Dirige
FOR EACH ROW
DECLARE
    v_coincide INTEGER;
    v_nacionalidad Directores.nacionalidad%TYPE;
BEGIN
    SELECT nacionalidad INTO v_nacionalidad
    FROM Directores
    WHERE id = :NEW.idDirector;

    SELECT COUNT(*)
    INTO v_coincide
    FROM Peliculas
    JOIN PaisRodacion ON Peliculas.id = PaisRodacion.idPelicula
    WHERE Peliculas.id = :NEW.idPelicula AND PaisRodacion.pais = v_nacionalidad;

    IF v_coincide = 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Error: El director (nacionalidad ' || v_nacionalidad || ') no coincide con ningún país de rodaje de la película ' || :NEW.idPelicula);
    END IF;
END trigger_director_pais_rodaje;

CREATE OR REPLACE TRIGGER trigger_check_age_consistency
BEFORE INSERT ON Aparece
FOR EACH ROW
DECLARE
    movieYear Peliculas.anioEmision%TYPE;
    actorAge Actores.edad%TYPE;
    birthYear INT;
    ageAtMovie INT;

BEGIN
    SELECT anioEmision
    INTO movieYear
    FROM Peliculas
    WHERE id = :NEW.idPelicula;

    SELECT edad
    INTO actorAge
    FROM Actores
    WHERE id = :NEW.idActor;

    birthYear := EXTRACT(YEAR FROM SYSDATE) - actorAge;
    ageAtMovie := movieYear - birthYear;

    IF ageAtMovie < 5 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Inconsistencia de edad: el actor tendría menos de 5 años en el año de emisión.');
    END IF;
END;


/*-----------------------------
    REMOVING TRIGGERS
-----------------------------*/

DROP TRIGGER trigger_director_pais_rodaje;
DROP TRIGGER trigger_check_age_consistency;

/*-----------------------------
    INSERT DATA
-----------------------------*/

INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (1, 120, 2020, 'Urbano', 'El Viaje');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (2, 95, 2022, 'Nocturno', 'Misterio Nocturno');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (3, 180, 2019, 'Naturaleza', 'Aventura Extrema');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (4, 88, 2021, 'Interior', 'Comedia Loca');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (5, 150, 2023, 'Urbano', 'Drama Profundo');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (6, 110, 2018, 'Nocturno', 'Sombras en la Noche');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (7, 200, 2017, 'Naturaleza', 'El Último Bosque');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (8, 75, 2024, 'Urbano', 'Carrera Contra el Tiempo');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (9, 130, 2021, 'Interior', 'Secretos de Familia');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (10, 160, 2020, 'Naturaleza', 'Océano Profundo');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (11, 95, 2023, 'Nocturno', 'El Susurro');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (12, 210, 2016, 'Urbano', 'Bajo la Misma Luna');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (13, 85, 2025, 'Interior', 'Risa y Sorpresas');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (14, 145, 2019, 'Naturaleza', 'Montaña Salvaje');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (15, 118, 2022, 'Urbano', 'Amor en Nueva York');

INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (1, 'Española', 45, 'Carlos', 'López', 'García');
INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (2, 'Mexicana', 38, 'María', 'Fernández', 'Ruiz');
INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (3, 'Argentina', 50, 'Jorge', 'Molina', 'Paz');
INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (4, 'Estadounidense', 42, 'Laura', 'Kim', 'Lee');
INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (5, 'Francesa', 55, 'Pierre', 'Dubois', 'Martin');

INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (1, 'Y', 'Española', 30, 'Ana', 'Martínez', 'Pérez');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (2, 'Y', 'Estadounidense', 42, 'John', 'Smith', 'Brown');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (3, 'N', 'Francesa', 25, 'Claire', 'Dubois', 'Leroy');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (4, 'Y', 'Italiana', 55, 'Marco', 'Rossi', 'Bianchi');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (5, 'Y', 'Británica', 35, 'Emma', 'Johnson', 'Williams');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (6, 'Y', 'Mexicana', 28, 'Luis', 'García', 'Torres');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (7, 'Y', 'Canadiense', 48, 'Sophie', 'Tremblay', 'Roy');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (8, 'N', 'Alemana', 60, 'Hans', 'Schmidt', 'Wagner');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (9, 'Y', 'Brasileña', 33, 'Fernanda', 'Souza', 'Lima');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (10, 'Y', 'Japonesa', 27, 'Yuki', 'Tanaka', 'Sato');

INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (1, 'Sonidista', 'Luis', 'Gómez', 'Hernández');
INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (2, 'Camarógrafo', 'Pedro', 'Sánchez', 'Jiménez');
INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (3, 'Iluminador', 'Laura', 'Díaz', 'Martín');
INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (4, 'Editor', 'Miguel', 'Ruiz', 'Flores');
INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (5, 'Maquillador', 'Elena', 'Castro', 'Ortega');

INSERT INTO Guionistas (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (1, 'Serie TV', 'Javier', 'Ramírez', 'Ortega');
INSERT INTO Guionistas (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (2, 'Corto', 'Sofía', 'Castro', 'Luna');
INSERT INTO Guionistas (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (3, 'Documental', 'Pablo', 'Navarro', 'Gil');

INSERT INTO Productores (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (1, 'Publicidad', 'Roberto', 'Mendoza', 'Flores');
INSERT INTO Productores (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (2, 'Teatro', 'Patricia', 'Vega', 'Ríos');
INSERT INTO Productores (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (3, 'Televisión', 'Carmen', 'Serrano', 'Mora');

INSERT INTO Salas (id, tipoProyeccion) VALUES (1, '2D');
INSERT INTO Salas (id, tipoProyeccion) VALUES (2, '3D');
INSERT INTO Salas (id, tipoProyeccion) VALUES (3, '4D');

INSERT INTO PaisRodacion (idPelicula, pais) VALUES (1, 'España');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (1, 'Francia');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (2, 'México');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (3, 'EEUU');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (3, 'Canadá');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (4, 'Italia');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (5, 'Reino Unido');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (6, 'Argentina');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (7, 'Francia');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (8, 'España');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (9, 'México');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (10, 'Australia');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (11, 'Alemania');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (12, 'EEUU');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (13, 'Italia');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (14, 'Canadá');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (15, 'Japón');

INSERT INTO PaisRodacion (idPelicula, pais) VALUES (1, 'Española');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (2, 'Mexicana');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (3, 'Española');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (3, 'Mexicana');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (4, 'Española');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (5, 'Mexicana');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (7, 'Argentina');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (7, 'Española');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (8, 'Estadounidense');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (9, 'Estadounidense');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (10, 'Francesa');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (11, 'Española');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (12, 'Mexicana');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (12, 'Francesa');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (13, 'Argentina');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (14, 'Estadounidense');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (15, 'Francesa');

INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (1, 'Drama');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (1, 'Aventura');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (2, 'Misterio');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (2, 'Terror');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (3, 'Acción');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (3, 'Aventura');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (4, 'Comedia');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (5, 'Drama');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (6, 'Terror');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (6, 'Misterio');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (7, 'Aventura');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (7, 'Drama');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (8, 'Acción');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (9, 'Drama');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (10, 'Documental');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (10, 'Aventura');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (11, 'Suspenso');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (12, 'Romance');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (13, 'Comedia');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (14, 'Aventura');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (15, 'Romance');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (15, 'Drama');

INSERT INTO Aparece (idActor, idPelicula) VALUES (1, 1);
INSERT INTO Aparece (idActor, idPelicula) VALUES (1, 2);
INSERT INTO Aparece (idActor, idPelicula) VALUES (2, 2);
INSERT INTO Aparece (idActor, idPelicula) VALUES (2, 3);
INSERT INTO Aparece (idActor, idPelicula) VALUES (2, 5);
INSERT INTO Aparece (idActor, idPelicula) VALUES (3, 4);
INSERT INTO Aparece (idActor, idPelicula) VALUES (4, 3);
INSERT INTO Aparece (idActor, idPelicula) VALUES (4, 5);
INSERT INTO Aparece (idActor, idPelicula) VALUES (5, 1);
INSERT INTO Aparece (idActor, idPelicula) VALUES (5, 4);
INSERT INTO Aparece (idActor, idPelicula) VALUES (6, 6);
INSERT INTO Aparece (idActor, idPelicula) VALUES (6, 7);
INSERT INTO Aparece (idActor, idPelicula) VALUES (7, 6);
INSERT INTO Aparece (idActor, idPelicula) VALUES (7, 8);
INSERT INTO Aparece (idActor, idPelicula) VALUES (8, 9);
INSERT INTO Aparece (idActor, idPelicula) VALUES (9, 9);
INSERT INTO Aparece (idActor, idPelicula) VALUES (9, 10);
INSERT INTO Aparece (idActor, idPelicula) VALUES (10, 11);
INSERT INTO Aparece (idActor, idPelicula) VALUES (1, 11);
INSERT INTO Aparece (idActor, idPelicula) VALUES (2, 12);
INSERT INTO Aparece (idActor, idPelicula) VALUES (3, 12);
INSERT INTO Aparece (idActor, idPelicula) VALUES (4, 13);
INSERT INTO Aparece (idActor, idPelicula) VALUES (5, 13);
INSERT INTO Aparece (idActor, idPelicula) VALUES (6, 14);
INSERT INTO Aparece (idActor, idPelicula) VALUES (7, 14);
INSERT INTO Aparece (idActor, idPelicula) VALUES (8, 15);
INSERT INTO Aparece (idActor, idPelicula) VALUES (9, 15);
INSERT INTO Aparece (idActor, idPelicula) VALUES (10, 15);

INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (1, 1, 8.50, '10:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (1, 2, 10.00, '18:30');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (2, 2, 9.00, '12:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (2, 3, 12.50, '20:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (3, 1, 7.00, '14:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (3, 3, 11.00, '22:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (4, 1, 6.50, '11:30');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (4, 2, 8.00, '17:45');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (5, 2, 9.50, '15:15');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (5, 3, 13.00, '19:30');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (6, 1, 8.00, '09:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (6, 3, 12.00, '21:15');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (7, 2, 10.50, '16:20');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (8, 1, 7.50, '13:45');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (8, 2, 9.00, '19:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (9, 2, 8.75, '11:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (9, 3, 11.50, '23:30');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (10, 1, 9.00, '10:30');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (10, 3, 14.00, '20:45');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (11, 1, 6.00, '12:15');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (11, 2, 8.50, '17:30');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (12, 2, 9.25, '15:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (12, 3, 12.75, '22:15');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (13, 1, 7.00, '14:30');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (14, 2, 10.00, '18:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (14, 3, 13.50, '21:45');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (15, 1, 8.25, '11:45');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (15, 2, 9.75, '16:15');

INSERT INTO Dirige (idDirector, idPelicula) VALUES (1, 1);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (2, 2);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (1, 3);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (2, 3);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (1, 4);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (2, 5);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (3, 6);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (3, 7);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (4, 8);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (4, 9);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (5, 10);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (1, 11);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (2, 12);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (3, 13);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (4, 14);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (5, 15);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (1, 7);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (5, 12);

/*-----------------------------
    CHECKING INSERTS
-----------------------------*/

SELECT * FROM CuerpoTecnico;
SELECT * FROM Guionistas;
SELECT * FROM Productores;
SELECT * FROM Actores;
SELECT * FROM Directores;
SELECT * FROM Peliculas;
SELECT * FROM Salas;
SELECT * FROM PaisRodacion;
SELECT * FROM GeneroPelicula;
SELECT * FROM Aparece;
SELECT * FROM Dirige;
SELECT * FROM Proyecta;

/*-----------------------------
    DELETING VALUES
-----------------------------*/

DELETE FROM CuerpoTecnico;
DELETE FROM Guionistas;
DELETE FROM Productores;
DELETE FROM Actores;
DELETE FROM Directores;
DELETE FROM Peliculas;
DELETE FROM Salas;
DELETE FROM PaisRodacion;
DELETE FROM GeneroPelicula;
DELETE FROM Aparece;
DELETE FROM Dirige;
DELETE FROM Proyecta;

/*-----------------------------
    VIEWS
-----------------------------*/

-- Cartelera completa con precios y salas
CREATE OR REPLACE VIEW Vista_Cartelera AS
SELECT
    p.id AS pelicula_id,
    p.titulo AS pelicula_titulo,
    s.id AS sala_id,
    s.tipoProyeccion,
    pr.horario,
    pr.precio
FROM Peliculas p
JOIN Proyecta pr ON p.id = pr.idPelicula
JOIN Salas s ON s.id = pr.idSala;

-- Conjunto de directores por película
-- Se trata de una vista explicita porque le avisa al compilador de la base de datos que la declaración del nombre ha terminado y que lo siguiente es la consulta que dará funcion a la vista.
CREATE OR REPLACE VIEW Vista_Directores_Peliculas AS -- es un conector que le dice a Oracle que todo el código que viene a continuación (la consulta SELECT) es la definición de la vista.
SELECT
    p.titulo AS pelicula_titulo,
    d.nombre || ' ' || d.apellido1 || ' ' || d.apellido2 AS nombre_director,
    d.nacionalidad,
    d.edad
FROM Peliculas p
JOIN Dirige dp ON p.id = dp.idPelicula
JOIN Directores d ON d.id = dp.idDirector;

-- Lista de actores aptos y su experiencia
CREATE OR REPLACE VIEW Vista_Actores_Aptos_Productivos AS
SELECT
    a.id AS actor_id,
    a.nombre || ' ' || a.apellido1 AS actor_nombre,
    a.nacionalidad,
    COUNT(ap.idPelicula) AS total_peliculas_aparece
FROM Actores a
LEFT JOIN Aparece ap ON a.id = ap.idActor
WHERE UPPER(a.esApto) = 'Y'
GROUP BY a.id, a.nombre, a.apellido1, a.nacionalidad;

-- Historial de guionistas y productores con experiencia
CREATE OR REPLACE VIEW Vista_Creadores_Experimentados AS
SELECT
    'GUIONISTA' AS rol,
    id,
    nombre || ' ' || apellido1 || ' ' || apellido2 AS nombre_completo,
    trabajoPrevio
FROM Guionistas
WHERE trabajoPrevio IS NOT NULL
UNION ALL
SELECT
    'PRODUCTOR' AS rol,
    id,
    nombre || ' ' || apellido1 || ' ' || apellido2 AS nombre_completo,
    trabajoPrevio
FROM Productores
WHERE trabajoPrevio IS NOT NULL;

-- Ocupación de salas y películas proyectadas
CREATE OR REPLACE VIEW Vista_Ocupacion_Salas AS
SELECT
    s.id AS sala_id,
    s.tipoProyeccion,
    pr.horario,
    p.titulo AS pelicula_titulo,
    p.tipoEscenario,
    gp.genero
FROM Salas s
JOIN Proyecta pr ON s.id = pr.idSala
JOIN Peliculas p ON p.id = pr.idPelicula
LEFT JOIN GeneroPelicula gp ON p.id = gp.idPelicula;

/*-----------------------------
    QUERIES
-----------------------------*/

-- 1. Seleccion basica: Listar todos los actores.
SELECT * FROM Actores;

-- 2. Filtrado simple: Obtener películas emitidas después del año 2010.
SELECT titulo, anioEmision FROM Peliculas
WHERE anioEmision > 2010;

-- 3. Orden: Listar directores por edad de forma descendente.
SELECT nombre, apellido1, edad FROM Directores
ORDER BY edad DESC;

-- 4. No repetir datos: Listar todas las nacionalidades distintas de los directores.
SELECT DISTINCT nacionalidad FROM Directores;

-- 5. Contar: Cuantas peliculas hay registradas en total?
SELECT COUNT(*) AS total_peliculas FROM Peliculas;

-- 6. Filtrar con texto: Buscar actores con nombres que empiece por 'A'.
SELECT nombre, apellido1 FROM Actores
WHERE nombre LIKE 'A%';

-- 7. Rango: Peliculas con duración entre 90 y 120 minutos.
SELECT titulo, duracion FROM Peliculas
WHERE duracion BETWEEN 90 AND 120;

-- 8. INNER JOIN basico Listar el titulo de la pelicula y su genero.
SELECT p.titulo, g.genero
FROM Peliculas p
INNER JOIN GeneroPelicula g ON p.id = g.idPelicula;

-- 9. JOIN de tres tablas: Listar nombres de directores y las peliculas que han dirigido.
SELECT d.nombre, d.apellido1, p.titulo
FROM Directores d
JOIN Dirige di ON d.id = di.idDirector
JOIN Peliculas p ON di.idPelicula = p.id;

-- 10. Agrupar: Contar cuantas peliculas hay por cada genero.
SELECT genero, COUNT(*) as cantidad
FROM GeneroPelicula
GROUP BY genero;

-- 11. Filtrar grupos: Generos que tienen mas de 5 peliculas.
SELECT genero, COUNT(*) as cantidad
FROM GeneroPelicula
GROUP BY genero
HAVING COUNT(*) > 5;

-- 12. Calculos aritmeticos: Mostrar el precio de las salas con un 21% de IVA incluido.
SELECT idSala, precio AS precio_base, (precio * 1.21) AS precio_con_iva
FROM Proyecta;

-- 13. Subconsulta: Actores que participan en la pelicula con id 1.
SELECT nombre, apellido1
FROM Actores
WHERE id IN (SELECT idActor FROM Aparece WHERE idPelicula = 1);

-- 14. LEFT JOIN: Listar todas las salas y que peliculas proyectan.
SELECT s.id, s.tipoProyeccion, p.idPelicula
FROM Salas s
LEFT JOIN Proyecta p ON s.id = p.idSala;

-- 15. Consulta compleja: Actores aptos ('Y') que han trabajado en peliculas de genero 'Drama'.
SELECT DISTINCT a.nombre, a.apellido1
FROM Actores a
JOIN Aparece ap ON a.id = ap.idActor
JOIN GeneroPelicula g ON ap.idPelicula = g.idPelicula
WHERE a.esApto = 'Y' AND g.genero = 'Drama';

/*-----------------------------
    CURSORS
-----------------------------*/

-- Recorrer y que muestre películas por un año específico (Cursor explícito con parámetros)
DECLARE
    CURSOR c_peliculas_anio(p_anio INT) IS
        SELECT titulo, duracion
        FROM Peliculas
        WHERE anioEmision = p_anio;

    -- Variable de registro basada en la estructura del cursor
    v_pelicula c_peliculas_anio%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- PELÍCULAS DEL AÑO 2024 ---');
    OPEN c_peliculas_anio(2024); -- Pasamos el año como argumento
    LOOP
        FETCH c_peliculas_anio INTO v_pelicula;
        EXIT WHEN c_peliculas_anio%NOTFOUND; -- Rompe el ciclo si ya no hay filas

        DBMS_OUTPUT.PUT_LINE('Título: ' || v_pelicula.titulo || ' | Duración: ' || v_pelicula.duracion || ' min.');
    END LOOP;
    CLOSE c_peliculas_anio;
END;

-- Aumento de precio en proyecciones nocturnas (Cursor con FOR UPDATE)
DECLARE
    CURSOR c_proyecciones_tarde IS
        SELECT precio
        FROM Proyecta
        WHERE horario = '22:00'
        FOR UPDATE OF precio; -- Bloquea las filas para modificación
BEGIN
    FOR r_proy IN c_proyecciones_tarde LOOP
        UPDATE Proyecta
        SET precio = r_proy.precio * 1.10 -- Incremento del 10%
        WHERE CURRENT OF c_proyecciones_tarde; -- Modifica exactamente la fila actual del cursor
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Precios nocturnos actualizados con éxito.');
END;

-- Informe de actores jóvenes (Cursor implícito en un bucle FOR)
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- INFORME DE ACTORES MENORES DE 25 AÑOS ---');
    FOR r_actor IN (SELECT nombre, apellido1, edad, nacionalidad FROM Actores WHERE edad < 25) LOOP
        DBMS_OUTPUT.PUT_LINE('Actor: ' || r_actor.nombre || ' ' || r_actor.apellido1 || ' | Edad: ' || r_actor.edad || ' | País: ' || r_actor.nacionalidad);
    END LOOP;
END;

-- Listado de directores mayores de 50 Años (Cursor Explícito)
DECLARE
    CURSOR c_directores_viejos IS
        SELECT nombre, apellido1, edad
        FROM Directores
        WHERE edad > 50;

    v_nombre VARCHAR2(20);
    v_apellido VARCHAR2(20);
    v_edad INT;
    v_total_viejos INT := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- DIRECTORES MAYORES DE 50 AÑOS ---');

    OPEN c_directores_viejos;
    LOOP
        FETCH c_directores_viejos INTO v_nombre, v_apellido, v_edad;
        EXIT WHEN c_directores_viejos%NOTFOUND; -- Control manual de salida

        v_total_viejos := v_total_viejos + 1;
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre || ' ' || v_apellido || ' | Edad: ' || v_edad);
    END LOOP;
    CLOSE c_directores_viejos;

    DBMS_OUTPUT.PUT_LINE('Total de directores veteranos encontrados: ' || v_total_viejos);
END;

-- Reporte de películas cortas (Cursor implícito con FOR)
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- LISTADO DE PELÍCULAS CORTAS (MENOS DE 90 MINUTOS) ---');

    -- El cursor es la subconsulta dentro del paréntesis
    FOR r_peli IN (SELECT titulo, duracion FROM Peliculas WHERE duracion < 90) LOOP
        DBMS_OUTPUT.PUT_LINE('Película: ' || r_peli.titulo || ' | Duración exacta: ' || r_peli.duracion || ' min.');
    END LOOP;
END;

/*-----------------------------
    FUNCTIONS
-----------------------------*/

-- Calcular la recaudación estimada de una sala
CREATE OR REPLACE FUNCTION fn_recaudacion_estimada_sala(p_sala_id INT)
RETURN NUMBER IS
    v_precio NUMBER(4,2) := 0;
    v_capacidad_estandar INT := 50;
    v_total NUMBER(8,2) := 0;
BEGIN
    -- Buscamos el precio que tiene a la proyección en esa sala
    SELECT precio INTO v_precio
    FROM Proyecta
    WHERE idSala = p_sala_id AND ROWNUM <= 1;  -- La funcion de rownum es asignarle un número secuencial (1, 2, 3, etc.) a cada fila que va resultando de una consulta

    v_total := v_precio * v_capacidad_estandar;
    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0; -- Si la sala no está proyectando nada, la recaudación es 0
END fn_recaudacion_estimada_sala;

-- Obtener el total de minutos de un director
CREATE OR REPLACE FUNCTION fn_minutos_totales_director(p_director_id INT)
RETURN INT IS
    v_minutos_totales INT := 0;
BEGIN
    SELECT NVL(SUM(p.duracion), 0) INTO v_minutos_totales -- NVL el objetivo principal es reemplazar un valor NULL (vacío o desconocido) por un valor alternativo que elijas (en este caso, es un 0).
                                                          -- Y en este caso sirve para que cuando se ejecute la funcion y en vez de que se imprima null pues que sea 0
    FROM Peliculas p
    JOIN Dirige d ON p.id = d.idPelicula
    WHERE d.idDirector = p_director_id;

    RETURN v_minutos_totales;
END fn_minutos_totales_director;

-- Verificar si hay disponibilidad de horario en sala
CREATE OR REPLACE FUNCTION fn_sala_disponible(p_sala_id INT, p_horario VARCHAR2)
RETURN VARCHAR2 IS
    v_conteo INT;
BEGIN
    SELECT COUNT(*) INTO v_conteo
    FROM Proyecta
    WHERE idSala = p_sala_id AND horario = p_horario;

    IF v_conteo > 0 THEN
        RETURN 'NO'; -- La sala está ocupada
    ELSE
        RETURN 'SÍ'; -- La sala está libre
    END IF;
END fn_sala_disponible;

-- Calcular la edad promedio del grupo de una película
CREATE OR REPLACE FUNCTION fn_edad_promedio_elenco(p_pelicula_id INT)
RETURN NUMBER IS
    v_edad_promedio NUMBER(4,1) := 0; -- (4,1) Significa que el primer número (4) es la Precisión: Es la cantidad total máxima de dígitos que puede tener el número.
                                            -- El segundo número (1) es la Escala: Que es la cantidad fija de dígitos que se guardarán a la derecha del punto decimal.
                                      -- := 0
BEGIN
    SELECT NVL(AVG(a.edad), 0) INTO v_edad_promedio
    FROM Actores a
    JOIN Aparece ap ON a.id = ap.idActor
    WHERE ap.idPelicula = p_pelicula_id;

    RETURN v_edad_promedio;
END fn_edad_promedio_elenco;

-- Contar películas por país de rodaje
CREATE OR REPLACE FUNCTION fn_total_peliculas_pais(p_pais VARCHAR2)
RETURN INT IS
    v_total INT := 0;
BEGIN
    SELECT COUNT(*) INTO v_total
    FROM PaisRodacion
    WHERE UPPER(pais) = UPPER(p_pais);

    RETURN v_total;
END fn_total_peliculas_pais;

/*-----------------------------
    PROCEDURES
-----------------------------*/

-- Registrar una nueva Película con validación
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE pr_registrar_pelicula(
    p_id INT,
    p_duracion INT,
    p_anio INT,
    p_tipo_escenario VARCHAR2,
    p_titulo VARCHAR2
) IS
    -- Excepción personalizada
    e_duracion_invalida EXCEPTION;
BEGIN
    -- Validación previa para las restricciones CHECK
    IF p_duracion <= 0 THEN
        RAISE e_duracion_invalida;
    END IF;

    -- Intentamos insertar el registro
    INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo)
    VALUES (p_id, p_duracion, p_anio, p_tipo_escenario, p_titulo);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Película "' || p_titulo || '" registrada exitosamente con ID: ' || p_id);

EXCEPTION
    WHEN e_duracion_invalida THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: La duración de la película debe ser mayor a 0 minutos.');
    WHEN DUP_VAL_ON_INDEX THEN
        -- Excepción predefinida de Oracle si el ID ya existe (Primary Key)
        DBMS_OUTPUT.PUT_LINE('ERROR: Ya existe una película registrada con el ID ' || p_id);
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR INESPERADO: ' || SQLERRM);
END pr_registrar_pelicula;

-- Asignar actor a grupo con verificacion
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE pr_asignar_actor_grupo(
    p_actor_id INT,
    p_pelicula_id INT
) IS
    v_es_apto VARCHAR2(1);
    e_actor_no_apto EXCEPTION;
BEGIN
    -- Buscamos si el actor existe y cuál es su estado de aptitud
    SELECT UPPER(esApto) INTO v_es_apto
    FROM Actores
    WHERE id = p_actor_id;

    -- Si no es apto, lanzamos nuestra excepción
    IF v_es_apto != 'Y' THEN
        RAISE e_actor_no_apto;
    END IF;

    -- Si pasa la validación, lo vinculamos a la película
    INSERT INTO Aparece (idActor, idPelicula)
    VALUES (p_actor_id, p_pelicula_id);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Actor ID ' || p_actor_id || ' asignado correctamente a la película ID ' || p_pelicula_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El Actor con ID ' || p_actor_id || ' no existe en la base de datos.');
    WHEN e_actor_no_apto THEN
        DBMS_OUTPUT.PUT_LINE('ALERTA: Inserción rechazada. El actor no cuenta con la certificación de APTITUD (esApto = N).');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El actor ya se encuentra asignado a esta película.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: No se pudo completar la operación debido a un fallo en el sistema.');
END pr_asignar_actor_grupo;

-- Aplicar descuento masivo a precios de proyecciones (Usamos cursores)
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE pr_descuento_horario_masivo(
    p_horario VARCHAR2,
    p_monto_descuento NUMBER
) IS
    -- Declaramos un cursor explícito para buscar las proyecciones de ese horario
    CURSOR c_proyecciones IS
        SELECT idSala, idPelicula, precio
        FROM Proyecta
        WHERE horario = p_horario;

    v_nuevo_precio NUMBER(4,2);
    v_contador INT := 0;
BEGIN
    -- Recorremos las proyecciones usando un bucle FOR de cursor
    FOR r_proy IN c_proyecciones LOOP
        -- Calculamos el nuevo precio asegurándonos de que no sea menor a 0
        v_nuevo_precio := r_proy.precio - p_monto_descuento;
        IF v_nuevo_precio < 0 THEN
            v_nuevo_precio := 0;
        END IF;

        -- Actualizamos la fila
        UPDATE Proyecta
        SET precio = v_nuevo_precio
        WHERE idSala = r_proy.idSala AND idPelicula = r_proy.idPelicula;

        v_contador := v_contador + 1;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Proceso terminado. Se aplicó el descuento a ' || v_contador || ' proyecciones del horario ' || p_horario);

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: Se canceló la actualización masiva por un error inesperado.');
END pr_descuento_horario_masivo;

-- Cambiar horario de proyección con validación de mutación
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE pr_cambiar_horario_funcion(
    p_pelicula_id INT,
    p_sala_id INT,
    p_nuevo_horario VARCHAR2
) IS
BEGIN
    UPDATE Proyecta
    SET horario = p_nuevo_horario
    WHERE idPelicula = p_pelicula_id AND idSala = p_sala_id;

    -- Si el UPDATE no afecta a ninguna fila, es que la función no existía
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('AVISO: No se encontró ninguna proyección para la película ' || p_pelicula_id || ' en la sala ' || p_sala_id);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('ÉXITO: Horario actualizado correctamente a las ' || p_nuevo_horario);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR INESPERADO: ' || SQLERRM);
END pr_cambiar_horario_funcion;

-- Eliminar un actor del sistema de forma segura
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE pr_dar_de_baja_actor(p_actor_id INT) IS
BEGIN
    -- Borramos sus asignaciones en los grupos para evitar fallos de clave foránea
    DELETE FROM Aparece WHERE idActor = p_actor_id;

    -- Ahora borramos al actor de su tabla principal
    DELETE FROM Actores WHERE id = p_actor_id;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El ID de actor ' || p_actor_id || ' no existe.');
        ROLLBACK;
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('ÉXITO: El actor y todo su historial de elencos fueron eliminados.');
    END IF;
END pr_dar_de_baja_actor;/