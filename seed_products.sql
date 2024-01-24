DROP DATABASE IF EXISTS  products_db;

CREATE DATABASE products_db;

\c products_db

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  price FLOAT CHECK (price > 0),
  can_be_returned BOOLEAN NOT NULL
);

-- Insert products into the products table
INSERT INTO products (name, price, can_be_returned)
VALUES ('chair', 44.00, false),
       ('stool', 25.99, true),
       ('table', 124.00, false);

-- Commit the transaction
COMMIT;

-- Display all rows and columns in the table
SELECT * FROM products;

-- Display all names of the products
SELECT name FROM products;

-- Task 6: Display all names and prices of the products
SELECT name, price FROM products;

-- Task 7: Add a new product
INSERT INTO products (name, price, can_be_returned)
VALUES ('new_product', 50.00, true);

-- Task 8: Display only products that can be returned
SELECT * FROM products WHERE can_be_returned;

-- Task 9: Display only products with a price less than 44.00
SELECT * FROM products WHERE price < 44.00;

-- Task 10: Display only products with a price between 22.50 and 99.99
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

-- Task 11: Sale - Reduce the price of all products by $20
UPDATE products SET price = price - 20.00;

-- Task 12: Remove products with a price less than $25
DELETE FROM products WHERE price < 25.00;

-- Task 13: Sale is over - Increase the price of remaining products by $20
UPDATE products SET price = price + 20.00;

-- Task 14: New company policy - Everything is returnable
UPDATE products SET can_be_returned = true;

-- Display the final state of the products table
SELECT * FROM products;