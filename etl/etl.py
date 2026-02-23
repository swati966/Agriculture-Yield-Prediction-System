import pandas as pd

df = pd.read_csv("data/raw/yield_df.csv")

# Remove unwanted index column if exists
df = df.loc[:, ~df.columns.str.contains('^Unnamed')]

# Remove extra spaces from column names
df.columns = df.columns.str.strip()

print("Original Columns:")
print(df.columns)

# Force rename ALL columns by position
df.columns = [
    "Area",
    "Item",
    "Year",
    "Yield",
    "Rainfall",
    "Pesticides",
    "Temperature"
]

print("New Columns:")
print(df.columns)

df.to_csv("data/processed/cleaned_data.csv", index=False)

print("FINAL CLEAN CSV CREATED")
