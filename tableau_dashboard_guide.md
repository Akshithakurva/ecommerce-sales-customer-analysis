# Tableau Dashboard Build Guide

## Dashboard title
E-Commerce Sales & Customer Analysis

## Connect
Open Tableau Public/Desktop -> Connect -> Text file -> ecommerce_sales_cleaned.csv.

## Calculated fields
1. Profit Margin
   SUM([Profit]) / SUM([Sales])

2. Average Order Value
   SUM([Sales]) / COUNTD([Order_ID])

3. Order Month
   DATETRUNC('month',[Order_Date])

## Worksheets
1. KPI Cards: Sales, Profit, Orders, Average Order Value, Profit Margin
2. Monthly Sales Trend: Order Month vs SUM(Sales)
3. Sales by Product: Product vs SUM(Sales)
4. Profit by Category: Category vs SUM(Profit)
5. Sales by City: City vs SUM(Sales)
6. Top 10 Customers: Customer vs SUM(Sales), filter Top 10
7. Product Profitability: Product vs Sales and Profit Margin

## Dashboard filters
- Order Date
- Category
- City
- Product

## Story
Dashboard 1: Executive Overview
Dashboard 2: Product & Category Performance
Dashboard 3: Customer & Regional Analysis

## Recommended insight wording
Focus on what happened, why it may have happened, and what action a business could take.
