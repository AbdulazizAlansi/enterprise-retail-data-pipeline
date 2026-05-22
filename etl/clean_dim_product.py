import pandas as pd

# Read corrupted CSV safely
df = pd.read_csv(
    "data/warehouse_exports/dim_product.csv",
    engine="python",
    on_bad_lines="skip"
)

# Remove duplicates
df = df.drop_duplicates()

# Save cleaned version
df.to_csv(
    "data/warehouse_exports/dim_product_clean.csv",
    index=False
)

print("dim_product cleaned successfully!")
print(df.head())