-- Explore All Objects in the Database
SELECT * FROM INFORMATION_SCHEMA.TABLES


-- Exploer All Columns in the Database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'

-- Explore All Country our Customers come from
SELECT DISTINCT country FROM gold.dim_customers

-- Explore All Categories 'The major division'
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1,2,3