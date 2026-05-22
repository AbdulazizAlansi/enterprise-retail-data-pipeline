CREATE SCHEMA IF NOT EXISTS silver;

DROP TABLE IF EXISTS silver.dim_customer;
DROP TABLE IF EXISTS silver.dim_date;
DROP TABLE IF EXISTS silver.dim_country;
DROP TABLE IF EXISTS silver.dim_product;
DROP TABLE IF EXISTS silver.fact_sales;

CREATE TABLE silver.dim_customer AS
SELECT DISTINCT *
FROM bronze.dim_customer;

CREATE TABLE silver.dim_date AS
SELECT DISTINCT *
FROM bronze.dim_date;

CREATE TABLE silver.dim_country AS
SELECT DISTINCT *
FROM bronze.dim_country;

CREATE TABLE silver.dim_product AS
SELECT DISTINCT *
FROM bronze.dim_product;

CREATE TABLE silver.fact_sales AS
SELECT *
FROM bronze.fact_sales
WHERE quantity > 0
AND total_sales > 0;