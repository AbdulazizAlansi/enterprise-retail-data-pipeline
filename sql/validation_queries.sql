SELECT COUNT(*) FROM bronze.dim_customer;
SELECT COUNT(*) FROM bronze.dim_date;
SELECT COUNT(*) FROM bronze.dim_country;
SELECT COUNT(*) FROM bronze.dim_product;
SELECT COUNT(*) FROM bronze.fact_sales;

SELECT COUNT(*) FROM silver.dim_customer;
SELECT COUNT(*) FROM silver.dim_date;
SELECT COUNT(*) FROM silver.dim_country;
SELECT COUNT(*) FROM silver.dim_product;
SELECT COUNT(*) FROM silver.fact_sales;

SELECT * FROM gold.country_revenue LIMIT 10;

SELECT * FROM gold.monthly_sales_trend LIMIT 10;

SELECT * FROM gold.top_products LIMIT 10;