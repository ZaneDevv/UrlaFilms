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
