-- Find total customers by countries
SELECT
country,
COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY total_customers DESC;

-- Find the total customers by Gender
SELECT
gender,
COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC;

-- Find the total customers by Category
SELECT
category,
COUNT(product_key) AS total_customers
FROM gold.dim_products
GROUP BY category
ORDER BY total_customers DESC;

-- What is the average costa in each category
SELECT
category,
AVG(cost) AS avg_cots
FROM gold.dim_products
GROUP BY category
ORDER BY avg_cots DESC;

-- What is the total revenue generated for each categoty?
SELECT
p.category,
SUM(f.sales_amount) total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;

-- What is the distribution of sold items across countries?
SELECT
c.country,
SUM(f.quantity) AS total_sold_itmes
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_sold_itmes DESC