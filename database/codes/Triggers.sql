/*-----------------------------
    TRIGGERS
-----------------------------*/

CREATE OR REPLACE TRIGGER trigger_peliculas_director
BEFORE INSERT ON Peliculas
FOR EACH ROW
DECLARE
    directorsAmount INT := 0;

BEGIN
    SELECT COUNT(*)
    INTO directorsAmount
    FROM Dirige
    INNER JOIN Directores ON Directores.id = Dirige.idDirector
    WHERE Dirige.idPelicula = :NEW.id;

    IF directorsAmount = 0 THEN
        RAISE_APPLICATION_ERROR(-2001, 'Movie has no directors!');
    END IF;
END;

CREATE OR REPLACE TRIGGER trigger_check_age_consistency
BEFORE INSERT ON Aparece
FOR EACH ROW
DECLARE
    movieYear Peliculas.anioEmision%TYPE;
    actorAge Actores.edad%TYPE;

BEGIN
    SELECT anioEmision
    INTO movieYear
    FROM Aparece
    INNER JOIN Peliculas ON Peliculas.id = Aparece.idPelicula
    WHERE Aparece.idPelicula = :NEW.idPelicula AND Aparece.idActor = :NEW.idActor;

    SELECT edad
    INTO actorAge
    FROM Aparece
    INNER JOIN Actores ON Actores.id = Aparece.idActor
    WHERE Aparece.idPelicula = :NEW.idPelicula AND Aparece.idActor = :NEW.idActor;

    IF TO_CHAR(SYSDATE, 'YYYY') - actorAge + 5 < movieYear THEN
        RAISE_APPLICATION_ERROR(-2002, 'Age inconsinstency!');
    END IF;
END;

/*-----------------------------
    REMOVING TRIGGERS
-----------------------------*/

DROP TRIGGER trigger_peliculas_director;
DROP TRIGGER trigger_check_age_consistency;