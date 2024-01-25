use movies_db;

-- Mostrar el título y el nombre del género de todas las series.
SELECT m.title, g.name FROM movies m 
JOIN genres g ON m.genre_id = g.id;

-- Mostrar el título de los episodios, el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT e.title as "Episode Title", a.first_name as "Actor name", a.last_name as "Actor last name" FROM episodes e 
JOIN actor_episode ae ON e.id = ae.episode_id 
JOIN actors a ON ae.actor_id = a.id;

-- Mostrar el título de todas las series y el total de temporadas que tiene cada una de ellas.
SELECT series.title, COUNT(seasons.id) FROM series
JOIN  seasons ON series.id = seasons.serie_id
GROUP BY series.id

-- Mostrar el nombre de todos los géneros y la cantidad total de películas por cada uno, siempre que sea mayor o igual a 3.
SELECT g.name, COUNT(m.id) as total FROM genres g
JOIN movies m ON m.genre_id = g.id
GROUP BY g.id
HAVING total >= 3;

-- Mostrar sólo el nombre y apellido de los actores que trabajan en todas las películas de la guerra de las galaxias y que estos no se repitan.
SELECT DISTINCT a.first_name, a.last_name FROM actors a 
JOIN actor_movie am ON a.id = am.actor_id
JOIN movies m ON am.movie_id = m.id
WHERE m.title LIKE "La Guerra de las galaxias%";

use biblioteca;

-- Listar los datos de los autores.
-- Listar nombre y edad de los estudiantes
-- ¿Qué estudiantes pertenecen a la carrera informática?
-- ¿Qué autores son de nacionalidad francesa o italiana?
-- ¿Qué libros no son del área de internet?
-- Listar los libros de la editorial Salamandra.
-- Listar los datos de los estudiantes cuya edad es mayor al promedio.
-- Listar los nombres de los estudiantes cuyo apellido comience con la letra G.
-- Listar los autores del libro “El Universo: Guía de viaje”. (Se debe listar solamente los nombres).
-- ¿Qué libros se prestaron al lector “Filippo Galli”?
-- Listar el nombre del estudiante de menor edad.
SELECT e.nombre FROM estudiantes e 
WHERE e.edad = (SELECT MIN(e2.edad) FROM estudiantes e2);

-- Listar nombres de los estudiantes a los que se prestaron libros de Base de Datos.
-- Listar los libros que pertenecen a la autora J.K. Rowling.
-- Listar títulos de los libros que debían devolverse el 16/07/2021.