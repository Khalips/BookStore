CREATE DATABASE bookstore_db;                     /*Creating the database*/
USE bookstore_db;                                 /*Using the daatabase*/

/*Now creating the tables for the database*/

/*Table named book to store book titles*/
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL
);

/*Table named book_author to manage the many-to-many relationship between books and authors*/
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

/*Table named author to store a list of all authors by name*/
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

/*Table named book_language to list possible languages of books*/
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(100) NOT NULL
);

/*Table named publisher to list all the book publishers*/
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

/*Table named customer to store the details of all bookstore customers*/
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15)
);

/*Table named customer_address to store addresses of all customers*/
CREATE TABLE customer_address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_line_1 VARCHAR(255) NOT NULL,
    address_line_2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100),
    zip_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

/*Table named address_status to state whether the address is the cuurent or old*/
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(100) NOT NULL
);

/*Table named address to list all the addresses in the database*/
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    address_line_1 VARCHAR(255) NOT NULL,
    address_line_2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100),
    zip_code VARCHAR(20),
    country_id INT,
    status_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

/*Table named country to provide a list of countries where the addresses are located*/
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL
);

/*Table named cust_order to provide a list of orders placed by customers*/
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    shipping_method_id INT,
    order_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

/*Table named order_line to provide a list of books that are part of each order*/
CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

/*Table named shipping_method to store list of possible shipping methods for an order.*/
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    shipping_method_name VARCHAR(100) NOT NULL
);

/*Table named order_history to provide a record of the history of an order*/
CREATE TABLE order_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status VARCHAR(100) NOT NULL,
    date_changed DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id)
);

/*Table named order_status to provide A list of possible statuses for an order*/
CREATE TABLE order_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(100) NOT NULL
);

/*Now inserting info into the tables*/

-- 1. country
INSERT INTO country (country_name) VALUES 
('South Africa'), ('United States');

-- 2. address_status
INSERT INTO address_status (status_name) VALUES 
('Current'), ('Old');

-- 3. address
INSERT INTO address (address_line_1, address_line_2, city, province, zip_code, country_id, status_id) VALUES 
('123 Main Street', 'Apt 1', 'Johannesburg', 'Gauteng', '2001', 1, 1),
('45 First Avenue', NULL, 'Cape Town', 'Western Cape', '8000', 1, 2);

-- 4. customer
INSERT INTO customer (first_name, last_name, email, phone_number) VALUES 
('John', 'Doe', 'john.doe@example.com', '0712345678'),
('Mary', 'Smith', 'mary.smith@example.com', '0723456789');

-- 5. customer_address
INSERT INTO customer_address (customer_id, address_line_1, address_line_2, city, province, zip_code, country_id) VALUES 
(1, '123 Main Street', 'Apt 1', 'Johannesburg', 'Gauteng', '2001', 1),
(2, '45 First Avenue', NULL, 'Cape Town', 'Western Cape', '8000', 1);

-- 6. book_language
INSERT INTO book_language (language_name) VALUES 
('English'), ('Afrikaans');

-- 7. publisher
INSERT INTO publisher (name) VALUES 
('Penguin Books'), ('Oxford University Press');

-- 8. book
INSERT INTO book (title) VALUES 
('The Great Gatsby'), 
('Things Fall Apart');

-- 9. author
INSERT INTO author (name) VALUES 
('F. Scott Fitzgerald'), 
('Chinua Achebe');

-- 10. book_author
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 1), 
(2, 2);

-- 11. shipping_method
INSERT INTO shipping_method (shipping_method_name) VALUES 
('Standard'), 
('Express');

-- 12. order_status
INSERT INTO order_status (status_name) VALUES 
('Pending'), 
('Shipped'), 
('Delivered');

-- 13. cust_order
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, order_status_id) VALUES 
(1, '2025-04-13', 1, 1),
(2, '2025-04-10', 2, 3);

-- 14. order_line
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES 
(1, 1, 2, 150.00), 
(2, 2, 1, 200.00);

-- 15. order_history
INSERT INTO order_history (order_id, status, date_changed) VALUES 
(1, 'Pending', '2025-04-13 08:00:00'),
(1, 'Shipped', '2025-04-14 10:00:00'),
(2, 'Delivered', '2025-04-11 09:00:00');


/*Now using queries to test the database tables*/

-- 1. Get the titles of all books in the store
SELECT title FROM book;

-- 2. Get the names of all authors
SELECT name FROM author;

-- 3. Get the first and last names of all customers
SELECT first_name, last_name FROM customer;

-- 4. Get the email addresses of all customers
SELECT email FROM customer;

-- 5. Get the names of all countries listed in the system
SELECT country_name FROM country;

-- 6. Get all the shipping method names available
SELECT shipping_method_name FROM shipping_method;

-- 7. Get all order IDs and the dates the orders were placed
SELECT order_id, order_date FROM cust_order;

-- 8. Get the book IDs and prices from all order lines
SELECT book_id, price FROM order_line;

-- 9. Get the address lines and cities of all addresses stored
SELECT address_line_1, city FROM address;

-- 10. Get both the book IDs and titles from the book table
SELECT book_id, title FROM book;
