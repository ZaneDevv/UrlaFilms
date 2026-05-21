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
END pr_asignar_actor_elenco;

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
END pr_dar_de_baja_actor;
