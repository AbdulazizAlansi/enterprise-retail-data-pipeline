-- =========================================
-- DIMENSION TABLES
-- =========================================

CREATE TABLE dim_customer AS
SELECT DISTINCT
    customer_id
FROM clean_online_retail;

ALTER TABLE dim_customer
ADD PRIMARY KEY (customer_id);

-- =========================================

CREATE TABLE dim_product AS
SELECT
    stock_code,
    MIN(description) AS description
FROM clean_online_retail
GROUP BY stock_code;

ALTER TABLE dim_product
ADD PRIMARY KEY (stock_code);

-- =========================================

CREATE TABLE dim_country AS
SELECT
    ROW_NUMBER() OVER () AS country_id,
    country AS country_name
FROM (
    SELECT DISTINCT country
    FROM clean_online_retail
) t;

ALTER TABLE dim_country
ADD PRIMARY KEY (country_id);

-- =========================================

CREATE TABLE dim_date AS
SELECT DISTINCT
    invoice_date::date AS full_date,
    EXTRACT(DAY FROM invoice_date) AS day,
    EXTRACT(MONTH FROM invoice_date) AS month,
    EXTRACT(YEAR FROM invoice_date) AS year,
    EXTRACT(QUARTER FROM invoice_date) AS quarter,
    TO_CHAR(invoice_date, 'Day') AS weekday
FROM clean_online_retail;

ALTER TABLE dim_date
ADD PRIMARY KEY (full_date);

-- =========================================
-- FACT TABLE
-- =========================================

CREATE TABLE fact_sales AS
SELECT
    invoice_no,
    customer_id,
    stock_code,
    invoice_date::date AS full_date,
    quantity,
    unit_price,
    total_sales
FROM clean_online_retail;

-- =========================================
-- COUNTRY ID RELATION
-- =========================================

ALTER TABLE fact_sales
ADD COLUMN country_id BIGINT;

UPDATE fact_sales fs
SET country_id = dc.country_id
FROM clean_online_retail cor
JOIN dim_country dc
ON cor.country = dc.country_name
WHERE fs.invoice_no = cor.invoice_no;

-- =========================================
-- FOREIGN KEYS
-- =========================================

ALTER TABLE fact_sales
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES dim_customer(customer_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_product
FOREIGN KEY (stock_code)
REFERENCES dim_product(stock_code);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_country
FOREIGN KEY (country_id)
REFERENCES dim_country(country_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_date
FOREIGN KEY (full_date)
REFERENCES dim_date(full_date);