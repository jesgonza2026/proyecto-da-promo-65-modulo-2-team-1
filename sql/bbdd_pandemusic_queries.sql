-- CONSULTAS EN LA BASE DE DATOS PANDEMUSIC --

USE pandemusic;

-- PANDEMIA --

/* Pregunta 1: ¿Cuántas canciones se registraron en cada periodo del COVID: antes (2018-2019), durante (2020-2021) y después (2022)? */ 

SELECT "antes" AS periodo_covid, FORMAT(COUNT(id_unico), 0, 'de_DE') AS total_canciones -- Etiqueta
	FROM canciones
	WHERE year IN (2018, 2019) -- Filtramos por años específicos

UNION -- Unimos Consultas

SELECT DISTINCT "durante" AS periodo_covid, FORMAT(COUNT(id_unico), 0, 'de_DE') AS total_canciones -- Etiqueta
	FROM canciones
	WHERE year IN (2020, 2021) -- Filtramos por años específicos

UNION -- Unimos Consultas

SELECT DISTINCT "después" AS periodo_covid, FORMAT(COUNT(id_unico), 0, 'de_DE') AS total_canciones -- Etiqueta
	FROM canciones
	WHERE year = 2022; -- Filtramos por años específicos
    
-- OTRA FORMA DE REALIZAR LA CONSULTA

SELECT 
    CASE -- Ponemos etiquetas
        WHEN year IN (2018, 2019) THEN "antes"
        WHEN year IN (2020, 2021) THEN "durante"
        WHEN year = 2022 THEN "después"
    END AS periodo_covid, -- Terminamos CASE
    FORMAT(COUNT(id_unico), 0, 'de_DE') AS total_canciones  -- FORMAT = Separar los números mediante "."
	FROM canciones 
	GROUP BY periodo_covid; -- Agrupamos

/* Pregunta 2: ¿Cuál ha sido la evolución musical por género en las diferentes etapas de la pandemia? */ 

SELECT 
    genre AS Genero,
    FORMAT(COUNT(CASE WHEN year IN (2018, 2019) THEN 1 END), 0, 'de_DE') AS "2018-2019 (Pre)",
    FORMAT(COUNT(CASE WHEN year IN (2020, 2021) THEN 1 END), 0, 'de_DE') AS "2020-2021 (Pandemia)",
    FORMAT(COUNT(CASE WHEN year = 2022 THEN 1 END), 0, 'de_DE') AS "2022 (Post)",
    FORMAT(COUNT(*), 0, 'de_DE') AS total_global
	FROM canciones
	WHERE year BETWEEN 2018 AND 2022
	GROUP BY genre
	ORDER BY total_global DESC;

/* Pregunta 3: ¿Qué artistas pertenecen al género musical Hip Hop? */ 

SELECT a.artista  -- Columna que quiero ver
	FROM artistas AS a  -- Tabla 1 (principal)
		INNER JOIN canciones AS c -- Tabla 2 (contrastar información)
			ON a.artista = c.artist_name -- FK
	WHERE c.genre = "hip-hop"; -- Filtramos
    
-- Ver los géneros musicales distintos
SELECT DISTINCT genre 
	FROM canciones;

-- Prueba de qué si pertenecen todos al mimso género musical
SELECT a.artista, c.genre 
	FROM artistas AS a
		INNER JOIN canciones AS c
			ON a.artista = c.artist_name
	WHERE c.genre =  "hip-hop";

/* Pregunta 4: ¿Qué álbum presenta el mayor número de colaboraciones? ¿Tuvo alguna versión publicada durante la pandemia? */ 

SELECT track_name, year, COUNT(track_name) as canciones
	FROM canciones
	GROUP BY track_name, year
	HAVING year BETWEEN 2020 AND 2021
	ORDER BY canciones DESC
	LIMIT 5;

-- ACTUALIDAD --

/* Pregunta 5: ¿Qué artista es más popular actualmente? */ 

SELECT a.artista, c.track_name AS nombre_cancion, c.genre AS genero_musical, a.biografia, a.similares AS artistas_similares, FORMAT(a.reproducciones, 0, 'de_DE') AS reproducciones -- Columnas que quiero ver
	FROM artistas AS a -- Tabla 1 (principal)
	INNER JOIN canciones AS c -- Tabla 2 (contrastar información)
		ON a.artista = c.artist_name -- FK
	ORDER BY a.reproducciones DESC -- Ordenamos mediante la "popularidad" = reproducciones, de mayor a menor
	LIMIT 1; -- Sólo quiero ver 1 registro

/* Pregunta 6: ¿Cual es el  artista  similar a nuestro artista más popular? */ 

SELECT artista, FORMAT(audiencia, 0, 'de_DE') AS audiencia, FORMAT(reproducciones, 0, 'de_DE') AS reproducciones, similares, biografia   
	FROM artistas
	WHERE similares LIKE "%taylor swift%";










