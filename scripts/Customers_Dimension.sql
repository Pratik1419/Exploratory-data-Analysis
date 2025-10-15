CREATE VIEW gold.dim_customer AS
SELECT 
		ROW_NUMBER() OVER (ORDER BY cst_id) AS customer_key,
		ci.cst_id AS customer_id,
		ci.cst_key AS customer_number,
		ci.cst_firstname AS first_name,
		ci.cst_lastname AS last_name,
		la.cntry AS country,
		ci.cst_marital_status AS marital_status,
		CASE WHEN ci.cst_gndr !='NotAviliable Data' THEN ci.cst_gndr
		     ELSE COALESCE(ca.gen, 'NotAviliable Data')
		END AS gender,
		ca.bdate AS birthdate,
		ci.cst_create_date AS create_date
	FROM silver.crm_cust_info ci
	LEFT JOIN silver.erp_cust_az12 ca
	ON		ci.cst_key = ca.cid
	LEFT JOIN silver.erp_loc_a101 la
	ON      ci.cst_key = la.cid





















-- After that we will check if you have any duplites on the new table


--SELECT cst_id, COUNT(*) FROM
--	(SELECT 
--		ci.cst_id,
--		ci.cst_key,
--		ci.cst_firstname,
--		ci.cst_lastname,
--		ci.cst_marital_status,
--		ci.cst_gndr,
--		ci.cst_create_date,
--		ca.bdate,
--		ca.gen,
--		la.cntry
--	FROM silver.crm_cust_info ci
--	LEFT JOIN silver.erp_cust_az12 ca
--	ON		ci.cst_key = ca.cid
--	LEFT JOIN silver.erp_loc_a101 la
--	ON      ci.cst_key = la.cid
--)t GROUP BY cst_id
--HAVING COUNT(*) > 1