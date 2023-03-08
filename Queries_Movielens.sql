USE `movielens`;

-- List the titles and release dates of movies released between
-- 1983 - 1993 in reverse chronological order
SELECT 
    `title`, `release_date`
FROM
    `movies`
WHERE
    (`release_date` >= '1983-01-01'
        AND `release_date` <= '1993-01-01')
ORDER BY `release_date` DESC;
    
-- Without using LIMIT, list the titles of the movies
-- with the lowest average rating
SELECT `title` 
	FROM `movies` 
    WHERE 'id' IN (
	SELECT 'movie_id' FROM 'ratings' WHERE `rating` = (
		SELECT AVG(rating) 
		FROM `ratings` AS
        )
    )
    
SELECT 
    *
FROM
    `ratings`
GROUP BY `movie_id`;