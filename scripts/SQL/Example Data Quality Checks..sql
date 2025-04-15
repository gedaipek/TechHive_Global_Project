==============================================================================
-- Utilizing the dataset for the first time by performing essential checks to identify data inconsistencies, missing values, incorrect records, and time ranges.
==============================================================================

-- 1. DUPLICATE CHECKS

-- 1.1 Check for Duplicate Orders
SELECT
    id AS order_id,
    COUNT(*) AS order_id_count
FROM TechHive.dbo.orders
GROUP BY id
HAVING COUNT(*) > 1;

SELECT
    customer_id,
    COUNT(*) AS customer_count
FROM TechHive.dbo.customers
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 2. MISSING VALUES CHECK

-- 2.1 Count of NULLs in Key Fields
SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN purchase_ts IS NULL THEN 1 ELSE 0 END) AS null_purchase_ts,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS null_product_name,
    SUM(CASE WHEN currency IS NULL THEN 1 ELSE 0 END) AS null_currency,
    SUM(CASE WHEN local_price IS NULL THEN 1 ELSE 0 END) AS null_local_price,
    SUM(CASE WHEN usd_price IS NULL THEN 1 ELSE 0 END) AS null_usd_price
FROM TechHive.dbo.orders;

-- 3. DISTINCT VALUE CHECKS
SELECT DISTINCT product_name FROM TechHive.dbo.orders ORDER BY 1;
SELECT DISTINCT purchase_platform FROM TechHive.dbo.orders ORDER BY 1;
SELECT DISTINCT country_code FROM TechHive.dbo.customers;
SELECT DISTINCT loyalty_program FROM TechHive.dbo.customers ORDER BY 1;

-- 4. DATE RANGE & TIME DIMENSIONS EXPLORATION

-- 4.1 First and Last Order Dates
SELECT 
    MIN(purchase_ts) AS first_order_date, 
    MAX(purchase_ts) AS last_order_date,
    DATEDIFF(YEAR, MIN(purchase_ts), MAX(purchase_ts)) AS order_range_years,
    DATEDIFF(MONTH, MIN(purchase_ts), MAX(purchase_ts)) AS order_range_months
FROM TechHive.dbo.orders;

-- 4.2 Shipping & Delivery Timelines
SELECT 
    purchase_ts,
    ship_ts,
    delivery_ts,
    DATEDIFF(DAY, purchase_ts, ship_ts) AS days_to_ship,
    DATEDIFF(DAY, purchase_ts, delivery_ts) AS days_to_delivery
FROM TechHive.dbo.order_status;

-- 4.3 Purchase, Shipping, Delivery, Refund, and Account Created Date Ranges To Understand Time Frames
SELECT
    MIN(purchase_ts) AS earliest_order_date,
    MAX(purchase_ts) AS latest_order_date,
    MIN(ship_ts) AS earliest_ship_date,
    MAX(ship_ts) AS latest_ship_date,
    MIN(delivery_ts) AS earliest_delivery_date,
    MAX(delivery_ts) AS latest_delivery_date,
    MIN(refund_ts) AS earliest_refund_date,
    MAX(refund_ts) AS latest_refund_date
FROM TechHive.dbo.order_status;

-- 4.4 Customer Account Creation Range
SELECT
    MIN(created_on) AS earliest_created_on,
    MAX(created_on) AS latest_created_on
FROM TechHive.dbo.customers;

