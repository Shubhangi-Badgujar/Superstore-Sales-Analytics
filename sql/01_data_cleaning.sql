-- 01_data_cleaning.sql
-- Author: Shubhangi Rahul Badgujar
-- Project: Superstore Sales, Profit & Discount Analysis (2014-2017)

-- Step 1: Check for NULL values across key columns
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS null_profit,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS null_discount
FROM superstore_raw;

-- Step 2: Create cleaned table with standardized fields and discount bands
CREATE TABLE cleaned_superstore AS
SELECT
    Row_ID,
    Order_ID,
    CAST(Order_Date AS DATE) AS Order_Date,
    CAST(Ship_Date AS DATE) AS Ship_Date,
    Ship_Mode,
    Customer_ID,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Postal_Code,
    Region,
    Product_ID,
    Category,
    Sub_Category,
    Product_Name,
    CAST(Sales AS DECIMAL(12, 2)) AS Sales,
    CAST(Quantity AS INT) AS Quantity,
    CAST(Discount AS DECIMAL(5, 4)) AS Discount,
    CAST(Profit AS DECIMAL(12, 2)) AS Profit,
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount > 0 AND Discount <= 0.10 THEN '1-10%'
        WHEN Discount > 0.10 AND Discount <= 0.20 THEN '11-20%'
        WHEN Discount > 0.20 AND Discount <= 0.30 THEN '21-30%'
        ELSE 'Above 30%'
    END AS Discount_Band
FROM superstore_raw
WHERE Order_ID IS NOT NULL
  AND Sales IS NOT NULL
  AND Profit IS NOT NULL;
