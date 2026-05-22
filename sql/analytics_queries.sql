-- =========================================
-- TOP 10 PRODUCTS BY REVENUE
-- =========================================

SELECT
    stock_code,
    SUM(total_sales) AS revenue
FROM fact_sales
GROUP BY stock_code
ORDER BY revenue DESC
LIMIT 10;

-- =========================================
-- TOP 10 CUSTOMERS BY SPENDING
-- =========================================

SELECT
    customer_id,
    SUM(total_sales) AS total_spent
FROM fact_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- =========================================
-- REVENUE BY COUNTRY
-- =========================================

SELECT
    dc.country_name,
    SUM(fs.total_sales) AS revenue
FROM fact_sales fs
JOIN dim_country dc
ON fs.country_id = dc.country_id
GROUP BY dc.country_name
ORDER BY revenue DESC;

-- =========================================
-- MONTHLY REVENUE TREND
-- =========================================

SELECT
    EXTRACT(YEAR FROM full_date) AS year,
    EXTRACT(MONTH FROM full_date) AS month,
    SUM(total_sales) AS revenue
FROM fact_sales
GROUP BY year, month
ORDER BY year, month;

-- =========================================
-- AVERAGE ORDER VALUE
-- =========================================

SELECT
    ROUND(AVG(total_sales), 2) AS avg_order_value
FROM fact_sales;