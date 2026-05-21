import pandas as pd

# Load dataset
df = pd.read_excel("online_retail.xlsx")

print("\n==============================")
print("DATASET OVERVIEW")
print("==============================")

print(f"\nRows: {df.shape[0]}")
print(f"Columns: {df.shape[1]}")

print("\n==============================")
print("COLUMN INFORMATION")
print("==============================")

print(df.info())

print("\n==============================")
print("MISSING VALUES")
print("==============================")

print(df.isnull().sum())

print("\n==============================")
print("DUPLICATES")
print("==============================")

print(f"Duplicate Rows: {df.duplicated().sum()}")

print("\n==============================")
print("NUMERICAL SUMMARY")
print("==============================")

print(df.describe())

print("\n==============================")
print("UNIQUE COUNTRIES")
print("==============================")

print(df["Country"].nunique())

print("\nCountries List:")
print(df["Country"].unique())

print("\n==============================")
print("TOP 10 COUNTRIES BY TRANSACTIONS")
print("==============================")

print(df["Country"].value_counts().head(10))

print("\n==============================")
print("NEGATIVE QUANTITIES")
print("==============================")

negative_qty = df[df["Quantity"] < 0]

print(f"Negative Quantity Records: {negative_qty.shape[0]}")

print("\n==============================")
print("ZERO OR NEGATIVE PRICES")
print("==============================")

bad_prices = df[df["UnitPrice"] <= 0]

print(f"Zero/Negative Price Records: {bad_prices.shape[0]}")

print("\n==============================")
print("TOP 10 PRODUCTS")
print("==============================")

print(df["Description"].value_counts().head(10))