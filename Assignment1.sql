USE rhd11;

DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers(
	customer_number INT(11) NOT NULL PRIMARY KEY,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_first_name VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address_line_1 VARCHAR(50) NOT NULL,
    address_line_2 VARCHAR(50) NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NULL,
    zip VARCHAR(15) NULL
)Engine=InnoDB;

DROP TABLE IF EXISTS employees;
CREATE TABLE IF NOT EXISTS employees(
	employee_number INT(11) NOT NULL PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    extension VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    job_title VARCHAR(50) NOT NULL
)Engine=InnoDB;

DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products(
	product_code VARCHAR(15) NOT NULL PRIMARY KEY,
    product_name VARCHAR(70) NOT NULL,
    product_vendor VARCHAR(150) NOT NULL,
    product_description TEXT NOT NULL,
    quantity_in_stock SMALLINT(6) NOT NULL,
    buy_price DOUBLE NOT NULL,
    msrp DOUBLE NOT NULL
)Engine=InnoDB;

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
	order_number INT(11) NOT NULL PRIMARY KEY,
    order_date DATE NOT NULL,
    required_date DATE NOT NULL,
    shipped_date DATE NULL,
    status VARCHAR(15) NOT NULL,
    fk_customer_number INT(11) NOT NULL,
    fk_employee_number INT(11) NOT NULL,
    FOREIGN KEY(fk_customer_number) REFERENCES customers(customer_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(fk_employee_number) REFERENCES employees(employee_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)Engine=InnoDB;

DROP TABLE IF EXISTS orderdetails;
CREATE TABLE IF NOT EXISTS orderdetails(
	fk_order_number INT(11) NOT NULL,
    fk_product_code VARCHAR(15) NOT NULL,
    quantity_ordered INT(11) NOT NULL,
    price_each DOUBLE NOT NULL,
    PRIMARY KEY(fk_order_number, fk_product_code),
    FOREIGN KEY(fk_order_number) REFERENCES orders(order_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(fk_product_code) REFERENCES products(product_code)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)Engine=InnoDB;

INSERT INTO customers
(customer_number, customer_last_name, customer_first_name, phone, address_line_1, address_line_2, city, state, zip)
VALUES
(54378, 'Specter', 'Harvey', '913-908-3245', 'East 54th Street', '601', 'New York City', 'NY', '11234'), 
(54623, 'Simpson', 'Homer', '412-455-9088', 'Evergreen Terrace', '742', 'Springfield', 'OR', '97403'), 
(54902, 'Bing', 'Chandler', '212-909-2345', '90 Bedford St', '20', 'New York City', 'NY', '10014'); 

INSERT INTO employees
(employee_number, last_name, first_name, extension, email, job_title)
VALUES
(9090125, 'Peralta', 'Jake', '84', 'pjake@target.com', 'Sales Associate'),
(9089761, 'Caffrey', 'Neal', '76', 'ncaffrey@target.com', 'Store Manager'),
(9087145, 'Murdock', 'Matt', '55', 'mmatt@target.com', 'Sales Associate');

INSERT INTO products
(product_code, product_name, product_vendor, product_description, quantity_in_stock, buy_price, msrp)
VALUES
('TG17865', 'TCL 55" Class 4-Series 4K UHD HDR Smart Roku TV', 'TCL', 'The 4-Series Roku TV delivers stunning 4K picture quality with four times the resolution of Full HD for enhanced clarity and detail, as well as endless entertainment with thousands of streaming channels. High dynamic range (HDR) technology delivers bright and accurate colors for a lifelike viewing experience. The simple, personalized home screen allows seamless access to thousands of streaming channels, plus your cable box, Blu-ray player, gaming console, and other devices without flipping through inputs or complicated menus. Easy Voice Control lets you control your entertainment using just your voice. The super-simple remote—with about half the number of buttons on a traditional TV remote—puts you in control of your favorite entertainment. Cord cutters can access free, over-the-air HD content with the Advanced Digital TV Tuner or watch live TV from popular cable-replacement services like YouTube TV, Sling, Hulu and more.', '100', 349.99, 379.99),
('TG87654', 'Ninja Professional Plus Blender DUO with Auto-iQ', 'Ninja', 'The Ninja® Professional Plus Blender DUO® with Auto-iQ® features a new modern design and a more powerful motor than Ninjas original Professional Blender DUO.* *Versus BL621, based on operating wattage', '150', 100, 129.99),
('TG87655', 'Apple AirPods Pro', 'Apple', 'AirPods Pro feature Active Noise Cancellation for immersive sound. Transparency mode for hearing the world around you. They’re sweat and water resistant and have a customizable fit for all-day comfort. Active Noise Cancellation blocks outside noise, so you can immerse yourself in music. Transparency mode for hearing and interacting with the world around you. Spatial audio with dynamic head tracking places sound all around you. Adaptive EQ automatically tunes music to your ears. Three sizes of soft, tapered silicone tips for a customizable fit. Force sensor lets you easily control your entertainment, answer or end calls, and more. Sweat and water resistant. More than 24 hours total listening time with the MagSafe Charging Case. Quick access to Siri by saying “Hey Siri". Effortless setup, in-ear detection, and automatic switching for a magical experience. Easily share audio between two sets of AirPods on your iPhone, iPad, iPod touch, or Apple TV', '45', 189.99, 199.99);

INSERT INTO orders
(order_number, order_date, required_date, shipped_date, status, fk_customer_number, fk_employee_number)
VALUES
(3490231, '2021-12-30', '2022-01-10', '2022-01-05', 'Delivered', 54902, 9090125),
(5643212, '2022-01-01', '2022-01-20', '2022-01-10', 'Shipped', 54623, 9087145),
(2349872, '2021-01-12', '2022-02-10', NULL, 'Processing', 54378, 9089761);


INSERT INTO orderdetails
(fk_order_number, fk_product_code, quantity_ordered, price_each)
VALUES
(3490231, 'TG87654', 1, 129.99),
(3490231, 'TG87655', 1, 199.99),
(5643212, 'TG17865', 1, 379.99),
(5643212, 'TG87654', 1, 129.99),
(2349872, 'TG87655', 2, 199.99),
(2349872, 'TG17865', 1, 379.99);

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderdetails;
