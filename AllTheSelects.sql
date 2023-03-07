USE sakila;

-- Select all actors from the table
SELECT * FROM `actor`;
SELECT * FROM `actor` WHERE `first_name` = 'John';
SELECT * FROM `actor` WHERE `last_name` = 'Neeson';
-- Select all actors with ID nums divisible by 10
SELECT * FROM `actor` WHERE `actor_id` % 10 = 0;
-- What is the desc of the movie with ID 100?
SELECT * FROM `film` WHERE `film_id` = 100;
-- Find every movie with a rating of 'R'
SELECT * from `film` WHERE `rating` = 'R';
-- Find every movie except those with a rating of 'R'
SELECT * from `film` WHERE `rating` != 'R';
-- Find the 10 shortest films
SELECT * FROM `film` ORDER BY `length` ASC LIMIT 10;
-- Return only the movie titles
SELECT `title` FROM `film` ORDER BY `title` ASC;
-- Names of all the languages in the database, sorted alphabetically
SELECT `name` FROM `language` ORDER BY `name` ASC;
-- Find all movies with deleted scenes

-- How many distinct countries are there?