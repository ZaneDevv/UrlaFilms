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