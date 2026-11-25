-- 02_kpi_analysis.sql
-- Author: Shubhangi Rahul Badgujar
-- Project: Superstore Sales, Profit & Discount Analysis (2014-2017)

-- 1. Overall KPI Summary
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND((SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100, 2) AS profit_margin_pct,
    COUNT(DISTINCT Order_ID) AS total_orders,
    COUNT(DISTINCT Customer_ID) AS total_customers
FROM cleaned_superstore;

-- 2. Regional Performance
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND((SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100, 2) AS profit_margin_pct,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM cleaned_superstore
GROUP BY Region
ORDER BY total_sales DESC;

-- 3. Discount Band Impact on Profit Margin
SELECT
    Discount_Band,
    COUNT(*) AS line_items,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND((SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100, 2) AS profit_margin_pct
FROM cleaned_superstore
GROUP BY Discount_Band
ORDER BY total_sales DESC;

-- 4. Sub-Category Profit Ranking
SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM cleaned_superstore
GROUP BY Category, Sub_Category
ORDER BY total_profit DESC;

-- 5. Quarterly Sales Seasonality
SELECT
    EXTRACT(QUARTER FROM Order_Date) AS quarter_num,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM cleaned_superstore
GROUP BY EXTRACT(QUARTER FROM Order_Date)
ORDER BY quarter_num;
