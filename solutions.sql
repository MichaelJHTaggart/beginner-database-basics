-- Instructions
-- Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color.
-- id should be an auto-incrementing id/primary key - Use type: SERIAL
-- Add 5 different people into the person database.
-- Remember to not include the person_id because it should auto-increment.
-- List all the people in the person table by height from tallest to shortest.
-- List all the people in the person table by height from shortest to tallest.
-- List all the people in the person table by age from oldest to youngest.
-- List all the people in the person table older than age 20.
-- List all the people in the person table that are exactly 18.
-- List all the people in the person table that are less than 20 and older than 30.
-- List all the people in the person table that are not 27 (Use not equals).
-- List all the people in the person table where their favorite color is not red.
-- List all the people in the person table where their favorite color is not red and is not blue.
-- List all the people in the person table where their favorite color is orange or green.
-- List all the people in the person table where their favorite color is orange, green or blue (use IN).
-- List all the people in the person table where their favorite color is yellow or purple (use IN).
-- Solution
CREATE TABLE person (
    persons_id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    age INTEGER,
    height INTEGER,
    city TEXT, 
    favorite_color TEXT
);

INSERT INTO person
(name, age, height, city, favorite_color)
VALUES
('John', 15, 180.34, 'Merced', 'blue'), ('Mike', 16, 100, 'Provo', 'yellow'), ('Yessir', 18, 183,'Tueq', 'orange'), ('Mario', 39, 112, 'New York', 'red'), ('Luigi', 39, 171, 'New York', 'green');

SELECT * FROM person ORDER BY height DESC;
SELECT * FROM person ORDER BY height ASC;
SELECT * FROM person ORDER BY age DESC;
SELECT * FROM person WHERE age > 20;
SELECT * FROM person WHERE age = 18;
SELECT * FROM person WHERE age > 20 AND age < 30;
SELECT * FROM person WHERE age != 27;
SELECT * FROM person WHERE favorite_color != 'red';
SELECT * FROM person WHERE favorite_color != 'red' AND favorite_color != 'blue';
SELECT * FROM person WHERE favorite_color = 'green' OR favorite_color = 'orange';
SELECT * FROM person WHERE favorite_color IN ('green', 'orange', 'blue');
SELECT * FROM person WHERE favorite_color IN ('yellow', 'purple');

-- Table - orders
-- Instructions
-- Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.
-- Add 5 orders to the orders table.
-- Make orders for at least two different people.
-- person_id should be different for different people.
-- Select all the records from the orders table.
-- Calculate the total number of products ordered.
-- Calculate the total order price.
-- Calculate the total order price by a single person_id.
-- Solution

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    person_id INTEGER,
    product_name VARCHAR(250),
    product_price NUMERIC,
    quantity INTEGER
);

INSERT INTO orders
(person_id, product_name, product_price, quantity)
VALUES
(1, 'Mystery Meat', 15.00, 2), (2, 'My Surprise', .25, 15), (3, 'Meat Tornado', 13.00, 1), (4, 'Montezumas revenge', 32.00, 1), (5, 'Homemade pie', 10.00, 1);

SELECT * FROM orders;
SELECT SUM(quantity) FROM orders;
SELECT SUM(product_price * quantity) FROM orders;
SELECT SUM(product_price * quantity) FROM orders WHERE person_id = 2;

-- Table - artist
-- Instructions
-- Add 3 new artists to the artist table. ( It's already created )
-- Select 10 artists in reverse alphabetical order.
-- Select 5 artists in alphabetical order.
-- Select all artists that start with the word 'Black'.
-- Select all artists that contain the word 'Black'.
-- Solution

INSERT INTO artist
(name)
VALUES
('billy'), ('junior'), ('silly');

SELECT * FROM artist ORDER BY name DESC LIMIT 10;
SELECT * FROM artist ORDER BY name ASC LIMIT 5;
SELECT * FROM artist WHERE name LIKE 'Black%';
SELECT * FROM artist WHERE name LIKE '%Black%';

-- Table - employee
-- Instructions
-- List all employee first and last names only that live in Calgary.
-- Find the birthdate for the youngest employee.
-- Find the birthdate for the oldest employee.
-- Find everyone that reports to Nancy Edwards (Use the reports_to column).
-- You will need to query the employee table to find the Id for Nancy Edwards
-- Count how many people live in Lethbridge.
-- Solution

SELECT first_name, last_name FROM employee WHERE city = 'Calgary';
SELECT * FROM employee ORDER BY birth_date ASC LIMIT = 1;
SELECT * FROM employee ORDER BY birth_date DESC LIMIT = 1;
SELECT * FROM employee WHERE reports_to = 2;
SELECT COUNT(city) FROM employee;



-- Table - invoice
-- Instructions
-- Count how many orders were made from the USA.
-- Find the largest order total amount.
-- Find the smallest order total amount.
-- Find all orders bigger than $5.
-- Count how many orders were smaller than $5.
-- Count how many orders were in CA, TX, or AZ (use IN).
-- Get the average total of the orders.
-- Get the total sum of the orders.
-- Solution

SELECT COUNT(*) FROM invoice WHERE billing_country = 'USA';
SELECT MAX(total) FROM invoice;
SELECT MIN(total) FROM invoice;
SELECT * FROM invoice WHERE total > 5;
SELECT * FROM invoice WHERE total < 5;
SELECT COUNT(*) FROM invoice WHERE total > 5;
SELECT COUNT(*) FROM invoice WHERE billing_state IN ('CA', 'TX', 'AZ');
SELECT AVG(total) FROM invoice;
SELECT SUM(total) FROM invoice;
