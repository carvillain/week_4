-- Create Customer Table

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	phone_number VARCHAR(15)
);

-- Create Inventory Table

CREATE TABLE inventory(
	inventory_id SERIAL PRIMARY KEY,
	item_name VARCHAR(100),
	inven_amount INTEGER
);

-- Create Car Table

CREATE TABLE car(
	vin_num VARCHAR(20) PRIMARY KEY,
	car_year INTEGER,
	make VARCHAR(100),
	model VARCHAR(100),
	car_trim VARCHAR(100),
	color VARCHAR(100),
	inventory_id INTEGER,
	FOREIGN KEY(inventory_id) REFERENCES inventory(inventory_id)
);

-- Create Salesperson Table

CREATE TABLE salesperson(
	sales_person_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	phone_number VARCHAR(15)
);

-- Create Parts Table

CREATE TABLE part(
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR (100),
	part_price NUMERIC(4,2),
	inventory_id INTEGER,
	FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

-- Create Invoice Table

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	sub_total NUMERIC(7,2),
	total NUMERIC(8,2),
	vin_num VARCHAR(100),
	customer_id INTEGER,
	sales_person_id INTEGER,
	FOREIGN KEY(vin_num) REFERENCES car(vin_num),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(sales_person_id) REFERENCES salesperson(sales_person_id)
);

-- Create Mechanic Table

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	mechanic_title VARCHAR(100)
);

-- Create Service Records Table

CREATE TABLE service_records(
	record_id SERIAL PRIMARY KEY,
	service VARCHAR(100),
	sub_total NUMERIC(4,2),
	total NUMERIC(4,2),
	vin_num VARCHAR(20),
	mechanic_id INTEGER,
	inventory_id INTEGER,
	FOREIGN KEY(vin_num) REFERENCES car(vin_num),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(inventory_id) REFERENCES inventory(inventory_id)
);