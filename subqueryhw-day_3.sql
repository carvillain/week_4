-- List all customers who live in Texas using JOIN
SELECT first_name, last_name, address.district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

-- RETURNS 5 ENTRIES

-- Get all payments above $6.99 with the customer's full name
SELECT first_name, last_name, payment.amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY last_name DESC;

-- RETURNS 1406 results

-- Show all customers names who have made payments over $175 using SubQuery
SELECT first_name, last_name
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount IN(
	SELECT payment.amount
	FROM payment
	GROUP BY payment.amount
)
GROUP BY first_name, last_name
HAVING SUM(amount) > 175;

-- RETURNS 6 RESULTS

-- List all customers that live in Nepal using the city table
SELECT *
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.city_id = country.country_id
WHERE country = 'Nepal';

-- RETURNS 1 RESULT

-- Which staff member had the most transactions
SELECT first_name, last_name, COUNT(payment.amount)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY COUNT(staff.staff_id) DESC;

-- RETURNS Jon Stephens

-- How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;

-- PG-13 at 223

-- Show all customers who have made a single payment above $6.99
SELECT first_name, last_name
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount IN(
	SELECT amount
	FROM payment
	WHERE payment.amount > 6.99
	GROUP BY payment.amount
)
GROUP BY first_name, last_name
HAVING COUNT(amount) = 1;

-- RETURNS 130 RESULTS

-- How many free rentals did our stores give away
SELECT amount, COUNT(amount)
FROM payment
WHERE amount = 0
GROUP BY amount;

-- 24 free rentals
