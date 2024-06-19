-- 1. Where are items stored and if they were rearranged, could a warehouse be eliminated?

-- Product Distribution
SELECT 
    p.productCode,
    p.productName,
    w.warehouseCode,
    w.warehouseName,
    w.warehousepctcap,
    COUNT(p.productCode) AS numberOfProducts
FROM 
    products p
JOIN 
    warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY 
    p.productCode, p.productName, w.warehouseCode, w.warehouseName, w.warehousepctcap
ORDER BY 
    w.warehouseCode;
    
-- Warehouse Capacities
SELECT 
    w.warehouseCode,
    w.warehouseName,
    w.warehousepctcap,
    SUM(p.quantityInStock) AS totalInventory
FROM 
    warehouses w
JOIN 
    products p ON w.warehouseCode = p.warehouseCode
GROUP BY 
    w.warehouseCode, w.warehouseName, w.warehousepctcap;
    
-- Inventory Levels    
SELECT 
    p.productCode,
    p.productName,
    w.warehouseCode,
    w.warehouseName,
    p.quantityInStock
FROM 
    products p
JOIN 
    warehouses w ON p.warehouseCode = w.warehouseCode
ORDER BY 
    w.warehouseCode, p.productCode;
    
    
-- 2. How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?

-- Calculate Sales Figures
SELECT 
    p.productCode,
    p.productName,
    SUM(od.quantityOrdered) AS totalSales,
    AVG(od.quantityOrdered) AS avgMonthlySales
FROM 
    products p
JOIN 
    orderdetails od ON p.productCode = od.productCode
JOIN 
    orders o ON od.orderNumber = o.orderNumber
WHERE 
       o.orderDate BETWEEN '2004-06-01' AND '2005-05-31'
GROUP BY 
    p.productCode, p.productName; 
    
-- Analyze Inventory Levels
SELECT 
    productCode,
    productName,
    quantityInStock
FROM 
    products; 
    

-- 3. Are we storing items that are not moving? Are any items candidates for being dropped from the product line?

-- slow moving products
SELECT 
    p.productCode,
    p.productName,
    IFNULL(SUM(od.quantityOrdered), 0) AS totalSales
FROM 
    products p
LEFT JOIN 
    orderdetails od ON p.productCode = od.productCode
LEFT JOIN 
    orders o ON od.orderNumber = o.orderNumber AND o.orderDate BETWEEN '2004-06-01' AND '2005-05-31'
GROUP BY 
    p.productCode, p.productName
HAVING 
    totalSales < 10;
    
-- Analyze Inventory Levels
SELECT 
    productCode,
    productName,
    quantityInStock
FROM 
    products
WHERE 
    productCode IN (
        SELECT 
            p.productCode
        FROM 
            products p
        LEFT JOIN 
            orderdetails od ON p.productCode = od.productCode
        LEFT JOIN 
            orders o ON od.orderNumber = o.orderNumber AND o.orderDate BETWEEN '2004-06-01' AND '2005-05-31'
        GROUP BY 
            p.productCode, p.productName
        HAVING 
            IFNULL(SUM(od.quantityOrdered), 0) < 10
    );
    

-- 4. What are the top-selling products, and how do their inventory levels compare?

-- top selling products
SELECT 
    p.productCode, 
    p.productName, 
    SUM(od.quantityOrdered) AS totalSales, 
    p.quantityInStock
FROM 
    products p
JOIN 
    orderdetails od ON p.productCode = od.productCode
GROUP BY 
    p.productCode, p.productName, p.quantityInStock
ORDER BY 
    totalSales DESC
LIMIT 10; 


-- 5. Which products have the highest profit margins, and are their sales consistent with their profitability?

-- profit margins and total sales
SELECT 
    p.productCode, 
    p.productName, 
    p.buyPrice, 
    p.MSRP, 
    ((p.MSRP - p.buyPrice) / p.MSRP) AS profitMargin,
    s.totalSales
FROM 
    products p
JOIN 
    (
        SELECT 
            productCode, 
            SUM(quantityOrdered * priceEach) AS totalSales
        FROM 
            orderdetails
        GROUP BY 
            productCode
    ) s ON p.productCode = s.productCode
ORDER BY 
    profitMargin DESC;
    

-- 6. Which customers have the highest lifetime value, and what products are they purchasing?

-- lifetime value for each customer
SELECT 
    c.customerNumber, 
    c.customerName, 
    SUM(od.priceEach * od.quantityOrdered) AS lifetimeValue
FROM 
    customers c
JOIN 
    orders o ON c.customerNumber = o.customerNumber
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY 
    c.customerNumber, c.customerName
ORDER BY 
    lifetimeValue DESC;
    
-- products purchased by the top customers
SELECT 
    od.productCode, 
    p.productName, 
    SUM(od.quantityOrdered) AS totalQuantity,
    SUM(od.priceEach * od.quantityOrdered) AS totalSpent
FROM 
    orderdetails od
JOIN 
    products p ON od.productCode = p.productCode
