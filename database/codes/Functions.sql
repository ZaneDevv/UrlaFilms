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
    WHERE idSala = p_sala_id AND ROWNUM = 1;  -- La funcion de rownum es asignarle un número secuencial (1, 2, 3, etc.) a cada fila que va resultando de una consulta
    
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
