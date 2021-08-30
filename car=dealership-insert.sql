-- Inserting data into the customer table
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	email,
	phone_number
)VALUES(
	1,
	'Ryan',
	'Rhodes',
	'rhodeyrhodes@codingtemple.com',
	'555-555-5550'
);
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	email,
	phone_number
)VALUES(
	2,
	'Terrell',
	'McKinney',
	'akaappleby@codingtemple.com',
	'555-555-5551'
);

-- Inserting data into salesperson
INSERT INTO salesperson(
	sales_person_id,
	first_name,
	last_name,
	email,
	phone_number
)VALUES(
	1,
	'Slick',
	'Ricky',
	'clipemshipem@clutchautosales.com',
	'555-555-5552'
);
INSERT INTO salesperson(
	sales_person_id,
	first_name,
	last_name,
	email,
	phone_number
)VALUES(
	2,
	'Skeevey',
	'Stevey',
	'notakebacks@clutchautosales.com',
	'555-555-5553'
);

--Inserting data into inventory for both car and parts 
INSERT INTO inventory(
	inventory_id,
	item_name,
	inven_amount
)VALUES(
	1,
	'car',
	1
);
INSERT INTO inventory(
	inventory_id,
	item_name,
	inven_amount
)VALUES(
	2,
	'car',
	1
);
INSERT INTO inventory(
	inventory_id,
	item_name,
	inven_amount
)VALUES(
	3,
	'part',
	5
);
INSERT INTO inventory(
	inventory_id,
	item_name,
	inven_amount
)VALUES(
	4,
	'part',
	10
);

-- Inserting data into car table
INSERT INTO car(
	vin_num,
	car_year,
	make,
	model,
	car_trim,
	color,
	inventory_id
)VALUES(
	'1D5G5SFSFF35G6584',
	2020,
	'Honda',
	'Civic',
	'GT',
	'Black',
	1
);
INSERT INTO car(
	vin_num,
	car_year,
	make,
	model,
	car_trim,
	color,
	inventory_id
)VALUES(
	'1D5G5SFSFF35G6532',
	2019,
	'Honda',
	'CRV',
	'GT',
	'White',
	2
);

-- Inserting data into parts table
INSERT INTO part(
	part_id,
	part_name,
	part_price,
	inventory_id
)VALUES(
	1,
	'Drivers Side Door',
	'1',
	3
);
INSERT INTO part(
	part_id,
	part_name,
	part_price,
	inventory_id
)VALUES(
	2,
	'Convertible top',
	'50.32',
	4
);

-- Inserting data into mechanic
INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name,
	mechanic_title
)VALUES(
	1,
	'Owen',
	'Carvill',
	'Junior Mechanic'
);
INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name,
	mechanic_title
)VALUES(
	2,
	'John',
	'Doe',
	'Master Mechanic'
);

-- Inserting data into invoice
INSERT INTO invoice(
	invoice_id,
	sub_total,
	total,
	vin_num,
	customer_id,
	sales_person_id
)VALUES(
	1,
	20000.52,
	27632.89,
	'1D5G5SFSFF35G6584',
	1,
	1
);
INSERT INTO invoice(
	invoice_id,
	sub_total,
	total,
	vin_num,
	customer_id,
	sales_person_id
)VALUES(
	2,
	35000.52,
	42537.69,
	'1D5G5SFSFF35G6532',
	2,
	2
);

-- Insert data into service records
INSERT INTO service_records(
	record_id,
	service,
	sub_total,
	total,
	vin_num,
	mechanic_id,
	inventory_id
)VALUES(
	1,
	'Replace drivers side door',
	79.99,
	90.32,
	'1D5G5SFSFF35G6532',
	1,
	3
);
INSERT INTO service_records(
	record_id,
	service,
	sub_total,
	total,
	vin_num,
	mechanic_id,
	inventory_id
)VALUES(
	2,
	'Replace convertible top',
	79.99,
	90.32,
	'1D5G5SFSFF35G6584',
	2,
	4
);

-- Fix datatype from NUMERIC entry error
ALTER TABLE "service_records"
ALTER COLUMN sub_total TYPE NUMERIC(6,2);
ALTER TABLE "service_records"
ALTER COLUMN total TYPE NUMERIC(6,2);
ALTER TABLE "part"
ALTER COLUMN part_price TYPE NUMERIC(6,2);