-- Find the Total Sales
SELECT SUM(sales_amount) AS Total_Sales FROM gold.fact_sales;

-- Find how many items are sold
SELECT SUM(quantity) AS Sold_items FROM gold.fact_sales;

-- Find the average selling price
SELECT AVG(price) AS Avg_sell FROM gold.fact_sales;

-- Find the Total number of Orders
SELECT COUNT(order_number) AS total_order FROM gold.fact_sales
SELECT COUNT(DISTINCT order_number) AS total_order FROM gold.fact_sales;

-- Find the Total number of products
SELECT COUNT(product_number) AS total_product FROM gold.dim_products
SELECT COUNT(DISTINCT product_number) AS total_product FROM gold.dim_products;

-- Find the Total number of customers
SELECT COUNT(customer_number) AS total_customers FROM gold.dim_customers
SELECT COUNT(DISTINCT customer_number) AS total_customers FROM gold.dim_customers;

-- Find the Total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales;


-- Generate a Report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products', COUNT(product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Nr. Customers', COUNT(customer_key) FROM gold.dim_customers
