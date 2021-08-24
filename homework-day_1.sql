-- Query to determine how many actors had the last_name of Wahlberg
SELECT COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg'
GROUP BY last_name;

-- Should equal 2



-- Query to display how many payments were made between $3.99 and $5.99
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Should equal 5607






-- Query to display film with highest inventory
SELECT *
FROM inventory;

SELECT film_id, COUNT(film_id) AS inventory_count
FROM inventory
GROUP BY film_id
ORDER BY inventory_count DESC;

-- Shows that there are multiple in the list that have 8 on their inventory count
-- Picked the first one to look up title in the following query

SELECT film_id, film.title
FROM film
WHERE film_id = 193;

-- Returns Crossroads Casualties




-- How many customers have the last name William?
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William'
GROUP BY last_name;

-- Returns no data

SELECT last_name, COUNT(last_name)
FROM customer
WHERE last_name LIKE 'W%'
GROUP BY last_name;

-- Confrims no customers had the last name William, though both Williams and Williamson appear once 




-- What store employee sold the most rentals?
-- CHECKED both staff and rental tables to see where the data requested would be found
SELECT * 
FROM staff;

SELECT * 
FROM rental;

SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id;

-- The staff member with staff_id 1 sold the most rentals



-- How many different district names are there?
SELECT *
FROM address;

SELECT COUNT(DISTINCT district), address.district
FROM address
GROUP BY district
ORDER BY address.district DESC;

-- Total districts is 378, one of the district names being blank.



-- From store_id 1, how many customers have last name ending in 'es'?
SELECT *
FROM customer;

SELECT customer.store_id, customer.last_name, COUNT(customer.last_name)
FROM customer
WHERE customer.store_id = 1 AND last_name LIKE '%es'
GROUP BY customer.store_id, customer.last_name;

-- 13


-- How many payment amounts had over 250 rentals for customer_ids between 380 and 430?
SELECT *
FROM payment;

SELECT amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;

-- 2.99 for 290, 4.99 for 281, 0.99 for 269



-- How many rating categories are there? What rating has the most movies total?
SELECT *
FROM film;

SELECT COUNT(DISTINCT rating), rating, COUNT(rating)
FROM film
GROUP BY rating;

-- 5 distinct ratings, PG-13 being the most common