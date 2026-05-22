-- =========================================
-- DATA CLEANING & TRANSFORMATION
-- =========================================

CREATE TABLE clean_online_retail AS
SELECT DISTINCT
    invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country,
    quantity * unit_price AS total_sales
FROM stg_online_retail
WHERE customer_id IS NOT NULL
  AND quantity > 0
  AND unit_price > 0
  AND description IS NOT NULL;

-- =========================================
-- VALIDATION QUERIES
-- =========================================

SELECT COUNT(*) AS raw_rows
FROM stg_online_retail;

SELECT COUNT(*) AS cleaned_rows
FROM clean_online_retail;

SELECT *
FROM clean_online_retail
LIMIT 20;