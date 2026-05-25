# Enterprise Retail Data Pipeline

## Project Overview

An end-to-end Enterprise Data Engineering and Analytics project designed to simulate a real-world retail data platform using PostgreSQL, Docker, Python, SQL, and Tableau.

The project implements a modern Medallion Architecture (Bronze, Silver, Gold) to ingest, clean, transform, and analyze retail sales data for business intelligence and analytics reporting.

---

## Architecture

Raw CSV Dataset  
→ Bronze Layer (Raw Data Ingestion)  
→ Silver Layer (Cleaned & Standardized Data)  
→ Gold Layer (Business Analytics Tables)  
→ Tableau Dashboard Visualization

---

## Medallion Architecture

### Bronze Layer
Stores raw ingested data imported directly from source CSV files.

### Silver Layer
Contains cleaned, deduplicated, and transformed data ready for analytics processing.

### Gold Layer
Contains business-ready aggregated tables for reporting and KPI analysis.

---

## Data Pipeline Flow

1. Raw retail dataset ingestion
2. PostgreSQL warehouse loading
3. Data cleaning and validation
4. Star schema dimensional modeling
5. Bronze → Silver → Gold transformations
6. Business analytics aggregation
7. Tableau dashboard visualization

---

## Data Warehouse Modeling

The warehouse follows a Star Schema architecture:

### Fact Table
- fact_sales

### Dimension Tables
- dim_customer
- dim_product
- dim_country
- dim_date

Relationships were implemented using:
- Primary Keys
- Foreign Keys
- Dimensional Modeling principles

---

## Technologies Used

- PostgreSQL
- Docker
- SQL
- Python
- Pandas
- Tableau
- Data Warehousing
- ETL Pipelines
- Medallion Architecture
- Star Schema Modeling

---

## Tableau Dashboard

The Tableau dashboard provides:

### Dashboard Preview

![Dashboard](https://github.com/AbdulazizAlansi/enterprise-retail-data-pipeline/blob/main/screenshots/dashboard.png)

### Revenue Trend

![Revenue Trend](https://github.com/AbdulazizAlansi/enterprise-retail-data-pipeline/blob/main/screenshots/Revenue%20Trend.png)

### Revenue by Country

![Country Revenue](https://github.com/AbdulazizAlansi/enterprise-retail-data-pipeline/blob/main/screenshots/Country%20Revenue.png)

### Top Products

![Top Products](https://github.com/AbdulazizAlansi/enterprise-retail-data-pipeline/blob/main/screenshots/Top%20Products.png)

- Revenue trend analysis
- Revenue by country
- Top products by revenue
- KPI metrics
- Interactive filtering

---

## Key Business Insights

- United Kingdom generated the highest revenue
- Seasonal sales peaks occurred during Q4
- High-performing products and customers were identified
- Monthly revenue trends revealed strong growth periods

---

## Project Structure

```text
enterprise-retail-data-pipeline/
│
├── data/
│   ├── raw/
│   ├── staging/
│   ├── processed/
│   └── warehouse_exports/
│
├── docker/
├── etl/
├── sql/
├── dashboards/
├── screenshots/
├── docs/
└── README.md