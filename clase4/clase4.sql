use movies_db;

-- Agregar un género a la tabla genres.
INSERT INTO genres (name, ranking, active)
VALUES ('Documental dramatico', 13, 1);

-- Agregar una película a la tabla movies. 
INSERT INTO movies (title, rating, release_date, awards, genre_id, length)
VALUES ('Oppenheimer', 10.0, '2023-10-10', 0, 1, 220);

-- Asociar a la película del punto 1. genre el género creado en el punto 2.
UPDATE movies
SET genre_id = (SELECT id FROM genres WHERE name = 'Documentary')
WHERE title = 'Oppenheimer';

-- Modificar la tabla actors para que al menos un actor tenga como favorita la película agregada en el punto 1.
-- Jon Bernthal
UPDATE actors
SET favorite_movie_id = (SELECT id FROM movies WHERE title = 'Oppenheimer')
WHERE first_name = 'Jon' AND last_name = 'Bernthal';

-- Crear una tabla temporal copia de la tabla movies.
DROP TABLE IF EXISTS movies_temp;
CREATE TEMPORARY TABLE movies_temp AS
SELECT * FROM movies;

SELECT * FROM movies_temp;

-- Eliminar de esa tabla temporal todas las películas que hayan ganado menos de 5 awards.
DELETE FROM movies_temp
WHERE awards < 5;

-- Obtener la lista de todos los géneros que tengan al menos una película.
SELECT name FROM genres
WHERE id IN (SELECT DISTINCT genre_id FROM movies_temp);

-- Obtener la lista de actores cuya película favorita haya ganado más de 3 awards.
SELECT first_name, last_name FROM actors
WHERE favorite_movie_id IN (SELECT id FROM movies_temp WHERE awards > 3);

-- Crear un índice sobre el nombre en la tabla movies.
CREATE INDEX idx_movies_name ON movies (title);

-- Chequee que el índice fue creado correctamente.
SHOW INDEX FROM movies;

-- En la base de datos movies ¿Existiría una mejora notable al crear índices? Analizar y justificar la respuesta.

-- ¿En qué otra tabla crearía un índice y por qué? Justificar la respuesta