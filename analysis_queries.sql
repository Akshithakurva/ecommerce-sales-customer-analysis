-- GOOGLE DATA ANALYTICS CAPSTONE
-- Project: E-Commerce Sales & Customer Analysis
-- Table: ecommerce_sales

-- ASK: What are overall sales and profit?
SELECT ROUND(SUM(Sales),2) AS total_sales,
       ROUND(SUM(Profit),2) AS total_profit,
       COUNT(DISTINCT Order_ID) AS total_orders
FROM ecommerce_sales;

-- PREPARE/PROCESS: Check missing values
SELECT
  SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
  SUM(CASE WHEN Product IS NULL THEN 1 ELSE 0 END) AS missing_product,
  SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS missing_sales
FROM ecommerce_sales;

-- ANALYZE: Product performance
SELECT Product,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit,
       ROUND(100.0*SUM(Profit)/SUM(Sales),2) AS profit_margin_pct
FROM ecommerce_sales
GROUP BY Product
ORDER BY sales DESC;

-- ANALYZE: Category performance
SELECT Category,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY sales DESC;

-- ANALYZE: Monthly trend
SELECT strftime('%Y-%m', Order_Date) AS month,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit
FROM ecommerce_sales
GROUP BY month
ORDER BY month;

-- ANALYZE: Top 10 customers
SELECT Customer,
       ROUND(SUM(Sales),2) AS sales,
       COUNT(DISTINCT Order_ID) AS orders
FROM ecommerce_sales
GROUP BY Customer
ORDER BY sales DESC
LIMIT 10;

-- ANALYZE: City performance
SELECT City,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit
FROM ecommerce_sales
GROUP BY City
ORDER BY sales DESC;

-- SHARE: Products with low profit margin
SELECT Product,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit,
       ROUND(100.0*SUM(Profit)/SUM(Sales),2) AS margin_pct
FROM ecommerce_sales
GROUP BY Product
HAVING SUM(Sales) > 0
ORDER BY margin_pct ASC;
