-- INSERT DATA INTO CUSTOMER TABLE
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	billing_info
)VALUES(
	1,
	'Owen',
	'Carvill',
	'4242-4242-4242-4242 632 05/22'
);
-- INSERT DATA INTO MOVIE TABLE
INSERT INTO movie(
	film_id,
	run_time,
	rating,
	film_capacity
)VALUES(
	1,
	228,
	'PG-13',
	150
);
--INSERT DATA INTO TICKET TABLE
INSERT INTO ticket(
	ticket_id,
	seat,
	film_id
)VALUES(
	1,
	'15E',
	1
);
-- INSERT DATA INTO INVENTORY
INSERT INTO inventory(
	inventory_id,
	upc,
	item_amount
)VALUES(
	1,
	123456789098,
	30
);
-- INSERT DATA INTO CONCESSIONS
INSERT INTO concession(
	item_id,
	item_name,
	item_price,
	inventory_id
)VALUES(
	1,
	'Goobers',
	5.99,
	1
);
-- INSERT DATA INTO ORDER_
INSERT INTO order_(
	order_id,
	sub_total,
	total,
	customer_id,
	inventory_id
)VALUES(
	1,
	5.99,
	6.35,
	1,
	1
);

--Checking data
SELECT * 
FROM customer;
SELECT *
FROM movie;
SELECT *
FROM ticket;
SELECT *
FROM inventory;
SELECT *
FROM concession;
SELECT *
FROM order_;