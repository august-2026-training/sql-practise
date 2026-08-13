DROP DATABASE IF EXISTS sql_practice;
CREATE DATABASE sql_practice;
USE sql_practice;

-- ============================================================
-- 1. CREATE TABLES
-- ============================================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    manager_id INT NULL,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================================
-- 2. INSERT SAMPLE DATA
-- ============================================================

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');

INSERT INTO employees VALUES
(101, 'Alice', 1, NULL, 85000, '2021-01-15'),
(102, 'Bob', 1, 101, 72000, '2022-03-10'),
(103, 'Carol', 1, 101, 68000, '2023-06-20'),
(104, 'David', 2, NULL, 65000, '2020-07-12'),
(105, 'Emma', 2, 104, 52000, '2024-02-01'),
(106, 'Frank', 3, NULL, 90000, '2019-11-05'),
(107, 'Grace', 3, 106, 70000, '2022-08-18'),
(108, 'Henry', 4, NULL, 75000, '2021-09-25'),
(109, 'Irene', 4, 108, 58000, '2023-01-10'),
(110, 'Jack', 4, 108, 62000, '2024-04-22'),
(111, 'Karen', 5, NULL, 78000, '2020-05-30');

INSERT INTO customers VALUES
(1, 'John', 'Atlanta'),
(2, 'Priya', 'Chennai'),
(3, 'Michael', 'Dallas'),
(4, 'Sarah', 'Atlanta'),
(5, 'David', 'Chicago'),
(6, 'Anita', 'Chennai');

INSERT INTO orders VALUES
(1001, 1, '2026-01-05', 250.00),
(1002, 2, '2026-01-10', 500.00),
(1003, 1, '2026-02-02', 150.00),
(1004, 3, '2026-02-15', 700.00),
(1005, 4, '2026-03-01', 300.00),
(1006, 2, '2026-03-10', 450.00),
(1007, 5, '2026-03-20', 900.00),
(1008, 1, '2026-04-05', 600.00),
(1009, 6, '2026-04-12', 350.00),
(1010, 4, '2026-04-20', 200.00);

INSERT INTO products VALUES
(201, 'Laptop', 'Electronics', 1000.00),
(202, 'Mouse', 'Electronics', 25.00),
(203, 'Keyboard', 'Electronics', 50.00),
(204, 'Desk', 'Furniture', 300.00),
(205, 'Chair', 'Furniture', 200.00),
(206, 'Notebook', 'Stationery', 10.00);

INSERT INTO order_items VALUES
(1001, 202, 2),
(1001, 206, 5),
(1002, 201, 1),
(1003, 203, 2),
(1004, 204, 1),
(1004, 205, 2),
(1005, 205, 1),
(1006, 201, 1),
(1007, 201, 1),
(1008, 202, 4),
(1008, 203, 2),
(1009, 206, 10),
(1010, 205, 1);
