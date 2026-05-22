-- =========================================
-- EXPORT FACT TABLE
-- =========================================

COPY fact_sales
TO 'YourPath/fact_sales.csv'
DELIMITER ','
CSV HEADER;

-- =========================================
-- EXPORT CUSTOMER DIMENSION
-- =========================================

COPY dim_customer
TO 'YourPath/dim_customer.csv'
DELIMITER ','
CSV HEADER;

-- =========================================
-- EXPORT PRODUCT DIMENSION
-- =========================================

COPY dim_product
TO 'YourPath/dim_product.csv'
DELIMITER ','
CSV HEADER;

-- =========================================
-- EXPORT COUNTRY DIMENSION
-- =========================================

COPY dim_country
TO 'YourPath/dim_country.csv'
DELIMITER ','
CSV HEADER;

-- =========================================
-- EXPORT DATE DIMENSION
-- =========================================

COPY dim_date
TO 'YourPath/dim_date.csv'
DELIMITER ','
CSV HEADER;