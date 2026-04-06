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