JOIN 
    orders o ON od.orderNumber = o.orderNumber
GROUP BY 
    od.productCode, p.productName
ORDER BY 
    totalSpent DESC;
    

-- 7. Are there any seasonal trends in product sales that should influence inventory levels?

-- sales data grouped by month and year
SELECT 
    DATE_FORMAT(o.orderDate, '%Y-%m') AS month,
    p.productName,
    SUM(od.quantityOrdered * od.priceEach) AS totalSales
FROM 
    orders o
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
JOIN 
    products p ON od.productCode = p.productCode
GROUP BY 
    DATE_FORMAT(o.orderDate, '%Y-%m'), p.productName
ORDER BY 
    DATE_FORMAT(o.orderDate, '%Y-%m'); 
    

-- 8. What is the average time taken to fulfill orders, and how does it vary across different warehouses?

-- fulfillment times and additional factors
SELECT 
    o.orderNumber, 
    o.orderDate, 
    o.shippedDate, 
    p.productCode, 
    p.warehouseCode,
    DATEDIFF(o.shippedDate, o.orderDate) AS fulfillmentTime,
    EXTRACT(YEAR_MONTH FROM o.orderDate) AS orderMonth
FROM 
    orders o
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
JOIN 
    products p ON od.productCode = p.productCode; 
    
-- monthly sales trend
SELECT 
    EXTRACT(YEAR_MONTH FROM o.orderDate) AS orderMonth,
    SUM(od.quantityOrdered) AS totalSales
FROM 
    orders o
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY 
    orderMonth
ORDER BY 
    orderMonth;
    

-- 9. How does the delivery performance compare between warehouses, and are there warehouses with consistently late deliveries?

-- fulfillment times
SELECT 
    o.orderNumber, 
    o.orderDate, 
    o.shippedDate, 
    p.productCode, 
    p.warehouseCode,
    DATEDIFF(o.shippedDate, o.orderDate) AS fulfillmentTime
FROM 
    orders o
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
JOIN 
    products p ON od.productCode = p.productCode;
    

-- 10. What are the storage costs of each warehouse, and how do they compare to the revenue generated by products stored there?

-- inventory by warehouse 
SELECT 
    w.warehouseCode, 
    w.warehouseName, 
    SUM(p.quantityInStock) AS totalInventory
FROM 
    warehouses w
JOIN 
    products p ON w.warehouseCode = p.warehouseCode
GROUP BY 
    w.warehouseCode, w.warehouseName;
    
-- revenue data
SELECT 
    p.warehouseCode, 
    SUM(od.quantityOrdered * od.priceEach) AS totalRevenue
FROM 
    orderdetails od
JOIN 
    products p ON od.productCode = p.productCode
GROUP BY 
    p.warehouseCode;
    


-- Insights:

-- Top Customers and Product Purchases: The customers with the highest lifetime value tend to purchase high-value, luxury vehicles. The 1992 Ferrari 360 Spider red is the most popular among top customers, generating the highest revenue.
-- Seasonal Trends in Product Sales: There are clear seasonal trends in product sales, with peaks observed around late summer and early autumn. These trends suggest that inventory levels should be adjusted to accommodate increased demand during these periods.
-- Fulfillment Time Analysis: Warehouse C consistently has the shortest average fulfillment time, indicating efficient operations. Conversely, Warehouse D has the highest fulfillment time and variability, with significant spikes during certain periods.
-- Storage Costs and Revenue Comparison: Warehouses generate substantial revenue relative to their inventory levels, with East Warehouse leading in both total inventory and revenue. However, effective storage cost management is crucial to maximizing profitability.
-- Late Delivery Rates: Warehouse C has the lowest late delivery rate, reinforcing its status as the most efficient warehouse. Warehouses A and D have higher late delivery rates, indicating areas for operational improvement.    


-- Recommendations:

-- Inventory Management: Adjust inventory levels based on seasonal sales trends to ensure adequate stock during peak periods. This will help in meeting customer demand promptly and minimizing stockouts.
-- Warehouse Efficiency: Investigate and address the causes of high fulfillment times and late delivery rates in Warehouses A and D. Implement best practices from Warehouse C to improve overall efficiency.
-- Operational Improvements in Warehouse D: Specifically focus on Warehouse D, where fulfillment times and delivery performance are suboptimal. Consider process optimization, workforce training, and resource allocation to enhance efficiency.
-- Customer Targeting: Continue focusing on high-value customers and tailor marketing strategies to their preferences. Offering exclusive deals or loyalty programs for luxury vehicle buyers could increase their lifetime value further.
-- Resource Allocation: Allocate resources dynamically across warehouses to balance workload and prevent bottlenecks, especially during peak demand periods. Utilize predictive analytics for better demand forecasting and resource planning.
-- Continuous Monitoring and Improvement: Establish a continuous monitoring system to track key performance indicators (KPIs) such as fulfillment times, late delivery rates, and inventory levels. Regular reviews and adjustments will ensure sustained operational excellence.
