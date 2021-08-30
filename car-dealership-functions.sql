-- Creating a function to insert data
CREATE OR REPLACE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR,
_last_name VARCHAR, _email VARCHAR, _phone_number VARCHAR)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(customer_id, first_name, last_name, email, phone_number)
	VALUES(_customer_id, _first_name, _last_name, _email, _phone_number);
END;
$$;

SELECT add_customer(3, 'Stephen', 'Hawking', 'master_of_the_universe@stellar.edu', '555-555-0000');
SELECT add_customer(4, 'Bender', 'Rodriguez', 'dont_email_me@planetexpress.com', '555-555-2337');

SELECT *
FROM customer;

CREATE OR REPLACE FUNCTION add_salesperson(_sales_person_id INTEGER, _first_name VARCHAR,
_last_name VARCHAR, _email VARCHAR, _phone_number VARCHAR)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO salesperson(sales_person_id, first_name, last_name, email, phone_number)
	VALUES(_sales_person_id, _first_name, _last_name, _email, _phone_number);
END;
$$;

SELECT add_salesperson(3, 'Tommy', 'Calahan', 'thomascalahanIII@calahanauto.com', '555-556-9420');
SELECT add_salesperson(4, 'Billy', 'Beane', 'moneyball@athletics.com', '555-555-2255');

SELECT *
FROM salesperson;

CREATE OR REPLACE FUNCTION add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR,
_last_name VARCHAR, _mechanic_title VARCHAR)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO mechanic(mechanic_id, first_name, last_name, mechanic_title)
	VALUES(_mechanic_id, _first_name, _last_name, _mechanic_title);
END;
$$;

SELECT add_mechanic(3, 'Emmet', 'Brown', 'Time Travel Champion');
SELECT add_mechanic(4, 'Walter', 'White', 'The Danger');

SELECT *
FROM mechanic;

CREATE OR REPLACE FUNCTION add_inventory(_inventory_id INTEGER, _item_name VARCHAR, _inven_amount INTEGER)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO inventory(inventory_id, item_name, inven_amount)
	VALUES(_inventory_id, _item_name, _inven_amount);
END;
$$;

SELECT add_inventory(5, 'car', 1);
SELECT add_inventory(6, 'part', 1);

SELECT *
FROM inventory;

CREATE OR REPLACE FUNCTION add_part(_part_id INTEGER, _part_name VARCHAR, _part_price NUMERIC, _inventory_id INTEGER)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO part(part_id, part_name, part_price, inventory_id)
	VALUES(_part_id, _part_name, _part_price, _inventory_id);
END;
$$;

SELECT add_part(3, 'Flux Capaciter', 550.99, 6);

SELECT *
FROM part;

CREATE OR REPLACE FUNCTION add_car(_vin_num VARCHAR, _car_year INTEGER, _make VARCHAR, _model VARCHAR,
_car_trim VARCHAR, _color VARCHAR, _inventory_id INTEGER)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car(vin_num, car_year, make, model, car_trim, color, inventory_id)
	VALUES(_vin_num, _car_year, _make, _model, _car_trim, _color, _inventory_id);
END;
$$;

SELECT add_car('1DMC81B2TFDEMMMF1', 1981, 'DeLorean', 'DMC-12', 'LX', 'Bare Steel', 5);

SELECT *
FROM car;

CREATE OR REPLACE FUNCTION add_invoice(_invoice_id INTEGER, _sub_total NUMERIC, _total NUMERIC, _vin_num VARCHAR,
_customer_id INTEGER, _sales_person_id INTEGER)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO invoice(invoice_id, sub_total, total, vin_num, customer_id, sales_person_id)
	VALUES(_invoice_id, _sub_total, _total, _vin_num, _customer_id, _sales_person_id);
END;
$$;

SELECT add_invoice(3, 15000.00, 19200.25, '1DMC81B2TFDEMMMF1', 4, 3);

SELECT *
FROM invoice;

CREATE OR REPLACE FUNCTION add_service_record(_record_id INTEGER, _service VARCHAR, _sub_total NUMERIC, _total NUMERIC, 
_vin_num VARCHAR, _mechanic_id INTEGER, _inventory_id INTEGER)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO service_records(record_id, service, sub_total, total, vin_num, mechanic_id, inventory_id)
	VALUES(_record_id, _service, _sub_total, _total, _vin_num, _mechanic_id, _inventory_id);
END;
$$;

SELECT add_service_record(3, 'Create a time machine', 121.99, 198.58, '1DMC81B2TFDEMMMF1', 4, 6);

SELECT *
FROM service_records;