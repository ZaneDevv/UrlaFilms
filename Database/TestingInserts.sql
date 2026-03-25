/*-----------------------------
    INSERT DATA
-----------------------------*/

-- Insert into CuerpoTecnico (5 records)
INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (1, 'Sonidista', 'Juan', 'Pérez', 'García');
INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (2, 'Maquillador', 'Ana', 'Martínez', 'López');
INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (3, 'Iluminador', 'Luis', 'Rodríguez', 'Fernández');
INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (4, 'Camarógrafo', 'Marta', 'Sánchez', 'Ruiz');
INSERT INTO CuerpoTecnico (id, profesion, nombre, apellido1, apellido2) VALUES (5, 'Editor', 'Pedro', 'Gómez', 'Díaz');

-- Insert into Guionistas (5 records)
INSERT INTO Guionistas (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (1, 'Casa de papel', 'Laura', 'Jiménez', 'Ortega');
INSERT INTO Guionistas (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (2, NULL, 'Carlos', 'Ruiz', 'Mendoza');
INSERT INTO Guionistas (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (3, 'El secreto de sus ojos', 'Elena', 'Flores', 'Vega');
INSERT INTO Guionistas (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (4, 'Contratiempo', 'Ricardo', 'Castro', 'Silva');
INSERT INTO Guionistas (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (5, NULL, 'Sofía', 'Molina', 'Rojas');

-- Insert into Productores (5 records)
INSERT INTO Productores (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (1, 'El laberinto del fauno', 'José', 'López', 'Torres');
INSERT INTO Productores (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (2, 'Amores perros', 'María', 'García', 'Herrera');
INSERT INTO Productores (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (3, NULL, 'David', 'Fernández', 'Cruz');
INSERT INTO Productores (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (4, 'Todo sobre mi madre', 'Lucía', 'Ramírez', 'Morales');
INSERT INTO Productores (id, trabajoPrevio, nombre, apellido1, apellido2) VALUES (5, 'Volver', 'Miguel', 'Álvarez', 'Paredes');

-- Insert into Actores (5 records)
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (1, 'Y', 'Española', 35, 'Javier', 'Bardem', 'Cruz');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (2, 'Y', 'Mexicana', 42, 'Gael', 'García', 'Bernal');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (3, 'N', 'Argentina', 28, 'Ricardo', 'Darín', 'González');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (4, 'Y', 'Colombiana', 31, 'Sofía', 'Vergara', 'Pérez');
INSERT INTO Actores (id, esApto, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (5, 'N', 'Chilena', 26, 'Pedro', 'Pascal', 'Martínez');

-- Insert into Directores (5 records)
INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (1, 'Española', 55, 'Pedro', 'Almodóvar', 'Caballero');
INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (2, 'Mexicana', 48, 'Alejandro', 'González', 'Iñárritu');
INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (3, 'Argentina', 62, 'Juan', 'Campanella', 'Ríos');
INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (4, 'Colombiana', 41, 'Ciro', 'Guerra', 'Vásquez');
INSERT INTO Directores (id, nacionalidad, edad, nombre, apellido1, apellido2) VALUES (5, 'Chilena', 39, 'Pablo', 'Larraín', 'Maturana');

-- Insert into Peliculas (5 records)
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (1, 120, 2021, 'Exteriores', 'El camino');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (2, 95, 2022, 'Interiores', 'Sombras');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (3, 145, 2020, 'Mixto', 'Última función');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (4, 110, 2023, 'Exteriores', 'Mar abierto');
INSERT INTO Peliculas (id, duracion, anioEmision, tipoEscenario, titulo) VALUES (5, 88, 2019, 'Interiores', 'Reflejos');

-- Insert into Salas (5 records)
INSERT INTO Salas (id, tipoProyeccion) VALUES (1, '2D');
INSERT INTO Salas (id, tipoProyeccion) VALUES (2, '3D');
INSERT INTO Salas (id, tipoProyeccion) VALUES (3, '2D');
INSERT INTO Salas (id, tipoProyeccion) VALUES (4, '3D');
INSERT INTO Salas (id, tipoProyeccion) VALUES (5, '4D');

-- Insert into PaisRodacion (5 records, referencing Peliculas)
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (1, 'España');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (2, 'México');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (3, 'Argentina');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (4, 'Colombia');
INSERT INTO PaisRodacion (idPelicula, pais) VALUES (5, 'Chile');

-- Insert into GeneroPelicula (5 records, referencing Peliculas)
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (1, 'Drama');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (2, 'Suspenso');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (3, 'Comedia');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (4, 'Aventura');
INSERT INTO GeneroPelicula (idPelicula, genero) VALUES (5, 'Terror');

-- Insert into Aparece (5 records, linking Actores and Peliculas)
INSERT INTO Aparece (idActor, idPelicula) VALUES (1, 1);
INSERT INTO Aparece (idActor, idPelicula) VALUES (2, 2);
INSERT INTO Aparece (idActor, idPelicula) VALUES (3, 3);
INSERT INTO Aparece (idActor, idPelicula) VALUES (4, 4);
INSERT INTO Aparece (idActor, idPelicula) VALUES (5, 5);

-- Insert into Dirige (5 records, linking Directores and Peliculas)
INSERT INTO Dirige (idDirector, idPelicula) VALUES (1, 1);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (2, 2);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (3, 3);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (4, 4);
INSERT INTO Dirige (idDirector, idPelicula) VALUES (5, 5);

-- Insert into Proyecta (5 records, linking Peliculas and Salas)
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (1, 1, 7.50, '16:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (2, 2, 9.00, '18:30');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (3, 3, 6.75, '20:15');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (4, 4, 12.00, '22:00');
INSERT INTO Proyecta (idPelicula, idSala, precio, horario) VALUES (5, 5, 10.50, '21:45');

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