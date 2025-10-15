-- Find the date of the first and last order
-- How Many Years of sales are avaiable
SELECT 
MIN(order_date) AS First_order_date,
MAX(order_date) AS Last_order_date,
DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS order_range_year
FROM gold.fact_sales;

-- Find the yougest and the oldest customer
SELECT
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(YEAR,MIN(birthdate), GETDATE()) AS oldest_age,
MAX(birthdate) AS youngest_birthdate,
DATEDIFF(YEAR,MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers