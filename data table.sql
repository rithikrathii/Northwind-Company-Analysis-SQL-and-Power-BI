create database northwind;
use northwind;
-- Drop existing tables if they exist
DROP TABLE IF EXISTS customer_customer_demo;
DROP TABLE IF EXISTS customer_demographics;
DROP TABLE IF EXISTS employee_territories;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shippers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS territories;
DROP TABLE IF EXISTS us_states;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS employees;

-- Create categories table
CREATE TABLE categories (
    category_id INT NOT NULL PRIMARY KEY,
    category_name VARCHAR(255),
    description VARCHAR(255)
);

-- Create customer_demographics table
CREATE TABLE customer_demographics (
    customer_type_id VARCHAR(255) NOT NULL PRIMARY KEY,
    customer_desc VARCHAR(255)
);

-- Create customers table
CREATE TABLE customers (
    customer_id VARCHAR(255) NOT NULL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    contact_title VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    region VARCHAR(255),
    postal_code VARCHAR(255),
    country VARCHAR(255),
    phone VARCHAR(255),
    fax VARCHAR(255)
);

-- Create customer_customer_demo table with correct foreign keys

CREATE TABLE customer_demographics (
    customer_type_id VARCHAR(255) NOT NULL PRIMARY KEY,
    customer_desc VARCHAR(255)
);

CREATE TABLE customer_customer_demo (
    customer_id VARCHAR(255) NOT NULL,
    customer_type_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (customer_id, customer_type_id),
    FOREIGN KEY (customer_type_id) REFERENCES customer_demographics(customer_type_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT NOT NULL PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    title VARCHAR(255),

    birth_date DATE,
    hire_date DATE,
    address VARCHAR(255),
    city VARCHAR(255),
    region VARCHAR(255),
    postal_code VARCHAR(255),
    country VARCHAR(255),
    home_phone VARCHAR(255),
    extension VARCHAR(255),
    notes TEXT,
    reports_to INT,
    FOREIGN KEY (reports_to) REFERENCES employees(employee_id)
);

-- Create suppliers table
CREATE TABLE suppliers (
    supplier_id INT NOT NULL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    contact_title VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    region VARCHAR(255),
    postal_code VARCHAR(255),
    country VARCHAR(255),
    phone VARCHAR(255),
    fax VARCHAR(255),
    homepage VARCHAR(255)
);

-- Create products table with correct foreign keys
CREATE TABLE products (
    product_id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    supplier_id INT,
    category_id INT,
    quantity_per_unit VARCHAR(255),
    unit_price REAL,
    units_in_stock INT,
    units_on_order SMALLINT,
    reorder_level SMALLINT,
    discontinued INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Create region table
CREATE TABLE region (
    region_id SMALLINT NOT NULL PRIMARY KEY,
    region_description VARCHAR(255) NOT NULL
);

-- Create shippers table
CREATE TABLE shippers (
    shipper_id SMALLINT NOT NULL PRIMARY KEY,
    company_name VARCHAR(40) NOT NULL,
    phone VARCHAR(255)
);

-- Create orders table with correct foreign keys
CREATE TABLE orders (
    order_id SMALLINT NOT NULL PRIMARY KEY,
    customer_id VARCHAR(255),
    employee_id INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    ship_via SMALLINT,
    freight REAL,
    ship_name VARCHAR(40),
    ship_address VARCHAR(60),
    ship_city VARCHAR(15),
    ship_region VARCHAR(15),
    ship_postal_code VARCHAR(10),
    ship_country VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (ship_via) REFERENCES shippers(shipper_id)
);

-- Create territories table with correct foreign key
CREATE TABLE territories (
    territory_id VARCHAR(20) NOT NULL PRIMARY KEY,
    territory_description VARCHAR(255) NOT NULL,
    region_id SMALLINT NOT NULL,
    FOREIGN KEY (region_id) REFERENCES region(region_id)
);

-- Create employee_territories table with correct foreign keys
CREATE TABLE employee_territories (
    employee_id INT NOT NULL,
    territory_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (employee_id, territory_id),
    FOREIGN KEY (territory_id) REFERENCES territories(territory_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Create order_details table with correct foreign keys
CREATE TABLE order_details (
    order_id SMALLINT NOT NULL,
    product_id INT NOT NULL,
    unit_price REAL NOT NULL,
    quantity SMALLINT NOT NULL,
    discount REAL NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Create us_states table
CREATE TABLE us_states (
    state_id SMALLINT NOT NULL PRIMARY KEY,
    state_name VARCHAR(100),
    state_abbr VARCHAR(2),
    state_region VARCHAR(50)
    
);

show tables