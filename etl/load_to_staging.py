import pandas as pd
from sqlalchemy import create_engine

# Load Excel dataset
df = pd.read_excel("data/raw/online_retail.xlsx")

# Rename columns
df.columns = [
    "invoice_no",
    "stock_code",
    "description",
    "quantity",
    "invoice_date",
    "unit_price",
    "customer_id",
    "country"
]

# PostgreSQL connection
engine = create_engine(
    "postgresql+psycopg2://azoozyaw@localhost:5434/retail_staging"
)

# Load into staging table
df.to_sql(
    "stg_online_retail",
    engine,
    if_exists="append",
    index=False
)

print("Data loaded successfully into retail_staging.")
