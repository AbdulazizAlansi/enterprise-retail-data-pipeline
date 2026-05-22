CREATE SCHEMA IF NOT EXISTS bronze;

DROP TABLE IF EXISTS bronze.dim_customer;
DROP TABLE IF EXISTS bronze.dim_date;
DROP TABLE IF EXISTS bronze.dim_country;
DROP TABLE IF EXISTS bronze.dim_product;
DROP TABLE IF EXISTS bronze.fact_sales;

CREATE TABLE bronze.dim_customer (
    customer_id INT,
    country_id INT
);

CREATE TABLE bronze.dim_date (
    full_date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT,
    weekday VARCHAR(20)
);

CREATE TABLE bronze.dim_country (
    country_id INT,
    country_name VARCHAR(100)
);

CREATE TABLE bronze.dim_product (
    stock_code VARCHAR(20),
    description TEXT
);

CREATE TABLE bronze.fact_sales (
    invoice_no VARCHAR(20),
    stock_code VARCHAR(20),
    customer_id INT,
    country_id INT,
    full_date DATE,
    quantity INT,
    unit_price NUMERIC(10,2),
    total_sales NUMERIC(12,2)
);

COPY bronze.dim_customer
FROM 'YourPath/dim_customer.csv'
DELIMITER ','
CSV HEADER;

COPY bronze.dim_date
FROM 'YourPath/dim_date.csv'
DELIMITER ','
CSV HEADER;

COPY bronze.dim_country
FROM 'YourPath/dim_country.csv'
DELIMITER ','
CSV HEADER;

COPY bronze.dim_product
FROM 'YourPath/dim_product_cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY bronze.fact_sales
FROM 'YourPath/fact_sales.csv'
DELIMITER ','
CSV HEADER;