-- =========================================
-- STAGING TABLE CREATION
-- =========================================

CREATE TABLE stg_online_retail (
    invoice_no      VARCHAR(50),
    stock_code      VARCHAR(50),
    description     TEXT,
    quantity        INTEGER,
    invoice_date    TIMESTAMP,
    unit_price      NUMERIC(10,2),
    customer_id     DOUBLE PRECISION,
    country         VARCHAR(100)
);

-- =========================================
-- LOAD RAW DATA
-- =========================================

COPY stg_online_retail
FROM '/Users/azoozyaw/Desktop/enterprise-retail-data-pipeline/data/raw/online_retail.csv'
DELIMITER ','
CSV HEADER;