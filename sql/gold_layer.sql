CREATE SCHEMA IF NOT EXISTS gold;

DROP TABLE IF EXISTS gold.country_revenue;
DROP TABLE IF EXISTS gold.monthly_sales_trend;
DROP TABLE IF EXISTS gold.top_products;

CREATE TABLE gold.country_revenue AS
SELECT
    dc.country_name,
    ROUND(SUM(fs.total_sales)::numeric, 2) AS total_revenue
FROM silver.fact_sales fs
JOIN silver.dim_country dc
ON fs.country_id = dc.country_id
GROUP BY dc.country_name
ORDER BY total_revenue DESC;

CREATE TABLE gold.monthly_sales_trend AS
SELECT
    dd.year,
    dd.month,
    ROUND(SUM(fs.total_sales)::numeric, 2) AS monthly_revenue
FROM silver.fact_sales fs
JOIN silver.dim_date dd
ON fs.full_date = dd.full_date
GROUP BY dd.year, dd.month
ORDER BY dd.year, dd.month;

CREATE TABLE gold.top_products AS
SELECT
    dp.description,
    ROUND(SUM(fs.total_sales)::numeric, 2) AS product_revenue
FROM silver.fact_sales fs
JOIN silver.dim_product dp
ON fs.stock_code = dp.stock_code
GROUP BY dp.description
ORDER BY product_revenue DESC
LIMIT 10;