-- ==============================================================================
-- Data Preparation: Cleaning, Trasforming, and Organizing Data for analysis in SQL Server
-- ==============================================================================
-- In this script:
--   - We clean inconsistent product names
--   - Add standardized product category and brand features
--   - Extract useful time features from timestamps
--   - Clean customer and region info
--   - Add refund and shipping performance metrics
-- ==============================================================================

-- 1. Clean and Standardize Product Information

WITH cleaned_product AS (
  SELECT
    o.customer_id,
    o.id AS order_id,
    o.purchase_ts AS purchase_date,
    o.product_id,
    CASE 
      WHEN LOWER(o.product_name) LIKE '%gaming monitor%' THEN '27 inch Gaming Monitor'
      WHEN LOWER(o.product_name) LIKE '%macbook%' THEN 'Apple Macbook Air Laptop'
      WHEN LOWER(o.product_name) LIKE '%thinkpad%' THEN 'Lenovo ThinkPad Laptop'
      WHEN LOWER(o.product_name) LIKE '%bose%' THEN 'Bose Soundsport Headphones'
      ELSE o.product_name 
    END AS product_name,
    UPPER(o.currency) AS currency,
    o.local_price,
    o.usd_price,
    o.purchase_platform
  FROM Techhive.dbo.orders AS o
),

-- 2. Enrich Orders with Product Category, Brand, and Time Features

cleaned_orders AS (
  SELECT 
    cp.*,
    CASE 
      WHEN LOWER(cp.product_name) LIKE '%apple%' THEN 'Apple'
      WHEN LOWER(cp.product_name) LIKE '%samsung%' THEN 'Samsung'
      WHEN LOWER(cp.product_name) LIKE '%lenovo%' THEN 'Lenovo'
      WHEN LOWER(cp.product_name) LIKE '%bose%' THEN 'Bose'
      ELSE 'Unknown' 
    END AS brand_name,
    CASE 
      WHEN LOWER(cp.product_name) LIKE '%headphones%' THEN 'Headphones'
      WHEN LOWER(cp.product_name) LIKE '%laptop%' THEN 'Laptop'
      WHEN LOWER(cp.product_name) LIKE '%iphone%' THEN 'Cell Phone'
      WHEN LOWER(cp.product_name) LIKE '%monitor%' THEN 'Monitor'
      ELSE 'Accessories' 
    END AS product_category,
    ROW_NUMBER() OVER (
      PARTITION BY cp.customer_id 
      ORDER BY cp.purchase_date
    ) AS customer_order_number,
    YEAR(cp.purchase_date) AS year,
    CASE 
      WHEN MONTH(cp.purchase_date) = 1 THEN 'January'
      WHEN MONTH(cp.purchase_date) = 2 THEN 'February'
      WHEN MONTH(cp.purchase_date) = 3 THEN 'March'
      WHEN MONTH(cp.purchase_date) = 4 THEN 'April'
      WHEN MONTH(cp.purchase_date) = 5 THEN 'May'
      WHEN MONTH(cp.purchase_date) = 6 THEN 'June'
      WHEN MONTH(cp.purchase_date) = 7 THEN 'July'
      WHEN MONTH(cp.purchase_date) = 8 THEN 'August'
      WHEN MONTH(cp.purchase_date) = 9 THEN 'September'
      WHEN MONTH(cp.purchase_date) = 10 THEN 'October'
      WHEN MONTH(cp.purchase_date) = 11 THEN 'November'
      WHEN MONTH(cp.purchase_date) = 12 THEN 'December'
      ELSE NULL 
    END AS month
  FROM cleaned_product AS cp
),

cleaned_customers AS (
  SELECT
    c.customer_id,
    c.marketing_channel,
    c.account_creation_method,
    UPPER(c.country_code) AS country_code,
    c.loyalty_program,
    c.created_on
  FROM Techhive.dbo.customers AS c
),

-- 4. Standardize Geographic Data (Region & Country)
  
cleaned_geo_lookup AS (
  SELECT
    g.country,
    CASE 
      WHEN UPPER(g.country) = 'EU' THEN 'EMEA'
      WHEN UPPER(g.country) = 'A1' THEN 'Unknown'
      ELSE g.region 
    END AS region
  FROM Techhive.dbo.geo_lookup AS g
),

-- 5. Handling invalid values

cleaned_order_status AS (
  SELECT
    os.order_id AS order_id,
    os.purchase_ts AS purchase_date,
    os.ship_ts AS shipping_date,
    os.delivery_ts AS delivery_date,
    os.refund_ts AS refund_date,
    CASE WHEN os.refund_ts IS NOT NULL THEN 1 ELSE 0 END AS refunded,
    CASE 
      WHEN DATEDIFF(day, os.purchase_ts, os.ship_ts) < 0 THEN NULL 
      ELSE DATEDIFF(day, os.purchase_ts, os.ship_ts) 
    END AS days_to_ship,
    CASE 
      WHEN DATEDIFF(day, os.ship_ts, os.delivery_ts) < 0 THEN NULL 
      ELSE DATEDIFF(day, os.ship_ts, os.delivery_ts) 
    END AS shipping_time,
    CASE 
      WHEN DATEDIFF(day, os.delivery_ts, os.refund_ts) < 0 THEN NULL 
      ELSE DATEDIFF(day, os.delivery_ts, os.refund_ts) 
    END AS days_to_return,
    CASE 
      WHEN DATEDIFF(day, cust.created_on, os.purchase_ts) < 0 THEN NULL 
      ELSE DATEDIFF(day, cust.created_on, os.purchase_ts) 
    END AS days_to_order
  FROM Techhive.dbo.order_status AS os
  LEFT JOIN Techhive.dbo.orders AS o
    ON os.order_id = o.id
  LEFT JOIN Techhive.dbo.customers AS c
    ON o.customer_id = c.customer_id
)

-- 6. Final Data Set: Join All Cleaned Data

SELECT 
  co.order_id,
  co.customer_id,
  co.purchase_date,
  co.product_id,
  co.product_name, 
  co.brand_name,
  co.product_category,        
  co.currency,
  co.local_price,
  co.usd_price,
  co.purchase_platform,
  co.customer_order_number,
  co.year,
  co.month,
  cc.marketing_channel,
  cc.account_creation_method,
  cc.loyalty_program,
  cc.created_on,
  os.shipping_date,
  os.delivery_date,
  os.refund_date,
  os.refunded,
  os.days_to_ship,
  os.shipping_time,
  os.days_to_return,
  os.days_to_order,
  g.country,
  g.region
FROM cleaned_orders AS co
LEFT JOIN cleaned_customers AS cc
  ON co.customer_id = cc.customer_id
LEFT JOIN cleaned_geo_lookup AS g
  ON g.country = cc.country_code
LEFT JOIN cleaned_order_status AS os
  ON os.order_id = co.order_id;
