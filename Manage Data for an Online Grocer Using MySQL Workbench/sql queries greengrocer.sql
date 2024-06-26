SELECT * FROM Items;

SELECT * FROM Vendors;

SELECT * FROM Customers;

SELECT * FROM Stock;

SELECT * FROM Sales;


-- Retrieve all sales with item descriptions and customer names
SELECT Sales.sales_id, Items.description, Customers.customer_name, Sales.date_sold, Sales.quantity, Sales.price
FROM Sales
JOIN Items ON Sales.item_id = Items.item_id
JOIN Customers ON Sales.customer_id = Customers.customer_id;

-- Retrieve all items with their current stock and vendor names
SELECT Items.description, Stock.quantity_on_hand, Vendors.vendor_name
FROM Stock
JOIN Items ON Stock.item_id = Items.item_id
JOIN Vendors ON Stock.vendor_id = Vendors.vendor_id;