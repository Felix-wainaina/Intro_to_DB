-- task_2.sql
-- Create the required tables for the alx_book_store database

USE alx_book_store;

-- Drop tables if they exist (order matters because of foreign keys)
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS authors;

-- Authors table
CREATE TABLE authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
) ENGINE=InnoDB;

-- Books table
CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE,
  publication_date DATE,
  CONSTRAINT fk_books_author
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Customers table
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215),
  address TEXT
) ENGINE=InnoDB;

-- Orders table
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Order details table
CREATE TABLE order_details (
  orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE,
  CONSTRAINT fk_orderdetails_order
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_orderdetails_book
    FOREIGN KEY (book_id) REFERENCES books(book_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB;
