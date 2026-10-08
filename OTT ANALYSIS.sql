USE OTT;
SELECT  * FROM NETFLIX;
DESCRIBE NETFLIX;
SELECT *
FROM NETFLIX
LIMIT 10;
SELECT COUNT(*) AS total_titles
FROM NETFLIX;

SELECT 
    type,
    COUNT(*) AS total_titles
FROM NETFLIX
GROUP BY type;


SELECT 
    type,
    COUNT(*) AS total_titles,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM NETFLIX), 2) AS percentage
FROM NETFLIX
GROUP BY type;

SELECT 
    release_year,
    COUNT(*) AS total_titles
FROM NETFLIX
GROUP BY release_year
ORDER BY release_year;


SELECT 
    country,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE country IS NOT NULL
  AND country <> ''
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;



SELECT 
    rating,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE rating IS NOT NULL
  AND rating <> ''
GROUP BY rating
ORDER BY total_titles DESC;





SELECT 
    type,
    rating,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE rating IS NOT NULL
  AND rating <> ''
GROUP BY type, rating
ORDER BY type, total_titles DESC;



SELECT 
    listed_in,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE listed_in IS NOT NULL
  AND listed_in <> ''
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;


SELECT 
    ROUND(AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)), 2) AS average_movie_duration
FROM NETFLIX
WHERE type = 'Movie'
  AND duration LIKE '%min';
SELECT 
    MIN(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS shortest_movie,
    MAX(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS longest_movie
FROM NETFLIX
WHERE type = 'Movie'
  AND duration LIKE '%min';
SELECT 
    ROUND(
        AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)),
        2
    ) AS average_seasons
FROM NETFLIX
WHERE type = 'TV Show'
  AND duration LIKE '%Season%';
SELECT 
    CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS seasons,
    COUNT(*) AS total_shows
FROM NETFLIX
WHERE type = 'TV Show'
  AND duration LIKE '%Season%'
GROUP BY seasons
ORDER BY seasons;

SELECT 
    YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS year_added,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE date_added IS NOT NULL
  AND date_added <> ''
GROUP BY year_added
ORDER BY year_added;

SELECT 
    YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS year_added,
    type,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE date_added IS NOT NULL
  AND date_added <> ''
GROUP BY year_added, type
ORDER BY year_added, type;


SELECT 
    COUNT(*) AS indian_titles
FROM NETFLIX
WHERE country LIKE '%India%';
SELECT 
    type,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE country LIKE '%India%'
GROUP BY type
ORDER BY total_titles DESC;
SELECT 
    release_year,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE country LIKE '%India%'
GROUP BY release_year
ORDER BY release_year;
SELECT 
    rating,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE country LIKE '%India%'
GROUP BY rating
ORDER BY total_titles DESC;

SELECT 
    listed_in,
    COUNT(*) AS total_titles
FROM NETFLIX
WHERE country LIKE '%India%'
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;
