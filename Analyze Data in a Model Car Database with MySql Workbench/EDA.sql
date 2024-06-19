-- customers table data
SELECT * FROM customers;

-- summary statistics
SELECT
    COUNT(*) AS total_records,
    MIN(customerNumber) AS min_customerNumber,
    MAX(customerNumber) AS max_customerNumber,
    COUNT(DISTINCT country) AS unique_countries,
    AVG(creditLimit) AS avg_creditLimit,
    MIN(creditLimit) AS min_creditLimit,
    MAX(creditLimit) AS max_creditLimit
FROM customers;

-- customer credit limits
SELECT creditLimit FROM customers;

-- customers by country
SELECT country, COUNT(*) AS count FROM customers GROUP BY country ORDER BY count DESC;

-- top 10 cities with most customers
SELECT city, COUNT(*) AS count FROM customers GROUP BY city ORDER BY count DESC LIMIT 10;

-- employees table data
SELECT * FROM employees;

-- summary statistics
SELECT
    COUNT(*) AS total_records,
    MIN(employeeNumber) AS min_employeeNumber,
    MAX(employeeNumber) AS max_employeeNumber,
    COUNT(DISTINCT jobTitle) AS unique_jobTitles,
    COUNT(DISTINCT officeCode) AS unique_offices
FROM employees;

-- job title counts
SELECT jobTitle, COUNT(*) as count FROM employees GROUP BY jobTitle;

-- office counts
SELECT officeCode, COUNT(*) as count FROM employees GROUP BY officeCode;

-- office table data
SELECT * FROM offices;

-- description
DESCRIBE offices;

-- summary statistics
SELECT 
    country, 
    COUNT(*) AS number_of_offices, 
    MIN(officeCode) AS min_officeCode, 
    MAX(officeCode) AS max_officeCode
FROM 
    offices
GROUP BY 
    country;
    
-- number of offices by country
SELECT country, COUNT(*) AS number_of_offices FROM offices GROUP BY country; 

-- office codes
SELECT officeCode FROM offices;   

-- orderdetails table data
SELECT * FROM orderdetails;

-- description
DESCRIBE orderdetails;

-- summary statistics
SELECT 
    COUNT(*) AS total_orders,
    AVG(quantityOrdered) AS avg_quantity_ordered,
    AVG(priceEach) AS avg_price_each,
    SUM(quantityOrdered * priceEach) AS total_revenue
FROM 
    orderdetails;
    
-- quantityOrdered
SELECT quantityOrdered FROM orderdetails;

-- priceEach
SELECT priceEach FROM orderdetails;

-- top 10 products by quantityOrdered
SELECT 
    productCode, 
    SUM(quantityOrdered) AS total_quantity_ordered
FROM 
    orderdetails
GROUP BY 
    productCode
ORDER BY 
    total_quantity_ordered DESC
LIMIT 10;   

-- top 10 products by revenue
SELECT 
    productCode, 
    SUM(quantityOrdered * priceEach) AS total_revenue
FROM 
    orderdetails
GROUP BY 
    productCode
ORDER BY 
    total_revenue DESC
LIMIT 10; 

-- orders table data
SELECT * FROM orders;

-- description
DESCRIBE orders;

-- summary statistics
SELECT 
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customerNumber) AS unique_customers,
    COUNT(DISTINCT orderNumber) AS unique_orders,
    COUNT(DISTINCT status) AS order_statuses
FROM 
    orders;
    
-- orderDate
SELECT orderDate FROM orders;    

-- orders by status
SELECT status, COUNT(*) AS count FROM orders GROUP BY status;

-- top 10 customers by number of orders
SELECT 
    customerNumber, 
    COUNT(orderNumber) AS number_of_orders
FROM 
    orders
GROUP BY 
    customerNumber
ORDER BY 
    number_of_orders DESC
LIMIT 10;

-- number of orders over time
SELECT 
    orderDate, 
    COUNT(orderNumber) AS number_of_orders
FROM 
    orders
GROUP BY 
    orderDate
ORDER BY 
    orderDate;
    
-- payments table data
SELECT * FROM payments; 

-- description
DESCRIBE payments;  

-- summary statistics
SELECT 
    COUNT(*) AS total_payments,
    COUNT(DISTINCT customerNumber) AS unique_customers,
    COUNT(DISTINCT checkNumber) AS unique_checks,
    SUM(amount) AS total_amount
FROM 
    payments; 
    
-- payment amounts
SELECT amount FROM payments;  

-- total payments over time by month
SELECT 
    DATE_FORMAT(paymentDate, '%Y-%m') AS payment_month,
    SUM(amount) AS total_amount
FROM 
    payments
GROUP BY 
    payment_month
ORDER BY 
    payment_month;  
    
-- productlines table data
SELECT * FROM productlines; 

-- description
DESCRIBE productlines;   

-- summary statistics
SELECT 
    COUNT(*) AS total_productlines
FROM 
    productlines;
    
-- description of productline
SELECT productLine, textDescription FROM productlines; 

-- number of products per productline
SELECT 
    pl.productLine, 
    COUNT(p.productCode) AS numberOfProducts
FROM 
    productlines pl
JOIN 
    products p ON pl.productLine = p.productLine
GROUP BY 
    pl.productLine; 
    
-- products table data
SELECT * FROM products; 

-- description
DESCRIBE products; 

