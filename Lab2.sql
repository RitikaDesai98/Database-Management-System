#Task 1
USE world;

#Task 2 
SELECT c.Name AS CityName, ct.Name AS CountryName, c.District, c.population 
FROM city AS c 
JOIN country AS ct ON c.countryCode = ct.code 
WHERE ct.Name = "Afghanistan"
ORDER BY population DESC
LIMIT 3;

#Task 3
SELECT Name, LifeExpectancy FROM country WHERE region = "Middle East" ORDER BY LiFeExpectancy LIMIT 1;

#Task 4
SELECT SUM(GNP) FROM country WHERE Region = 'Caribbean';

#Task 5
SELECT * FROM country AS c JOIN countrylanguage AS cl ON c.code = cl.countryCode WHERE cl.language = 'French' AND region = "Western Europe";

#Task 6
SELECT name FROM city WHERE countryCode = "MDG" AND name LIKE "A%";

#Task 7
USE sakila;

SELECT * FROM rental;

#Task 8
SELECT title FROM film AS f JOIN inventory AS i ON f.film_id = i.film_id;

SELECT title, rental_rate, replacement_cost FROM film AS f JOIN inventory AS i ON f.film_id = i.film_id 
WHERE inventory_id IN 
(SELECT inventory_id FROM rental WHERE MONTH(rental_date) = 5 AND YEAR(rental_date) = 2005);

#Task 9
SELECT title, rental_rate, 
(SELECT MAX(amount) FROM payment AS p JOIN rental AS r ON p.rental_id = r.rental_id WHERE r.inventory_id = i.inventory_id) AS profits
FROM film AS f LEFT JOIN inventory AS i ON f.film_id = i.film_id;

#Task 10
SELECT title, rental_rate, MAX(amount) 
FROM film AS f 
LEFT JOIN inventory AS i 
ON f.film_id = i.film_id 
LEFT JOIN rental AS r
ON r.inventory_id = i.inventory_id
LEFT JOIN payment AS p 
ON p.rental_id = r.rental_id 
GROUP BY title, rental_rate;
