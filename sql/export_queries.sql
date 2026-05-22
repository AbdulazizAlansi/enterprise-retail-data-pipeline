-- =========================================
-- EXPORT FACT TABLE
-- =========================================

COPY fact_sales
TO '/Users/azoozyaw/Desktop/enterprise-retail-data-pipeline/data/warehouse_exports/fact_sales.csv'
DELIMITER ','
CSV HEADER;

-- =========================================
-- EXPORT CUSTOMER DIMENSION
-- =========================================

COPY dim_customer
TO '/Users/azoozyaw/Desktop/enterprise-retail-data-pipeline/data/warehouse_exports/dim_customer.csv'
DELIMITER ','
CSV HEADER;

-- =========================================
-- EXPORT PRODUCT DIMENSION
-- =========================================

COPY dim_product
TO '/Users/azoozyaw/Desktop/enterprise-retail-data-pipeline/data/warehouse_exports/dim_product.csv'
DELIMITER ','
CSV HEADER;

-- =========================================
-- EXPORT COUNTRY DIMENSION
-- =========================================

COPY dim_country
TO '/Users/azoozyaw/Desktop/enterprise-retail-data-pipeline/data/warehouse_exports/dim_country.csv'
DELIMITER ','
CSV HEADER;

-- =========================================
-- EXPORT DATE DIMENSION
-- =========================================

COPY dim_date
TO '/Users/azoozyaw/Desktop/enterprise-retail-data-pipeline/data/warehouse_exports/dim_date.csv'
DELIMITER ','
CSV HEADER;