USE sakila;

-- Which actor has appeared in the most films?
SELECT `first_name`, `last_name` FROM `actor` WHERE `actor_id` = (
	SELECT `actor_id`
	FROM `film_actor` 
    	GROUP BY `actor_id` 
    	ORDER BY COUNT(`film_id`) DESC 
    	LIMIT 1
);

-- What is the average running time of all the films in the database?
SELECT AVG(`length`) 
	FROM `film`;

-- What is the average running time of films by category?
SELECT AVG(`length`) AS 'avg_length', `category` 
	FROM `film_list` 
    GROUP BY `category`;
    
-- How many movies have Robots in them?
SELECT COUNT(*) FROM `film` 
	WHERE `description` 
	LIKE '%robot%';

-- Find the movie(s) with the longest runtime.
SELECT * FROM `film` WHERE `length` = (
	SELECT MAX(length) 
		FROM `film`
	)
    ORDER BY `film_id`; -- Just to make it look pretty!

-- Count how many movies were released in 2010
SELECT COUNT(*) AS 'films_in_2010' 
	FROM `film` 
    WHERE `release_year` = 2010;
    
-- To test the above query is working and the result is ACTUALLY zero...
SELECT COUNT(*) AS 'films_in_2006' 
	FROM `film` 
	WHERE `release_year` = '2006';
    
-- Which last names are not repeated?
SELECT `last_name`, COUNT(`last_name`) AS 'name_count' 
	FROM `actor` 
	GROUP BY `last_name`
	HAVING `name_count`=1; 

-- JH's example- as GROUP BY aggregates by default, if count is not needed for checking
-- the above could be written as...
SELECT `last_name`
	FROM `actor` 
	GROUP BY `last_name`
	HAVING COUNT(`last_name`) = 1; 
    
-- Which last names appear more than once?
SELECT 
    `last_name`, COUNT(`last_name`) AS `count`
FROM
    `actor`
GROUP BY `last_name`
HAVING `count` > 1; 

-- Retrieve all movies that Fred Costner has appeared in                
SELECT 
    `f`.`title`
FROM
    `film` AS `f`
WHERE
    `f`.`film_id` IN (SELECT 
            `fa`.`film_id`
        FROM
            `film_actor` AS `fa`
                INNER JOIN
            `actor` AS `a` ON `fa`.`actor_id` = `a`.`actor_id`
        WHERE
            `a`.`first_name` = 'Fred'
                AND `a`.`last_name` = 'Costner');
                
-- Find out which location has the most copies of
-- BUCKET BROTHERHOOD
SELECT 
	`i`.`store_id`
FROM
    `film` AS `f`
INNER JOIN `inventory` AS `i`
WHERE
    `f`.`title` = 'BUCKET BROTHERHOOD'
GROUP BY `i`.`store_id`;

-- Create a list of categories and the 
-- number of films for each category
SELECT 
    `c`.`category_id`,
    `c`.`name`,
    COUNT(`f`.`film_id`) AS `num_films_per_category`
FROM
    `category` AS `c`
        LEFT OUTER JOIN
    `film_category` AS `f` ON `c`.`category_id` = `f`.`category_id`
GROUP BY `c`.`category_id`;

-- Create a list of actors and the number
-- of movies by each actor

-- Is ‘Academy Dinosaur’ available for rent from Store 1? 

-- When is ‘Academy Dinosaur’ due? 