-- summary statistics
SELECT 
    COUNT(*) AS total_products,
    AVG(buyPrice) AS average_buy_price,
    MIN(buyPrice) AS min_buy_price,
    MAX(buyPrice) AS max_buy_price,
    AVG(MSRP) AS average_msrp,
    MIN(MSRP) AS min_msrp,
    MAX(MSRP) AS max_msrp
FROM 
    products;
    
-- butPrice
SELECT buyPrice FROM products;

-- products with highest msrp
SELECT 
    productCode, 
    productName, 
    MSRP
FROM 
    products
ORDER BY 
    MSRP DESC
LIMIT 10;  

-- warehouses table data
SELECT * FROM warehouses; 

-- description
DESCRIBE warehouses;

-- summary statistics
SELECT 
    COUNT(*) AS total_warehouses
FROM 
    warehouses; 
    
-- number of products per warehouse
SELECT 
    warehouseCode, 
    COUNT(productCode) AS numberOfProducts
FROM 
    products
GROUP BY 
    warehouseCode;
    
-- warehouses with highest inventory
SELECT 
    warehouseCode, 
    SUM(quantityInStock) AS totalInventory
FROM 
    products
GROUP BY 
    warehouseCode
ORDER BY 
    totalInventory DESC
LIMIT 10; 

-- order details
SELECT
        o.orderNumber,
        o.orderDate,
        p.productName,
        p.buyPrice
    FROM
        orders o
    JOIN
        orderdetails od ON o.orderNumber = od.orderNumber
    JOIN
        products p ON od.productCode = p.productCode;
        
-- total sales per product
SELECT
        p.productName,
        SUM(od.quantityOrdered * p.buyPrice) AS total_sales
    FROM
        products p
    JOIN
        orderdetails od ON p.productCode = od.productCode
    GROUP BY
        p.productName
    ORDER BY
        total_sales DESC; 
        
-- inventory trunover rate
SELECT 
       p.productCode, 
       p.productName, 
       SUM(od.quantityOrdered) AS totalSold, 
       SUM(p.quantityInStock) AS currentStock, 
       (SUM(od.quantityOrdered) / SUM(p.quantityInStock)) AS turnoverRate
   FROM 
       products p
   JOIN 
       orderdetails od ON p.productCode = od.productCode
   GROUP BY 
       p.productCode, p.productName
   ORDER BY 
       turnoverRate DESC;
       
-- sales trend analysis
SELECT 
       YEAR(o.orderDate) AS year, 
       MONTH(o.orderDate) AS month, 
       p.productLine, 
       SUM(od.quantityOrdered * p.buyPrice) AS totalSales
   FROM 
       orders o
   JOIN 
       orderdetails od ON o.orderNumber = od.orderNumber
   JOIN 
       products p ON od.productCode = p.productCode
   GROUP BY 
       year, month, p.productLine
   ORDER BY 
       year, month, p.productLine;
       
-- slow moving products
SELECT 
        p.productCode,
        p.productName,
        SUM(od.quantityOrdered) AS totalQuantityOrdered,
        DATEDIFF(NOW(), MAX(o.orderDate)) AS daysSinceLastOrder
   FROM 
        products p
   LEFT JOIN 
        orderdetails od ON p.productCode = od.productCode
   LEFT JOIN 
        orders o ON od.orderNumber = o.orderNumber
   GROUP BY 
        p.productCode, p.productName
   HAVING 
        totalQuantityOrdered IS NULL OR totalQuantityOrdered < 50 OR daysSinceLastOrder > 60;
        
-- range of order dates
SELECT MIN(orderDate) AS firstOrderDate, MAX(orderDate) AS lastOrderDate FROM orders;

-- optimal stock levels
SELECT 
       p.productCode, 
       p.productName, 
       AVG(od.quantityOrdered) AS avgMonthlySales, 
       p.quantityInStock,
       (AVG(od.quantityOrdered) * 1.2) AS suggestedReorderLevel
   FROM 
       products p
   JOIN 
       orderdetails od ON p.productCode = od.productCode
   JOIN 
       orders o ON od.orderNumber = o.orderNumber
   WHERE 
       o.orderDate BETWEEN '2004-06-01' AND '2005-05-31'
   GROUP BY 
       p.productCode, p.productName, p.quantityInStock; 
       

SELECT 
       p.productCode, 
       p.productName, 
       p.quantityInStock
   FROM 
       products p
   ORDER BY 
       p.quantityInStock DESC;
       
-- products with slow levels
SELECT 
       p.productCode, 
       p.productName, 
       SUM(od.quantityOrdered) AS totalSales
   FROM 
       products p
   JOIN 
       orderdetails od ON p.productCode = od.productCode
   JOIN 
       orders o ON od.orderNumber = o.orderNumber
   WHERE 
       o.orderDate BETWEEN '2004-06-01' AND '2005-05-31'
   GROUP BY 
       p.productCode, p.productName
   HAVING 
       totalSales < 400  -- Threshold for low sales
   ORDER BY 
       totalSales ASC;
       
-- sales data by office
SELECT o.officeCode, o.city, o.country, SUM(od.quantityOrdered * od.priceEach) AS totalSales
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders odr ON c.customerNumber = odr.customerNumber
JOIN orderdetails od ON odr.orderNumber = od.orderNumber
GROUP BY o.officeCode, o.city, o.country;

       