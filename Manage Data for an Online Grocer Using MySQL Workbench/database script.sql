CREATE DATABASE greenspot_grocer;
USE greenspot_grocer;

CREATE TABLE Items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    item_type VARCHAR(100),
    location VARCHAR(100),
    unit VARCHAR(50)
);

CREATE TABLE Vendors (
    vendor_id INT AUTO_INCREMENT PRIMARY KEY,
    vendor_name VARCHAR(255)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255)
);

CREATE TABLE Stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    quantity_on_hand INT,
    cost DECIMAL(10, 2),
    purchase_date DATE,
    vendor_id INT,
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendors(vendor_id)
);

CREATE TABLE Sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    customer_id INT,
    date_sold DATE,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);



