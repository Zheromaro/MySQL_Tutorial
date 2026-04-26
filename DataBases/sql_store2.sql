CREATE DATABASE IF NOT EXISTS sql_store2;
USE sql_store2;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTs customers;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(50) NOT NULL DEFAULT '',
    email       VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY fk_orders_customers (customer_id)
		REFERENCES customers (customer_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);