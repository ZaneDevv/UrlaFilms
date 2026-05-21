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

