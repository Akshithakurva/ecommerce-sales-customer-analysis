# Google Data Analytics Capstone-style Python EDA
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("ecommerce_sales_cleaned.csv")
df["Order_Date"] = pd.to_datetime(df["Order_Date"])

# 1. Understand the dataset
print("Shape:", df.shape)
print(df.info())
print(df.isnull().sum())
print(df.describe())

# 2. KPI analysis
print("Total sales:", round(df["Sales"].sum(), 2))
print("Total profit:", round(df["Profit"].sum(), 2))
print("Orders:", df["Order_ID"].nunique())
print("Average order value:", round(df["Sales"].sum()/df["Order_ID"].nunique(), 2))

# 3. Product analysis
product = df.groupby("Product")["Sales"].sum().sort_values(ascending=False)
print(product)
product.plot(kind="bar", title="Sales by Product")
plt.ylabel("Sales")
plt.tight_layout()
plt.show()

# 4. Monthly trend
monthly = df.groupby(df["Order_Date"].dt.to_period("M"))["Sales"].sum()
monthly.plot(kind="line", marker="o", title="Monthly Sales Trend")
plt.ylabel("Sales")
plt.tight_layout()
plt.show()

# 5. Category and city analysis
print(df.groupby("Category")[["Sales","Profit"]].sum().sort_values("Sales", ascending=False))
print(df.groupby("City")[["Sales","Profit"]].sum().sort_values("Sales", ascending=False))

# 6. Top customers
print(df.groupby("Customer")["Sales"].sum().sort_values(ascending=False).head(10))
