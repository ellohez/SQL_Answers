USE sakila;

-- Which actor has appeared in the most films?
SELECT actor_id, count(film_id) AS num_films 
	FROM film_actor 
    GROUP BY actor_id 
    ORDER BY num_films DESC;
SELECT * from `actor` WHERE `actor_id` = 107;
-- What is the average running time of all the films in the database?
SELECT AVG(`length`) FROM `film`;
-- What is the average running time of films by category?
SELECT AVG(`length`) AS 'length', category 
	FROM `film_list` 
    GROUP BY `category`;
-- How many movies have Robots in them?
SELECT COUNT(*) FROM `film` 
WHERE `description` 
LIKE '%robot%';
-- Find the movie(s) with the longest runtime.
SELECT MAX(length) `film` FROM film;
-- Count how many movies were released in 2010
SELECT COUNT(*) AS 'films_in_2010' 
	FROM `film` 
    WHERE `release_year` = 2010;
-- To test the above is ACTUALLY zero...
SELECT COUNT(*) AS 'films_in_2006' 
	FROM `film` 
	WHERE `release_year` = '2006';
-- Which last names are not repeated?
SELECT `last_name`, COUNT(`last_name`) AS 'name_count' 
	FROM `actor` 
	GROUP BY `last_name`
	HAVING `name_count`=1; 

