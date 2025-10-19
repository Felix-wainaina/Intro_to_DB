-- alx_book_store.sql
-- Create database and tables for ALX bookstore project

CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Authors table
CREATE TABLE IF NOT EXISTS Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
) ENGINE=InnoDB;

-- Books table
CREATE TABLE IF NOT EXISTS Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE,
  publication_date DATE,
  CONSTRAINT fk_books_author
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Customers table
CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215),
  address TEXT
) ENGINE=InnoDB;

-- Orders table
CREATE TABLE IF NOT EXISTS Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
  orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE,
  CONSTRAINT fk_orderdetails_order
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_orderdetails_book
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Optional: sample inserts (comment out if you don't want sample data)
INSERT INTO Authors (author_name) VALUES ('Chinua Achebe'), ('J.K. Rowling');
INSERT INTO Books (title, author_id, price, publication_date) VALUES
  ('Things Fall Apart', 1, 9.99, '1958-06-17'),
  ('Harry Potter and the Philosopher''s Stone', 2, 12.50, '1997-06-26');

INSERT INTO Customers (customer_name, email, address) VALUES
  ('Alice Mwangi','alice@example.com','Nairobi, Kenya'),
  ('John Doe','john@example.com','Nairobi, Kenya');

INSERT INTO Orders (customer_id, order_date) VALUES
  (1, '2025-10-14'),
  (2, '2025-10-15');

INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
  (1, 1, 1),
  (2, 2, 2);
