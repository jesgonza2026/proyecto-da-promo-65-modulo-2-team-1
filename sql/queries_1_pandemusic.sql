USE pandemusic;

ALTER TABLE tabla_artistas_canciones
	RENAME TO canciones;
 
ALTER TABLE tabla_artistas_limpia
	RENAME TO artistas;
    
SELECT genre AS genero, COUNT(genre) AS canciones_totales
FROM canciones
WHERE year BETWEEN 2018 AND 2019
GROUP BY genre
ORDER BY canciones_totales DESC;

SELECT genre AS genero, COUNT(genre) AS canciones_totales
FROM canciones
WHERE year BETWEEN 2020 AND 2021
GROUP BY genre
ORDER BY canciones_totales DESC;
-- Con esto vemos que HipHop como genero fue el que mas lanzamientos de canciones tuvo durante el periodo de pandemia y post pandemia. La diferencia es de casi el doble, que es importante. 
SELECT genre AS genero, COUNT(genre) AS canciones_totales
FROM canciones
WHERE year = 2022
GROUP BY genre
ORDER BY canciones_totales DESC;
-- Vemos un declive de HipHop en Post Pandemia en comparacion con anteriores 

SELECT a.genre AS genero, COUNT(a.genre) AS canciones_totales, b.genre AS genero, COUNT(b.genre) AS canciones_totales, c.genre AS genero, COUNT(c.genre) AS canciones_totales
FROM canciones as a
INNER JOIN canciones as b 
ON a.id_unico = b.id_unico 
INNER JOIN canciones as c
ON c.id_unico = c.id_unico 
GROUP BY a.genre, b.genre, c.genre
ORDER BY canciones_totales DESC
LIMIT 10;
-- esto nos da error 

SELECT year as año, COUNT(id_unico)
FROM canciones
GROUP BY year;
-- Hay un pico en el periodo de la pandemia de canciones publicadas, y ya en el periodo post pandemia bajo por debajo de 2018

SELECT genre AS genero, year AS año, COUNT(id_unico)
FROM canciones
GROUP BY year, genre;

SELECT 
    genre AS Genero,
    COUNT(CASE WHEN year IN (2018, 2019) THEN 1 END) AS '2018-2019 (Pre)',
    COUNT(CASE WHEN year IN (2020, 2021) THEN 1 END) AS '2020-2021 (Pandemia)',
    COUNT(CASE WHEN year = 2022 THEN 1 END) AS '2022 (Post)',
    COUNT(*) AS Total_Global
FROM canciones
WHERE year BETWEEN 2018 AND 2022
GROUP BY genre
ORDER BY Total_Global DESC;




