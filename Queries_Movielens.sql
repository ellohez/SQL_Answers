USE `movielens`;

-- List the titles and release dates of movies released between
-- 1983 - 1993 in reverse chronological order





-- Show all ratings made by Engineers
-- Just because we can!
SELECT  * FROM `ratings` WHERE `id` IN (   
SELECT `id` FROM `users` 
	WHERE occupation_id = (
		SELECT `id` FROM occupations 
			WHERE `name` = 'Engineer'
));