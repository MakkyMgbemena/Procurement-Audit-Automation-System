import pandas as pd

# 1. Load your data manually into a "DataFrame" (Python's version of an Excel table)
df = pd.read_csv('Procurement Analysis.csv')

# 2. Automated Data Cleaning (The TRIM/CLEAN/UPPER Logic)
# In Stage 1, you did this to ensure "Samsung" and "samsung " matched [3].
# This line does it for every row in the 'Product_Name' column at once.
df['Product_Name'] = df['Product_Name'].str.strip().str.upper()

# 3. Standardize Column Headers
# The "Source of Truth" showed 'Unit_price' and 'Vendor_unit_price '
# If these don't match your CSV EXACTLY (including spaces), the rename fails.
print(df.columns.tolist())
df.rename(columns={
    'Unit_price': 'Unit_Price',
    'Vendor_unit_price ': 'Vendor_Unit_Price'
}, inplace=True)

# 4. Success Verification
print("--- Script 1: Data Cleaning Complete ---")
print(df.head())

# --- Script 2: Risk Flagging & Variance Analysis ---

# 1. Calculate Price Variance (Unit_Price - 'Vendor_Unit_Price')
# This line will ONLY work if the rename above succeeded.
# Ensure 'U', 'P', 'V', and 'P' are all capitalized here.
df['Price_Variance'] = df['Unit_Price'] - df['Vendor_Unit_Price']

# 2. Calculate Variance Percentage
df['Variance_Pct'] = (df['Price_Variance'] / df['Vendor_Unit_Price']) * 100
# 3. Automated Risk Flagging (The "Executive" Layer)
# Replicating your SQL CASE logic: flagging overpayments > 5%
df['Risk_Status'] = df['Variance_Pct'].apply(
    lambda x: 'High Overpayment Risk' if x > 5 else 'At Market Rate'
)

# 4. Filter to see only the "High Risk" items (The Audit Finding)
high_risk_items = df[df['Risk_Status'] == 'High Overpayment Risk']

print("\n--- Script 2: Risk Flagging Complete ---")
print(f"Total High Risk Rows Detected: {len(high_risk_items)}")

# Displaying the "bleeding wounds" (DELL and Samsung)
print(high_risk_items[['Product_Name', 'Price_Variance', 'Risk_Status']].head())