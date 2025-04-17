/*
===============================================================================
Targeted Business Questions
===============================================================================
Scope:
    Key metrics and insights on revenue, growth, loyalty programs, products, 
    and regions using SQL analysis on the TechHive_cleaned database.

Purpose:
    To answer targeted business questions and support data-driven decisions.

Usage:
    Run on cleaned data to generate insights for reporting and strategy.
===============================================================================
*/ 

-- A Report That Shows All Key Metrics of The Business

SELECT 'Revenue' as measure_name, SUM(usd_price) AS measure_value FROM TechHive_cleaned.dbo.orders
UNION ALL
SELECT 'Order Volume' as measure_name, COUNT(DISTINCT id) AS measure_value FROM TechHive_cleaned.dbo.orders
UNION ALL
SELECT 'Average Order Value' as measure_name, AVG(usd_price) AS measure_value FROM TechHive_cleaned.dbo.orders
UNION ALL
SELECT 'Total Nr. Product Line' as measure_name, COUNT(DISTINCT product_name) AS measure_value FROM TechHive_cleaned.dbo.orders
UNION ALL
SELECT 'Total Nr. Products' as measure_name, COUNT(product_id) AS measure_value FROM TechHive_cleaned.dbo.orders
UNION ALL
SELECT 'Total Nr. Customers ' as measure_name, COUNT(DISTINCT customer_id) AS measure_value FROM TechHive_cleaned.dbo.customers

-- 1. What are the overall trends in sales?
-- 1.1 What are the seasonal trends in sales? Do we observe recurring peaks or drops by month/year?

SELECT
	YEAR(purchase_ts) AS order_year,
	SUM(usd_price) AS revenue,
	COUNT(DISTINCT id) AS order_volume,
	AVG(usd_price) AS avg_order_value
FROM TechHive_cleaned.dbo.orders
WHERE purchase_ts IS NOT NULL
GROUP BY YEAR(purchase_ts)
ORDER BY YEAR(purchase_ts)

SELECT
	DATENAME(MONTH, purchase_ts) AS month_name,
	DATETRUNC(month, purchase_ts) AS order_date,
	ROUND(SUM(usd_price),2) AS revenue,
	COUNT(DISTINCT id) AS total_orders,
	AVG(usd_price) AS avg_order_value
FROM TechHive_cleaned.dbo.orders
WHERE purchase_ts IS NOT NULL
GROUP BY DATENAME(MONTH, purchase_ts), DATETRUNC(month, purchase_ts)
ORDER BY SUM(usd_price) DESC

-- 1.2 Highest Share of sales in December 2020? Which products generate the highest revenue across different regions in December, and what their order volumes and aovs?

SELECT
	o.product_name,
	g.region,
	DATENAME(MONTH, o.purchase_ts) AS month_name,
	DATETRUNC(month, o.purchase_ts) AS order_date,
	ROUND(SUM(o.usd_price),2) AS revenue,
	COUNT(DISTINCT o.id) AS order_volume,
	AVG(o.usd_price) AS avg_order_value
FROM TechHive_cleaned.dbo.orders o
LEFT JOIN TechHive_cleaned.dbo.customers c
ON c.customer_id = o.customer_id
LEFT JOIN TechHive_cleaned.dbo.geo_lookup g
ON g.country=c.country_code
WHERE purchase_ts >= '2020-12-01' AND purchase_ts < '2021-01-01'
GROUP BY o.product_name, g.region, DATENAME(MONTH, o.purchase_ts), DATETRUNC(month, o.purchase_ts)
ORDER BY o.product_name, SUM(o.usd_price) DESC

-- 1.3  Which products underperformed during the October 2022 revenue decline?

SELECT 
    product_name,
    COUNT(id) AS order_volume,
    SUM(usd_price) AS revenue,
    ROUND(AVG(usd_price), 2) AS avg_order_value
FROM TechHive_cleaned.dbo.orders
WHERE purchase_ts >= '2022-10-01' AND purchase_ts < '2022-11-01'
GROUP BY product_name
ORDER BY total_revenue ASC;


-- 1.4 Is our business growing or declining?

SELECT
	order_date,
	revenue,
	SUM(revenue) OVER(ORDER BY order_date) AS running_total_revenue,
	AVG(avg_order_value) OVER (ORDER BY order_date) AS moving_average_order_value
FROM 
(
SELECT
	DATETRUNC(year, purchase_ts) AS order_date,
	SUM(usd_price) AS revenue,
	AVG(usd_price) AS avg_order_value
FROM TechHive_cleaned.dbo.orders
WHERE DATETRUNC(year, purchase_ts) IS NOT NULL
GROUP BY DATETRUNC(year, purchase_ts)
)t

-- 2. Growth Rates: What were our monthly and yearly growth rates?
-- 2.1 Are there spesific months or seasons where growth rates were consistently high/low?
-- 2.2 Which months had the highest/lowest growth? What was the average monthly change ?

WITH monthly_sales_growth_rate AS 
(
	SELECT
	DATENAME(MONTH, purchase_ts) AS month_name,
	DATETRUNC(month, purchase_ts) AS order_date,
	ROUND(SUM(usd_price),2) AS current_revenue,
	COUNT(DISTINCT id) AS order_volume,
	AVG(usd_price) AS avg_order_value
	FROM TechHive_cleaned.dbo.orders
	WHERE purchase_ts IS NOT NULL
	GROUP BY DATETRUNC(month, purchase_ts),  DATENAME(MONTH, purchase_ts)
) ,growth_calculations AS(
SELECT
	order_date,
	month_name,
	order_volume,
	LAG(order_volume) OVER (ORDER BY order_date) AS previous_month_order_volume,
	ROUND(((order_volume - LAG(order_volume) OVER (ORDER BY order_date))*100.0 / LAG(order_volume) OVER (ORDER BY order_date)),2) AS ov_growth_rate_percentage,
	CASE WHEN ((order_volume - LAG(order_volume) OVER (ORDER BY order_date))*100.0 / LAG(order_volume) OVER (ORDER BY order_date)) > 0 THEN 'Growing'
		 WHEN ((order_volume - LAG(order_volume) OVER (ORDER BY order_date))*100.0 / LAG(order_volume) OVER (ORDER BY order_date)) < 0 THEN 'Declining'
		 ELSE 'No Change'
	END AS order_volume_growth_rate_percent_change,
	avg_order_value,
	LAG(avg_order_value) OVER (ORDER BY order_date) AS previous_month_aov,
	ROUND(((avg_order_value - LAG(avg_order_value) OVER (ORDER BY order_date))*100.0 / LAG(avg_order_value) OVER (ORDER BY order_date)),2) AS aov_growth_rate_percentage,
	CASE WHEN ((avg_order_value - LAG(avg_order_value) OVER (ORDER BY order_date))*100.0 / LAG(avg_order_value) OVER (ORDER BY order_date)) > 0 THEN 'Growing'
		 WHEN ((avg_order_value - LAG(avg_order_value) OVER (ORDER BY order_date))*100.0 / LAG(avg_order_value) OVER (ORDER BY order_date)) < 0 THEN 'Declining'
		 ELSE 'No Change'
	END AS aov_growth_rate_percent_change,
	current_revenue,
	AVG(current_revenue) OVER (ORDER BY order_date) AS avg_revenue,
	current_revenue - AVG(current_revenue) OVER (ORDER BY order_date) AS diff_avg,
	CASE WHEN current_revenue - AVG(current_revenue) OVER (ORDER BY order_date) > 0 THEN 'Above Avg'
		 WHEN current_revenue - AVG(current_revenue) OVER (ORDER BY order_date) < 0 THEN 'Below Avg'
		 ELSE 'Avg'
	END AS avg_change,
	LAG(current_revenue) OVER (ORDER BY order_date) AS previous_month_revenue,
	ROUND(((current_revenue - LAG(current_revenue) OVER (ORDER BY order_date))*100.0 / LAG(current_revenue) OVER (ORDER BY order_date)),2) AS revenue_growth_rate_percentage,
	CASE WHEN ((current_revenue - LAG(current_revenue) OVER (ORDER BY order_date))*100.0 / LAG(current_revenue) OVER (ORDER BY order_date)) > 0 THEN 'Growing'
		 WHEN ((current_revenue - LAG(current_revenue) OVER (ORDER BY order_date))*100.0 / LAG(current_revenue) OVER (ORDER BY order_date)) < 0 THEN 'Declining'
		 ELSE 'No Change'
	END AS revenue_growth_rate_percentage_change
FROM monthly_sales_growth_rate
)
,highest_growth AS (
SELECT TOP 1
	order_date,
	ov_growth_rate_percentage,
	aov_growth_rate_percentage,
	revenue_growth_rate_percentage
FROM growth_calculations
WHERE revenue_growth_rate_percentage IS NOT NULL
ORDER BY revenue_growth_rate_percentage DESC
)
,lowest_growth AS (
SELECT TOP 1
	order_date,
	ov_growth_rate_percentage,
	aov_growth_rate_percentage,
	revenue_growth_rate_percentage
FROM growth_calculations
WHERE ov_growth_rate_percentage IS NOT NULL
ORDER BY revenue_growth_rate_percentage
)
SELECT
	hg.order_date AS highest_growth_month,
	hg.ov_growth_rate_percentage AS highest_ov_growth,
	hg.aov_growth_rate_percentage AS highest_aov_growth,
	hg.revenue_growth_rate_percentage AS highest_revenue_growth,
	lg.order_date AS  lowest_growth_month,
	lg.ov_growth_rate_percentage AS lowest_ov_growth,
	lg.aov_growth_rate_percentage AS lowest_aov_growth,
	lg.revenue_growth_rate_percentage AS lowest_revenue_growth
FROM highest_growth hg
CROSS JOIN lowest_growth lg

-- 2.3 In September 2021, while revenue and order volume declined, AOV increased. Which product contributed most to this AOV spike?

SELECT 
    product_name,
    COUNT(id) AS sep_order_volume,
    SUM(usd_price) AS sep_revenue,
    ROUND(AVG(usd_price), 2) AS sep_aov
FROM TechHive_cleaned.dbo.orders
WHERE purchase_ts >= '2021-09-01' AND purchase_ts < '2021-10-01'
GROUP BY product_name
ORDER BY SUM(usd_price) DESC;

-- 2.4 Which customer segments and regions contributed most to the AOV increase through MacBook Pro purchases in September 2021?

SELECT 
    g.region,
    c.loyalty_program,
    COUNT(o.id) AS macbook_orders,
    SUM(o.usd_price) AS revenue,
    ROUND(AVG(o.usd_price), 2) AS aov
FROM TechHive_cleaned.dbo.orders o
LEFT JOIN TechHive_cleaned.dbo.customers c
ON o.customer_id = c.customer_id
LEFT JOIN TechHive_cleaned.dbo.geo_lookup g
ON c.country_code = g.country
WHERE o.purchase_ts BETWEEN '2021-09-01' AND '2021-10-01'
GROUP BY g.region, o.product_name
ORDER BY aov DESC;

-- Despite decreasing sales, did the 27in 4K Gaming Monitor maintain high AOV in EMEA, suggesting premium customer retention?

WITH product_yearly_growth_rate AS 
(
	SELECT
		o.product_name,
		g.region,
		DATETRUNC(year, purchase_ts) AS order_date,
		ROUND(SUM(usd_price),2) AS current_revenue,
		COUNT(DISTINCT id) AS order_volume,
		AVG(usd_price) AS avg_order_value
	FROM TechHive_cleaned.dbo.orders o
	LEFT JOIN TechHive_cleaned.dbo.customers c
	ON o.customer_id = c.customer_id
	LEFT JOIN TechHive_cleaned.dbo.geo_lookup g
	ON c.country_code = g.country
	WHERE purchase_ts IS NOT NULL
	GROUP BY o.product_name, g.region, DATETRUNC(year, purchase_ts)
) 
SELECT
	order_date,
	order_volume,
	LAG(order_volume) OVER (ORDER BY order_date) AS previous_month_order_volume,
	ROUND(((order_volume - LAG(order_volume) OVER (PARTITION BY product_name ORDER BY order_date))*100.0 / LAG(order_volume) OVER (PARTITION BY product_name ORDER BY order_date)),2) AS ov_growth_rate_percentage,
	CASE WHEN ((order_volume - LAG(order_volume) OVER (PARTITION BY product_name ORDER BY order_date))*100.0 / LAG(order_volume) OVER (PARTITION BY product_name ORDER BY order_date)) > 0 THEN 'Growing'
		 WHEN ((order_volume - LAG(order_volume) OVER (PARTITION BY product_name ORDER BY order_date))*100.0 / LAG(order_volume) OVER (PARTITION BY product_name ORDER BY order_date)) < 0 THEN 'Declining'
		 ELSE 'No Change'
	END AS order_volume_growth_rate_percent_change,
	avg_order_value,
	LAG(avg_order_value) OVER (ORDER BY order_date) AS previous_month_aov,
	ROUND(((avg_order_value - LAG(avg_order_value) OVER (PARTITION BY product_name ORDER BY order_date))*100.0 / LAG(avg_order_value) OVER (PARTITION BY product_name ORDER BY order_date)),2) AS aov_growth_rate_percentage,
	CASE WHEN ((avg_order_value - LAG(avg_order_value) OVER (PARTITION BY product_name ORDER BY order_date))*100.0 / LAG(avg_order_value) OVER (PARTITION BY product_name ORDER BY order_date)) > 0 THEN 'Growing'
		 WHEN ((avg_order_value - LAG(avg_order_value) OVER (PARTITION BY product_name ORDER BY order_date))*100.0 / LAG(avg_order_value) OVER (PARTITION BY product_name ORDER BY order_date)) < 0 THEN 'Declining'
		 ELSE 'No Change'
	END AS aov_growth_rate_percent_change,
	current_revenue,
	LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_date) AS previous_month_revenue,
	ROUND(((current_revenue - LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_date))*100.0 / LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_date)),2) AS growth_rate_percentage,
	CASE WHEN ((current_revenue - LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_date))*100.0 / LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_date)) > 0 THEN 'Growing'
		 WHEN ((current_revenue - LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_date))*100.0 / LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_date)) < 0 THEN 'Declining'
		 ELSE 'No Change'
	END AS growth_rate_percentage_change
FROM product_yearly_growth_rate
WHERE product_name = '27in 4K gaming monitor' AND region = 'EMEA'
ORDER BY order_date

-- Do loyalty members show different purchasing patterns, such as higher cross-sell or upsell rates?

WITH order_basket AS (
	SELECT 
		o.id,
		c.loyalty_program,
		COUNT(DISTINCT o.product_id) AS distinct_products,
		SUM(o.usd_price) AS order_total
	FROM TechHive_cleaned.dbo.orders o
	JOIN TechHive_cleaned.dbo.customers c 
	ON o.customer_id = c.customer_id
	WHERE o.purchase_ts IS NOT NULL
	GROUP BY o.id, c.loyalty_program
)
SELECT 
  loyalty_program,
  AVG(distinct_products) AS avg_distinct_products,
  AVG(order_total) AS avg_order_total
FROM order_basket

-- How do loyalty members perform in terms of total revenue, AOV, and order volume compared to non-members? What percentage of overall revenue is contributed by loyalty members? What are their return rate?

WITH loyalty_performance AS (
	SELECT
		c.loyalty_program,
		SUM(usd_price) AS total_revenue,
		COUNT(o.id) AS order_volume,
		AVG(usd_price) AS avg_order_value,
		COUNT(DISTINCT c.customer_id) AS total_customers,
		SUM(CASE WHEN s.refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS total_returns,
		SUM(CASE WHEN refund_ts IS NOT NULL THEN usd_price ELSE 0 END) AS returns_revenue,
		SUM(usd_price) - SUM(CASE WHEN refund_ts IS NOT NULL THEN usd_price ELSE 0 END) AS net_revenue
	FROM TechHive_cleaned.dbo.orders o
	LEFT JOIN TechHive_cleaned.dbo.order_status s
	ON s.order_id = o.id
	LEFT JOIN TechHive_cleaned.dbo.customers c
	ON c.customer_id = o.customer_id
	GROUP BY loyalty_program
)
SELECT
	loyalty_program,
	total_revenue,
	order_volume,
	avg_order_value,
	ROUND(SUM(total_revenue) OVER(),2) AS overall_sales,
	CONCAT(ROUND((total_revenue / SUM(total_revenue) OVER())*100, 2), '%') AS percentage_of_total_revenue,
	total_returns,
	returns_revenue,
	CONCAT(ROUND((CAST(total_returns AS FLOAT)/order_volume)*100,2), '%') AS return_rate_percentage,
	net_revenue,
	CONCAT(ROUND(net_revenue * 100.0 / SUM(net_revenue) OVER (), 2), '%') AS net_revenue_percentage
FROM loyalty_performance
ORDER BY total_revenue DESC

-- Customer Retention: Who are the returning customers by loyalty programs?

SELECT 
    o.customer_id,
	c.loyalty_program,
    COUNT(o.id) AS total_orders,
    SUM(o.usd_price) AS total_spent,
    ROUND(AVG(o.usd_price),2) AS aov
FROM TechHive_cleaned.dbo.orders o
JOIN TechHive_cleaned.dbo.customers c 
ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.loyalty_program
HAVING COUNT(o.id) > 1
ORDER BY ROUND(AVG(o.usd_price),2) DESC;

-- Who are the loyalty members who only order once?

SELECT 
	o.customer_id
FROM TechHive_cleaned.dbo.orders o
JOIN TechHive_cleaned.dbo.customers c 
ON o.customer_id = c.customer_id
WHERE c.loyalty_program = 1
GROUP BY o.customer_id
HAVING COUNT(o.id) = 1

-- Number of customers joining the loyalty program in 2021 and beyond?

SELECT 
	COUNT(*) AS new_loyalty_members
FROM TechHive_cleaned.dbo.customers c 
WHERE loyalty_program = 1 AND created_on >= '2021-09-01'

-- Did those who joined after 2021 increase their order volume, revenue and aov?

SELECT 
	COUNT(*) AS order_volume,
	SUM(usd_price) AS total_revenue,
	AVG(usd_price) AS avg_order_value
FROM TechHive_cleaned.dbo.orders o
JOIN TechHive_cleaned.dbo.customers c 
ON c.customer_id = o.customer_id
WHERE c.loyalty_program = 1 AND c.created_on <= '2021-09-01'

-- What is the repeat purchase rate among loyalty members after 2021 compared to non-members?

WITH customer_retention AS (
	SELECT
		c.loyalty_program,
		o.customer_id,
		COUNT(o.id) AS order_count,
		SUM(o.usd_price) AS total_spent,
		AVG(o.usd_price) AS avg_order_value
	FROM TechHive_cleaned.dbo.orders o
	JOIN TechHive_cleaned.dbo.customers c 
	ON o.customer_id = c.customer_id
	WHERE o.purchase_ts IS NOT NULL AND c.created_on >= '2021-09-01'
	GROUP BY c.loyalty_program, o.customer_id
)
SELECT
	loyalty_program,
	COUNT(customer_id) AS total_customers,
	AVG(order_count) AS avg_orders_per_customer,   
	SUM(total_spent) AS total_revenue,
	AVG(avg_order_value) AS overall_avg_order_value,
	SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers,
	ROUND(100.0 * SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) / COUNT(customer_id), 2) AS repeat_purchase_rate,  -- % of customers with more than one order
	AVG(total_spent) AS avg_spent_per_customer           
FROM customer_retention
GROUP BY loyalty_program;

-- Which products generate the most revenue, orders, and returns? What are their AOVs?
-- What is the revenue, number of orders, and return count for each product line ? What is the average AOV per product line?
-- Which product lines account for the highest % of revenue and returns? Are returns concentrated in a few product lines?

WITH product_performance AS (
	SELECT
		product_name,
		SUM(usd_price) AS total_revenue,
		COUNT(DISTINCT id) AS order_volume,
		AVG(usd_price) AS avg_order_value,
		SUM(CASE WHEN s.refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS total_returns,
		SUM(CASE WHEN refund_ts IS NOT NULL THEN usd_price ELSE 0 END) AS returns_revenue,
		SUM(usd_price) - SUM(CASE WHEN refund_ts IS NOT NULL THEN usd_price ELSE 0 END) AS net_revenue
	FROM TechHive_cleaned.dbo.orders o
	LEFT JOIN TechHive_cleaned.dbo.order_status s
	ON s.order_id = o.id
	GROUP BY product_name)

SELECT
	product_name,
	total_revenue,
	order_volume,
	avg_order_value,
	ROUND(SUM(total_revenue) OVER(),2) AS overall_sales,
	CONCAT(ROUND((total_revenue / SUM(total_revenue) OVER())*100, 2), '%') AS percentage_of_total_revenue,
	total_returns,
	returns_revenue,
	CONCAT(ROUND((CAST(total_returns AS FLOAT)/order_volume)*100,2), '%') AS return_rate_percentage,
	net_revenue,
	CONCAT(ROUND(net_revenue * 100.0 / SUM(net_revenue) OVER (), 2), '%') AS net_revenue_percentage
FROM product_performance
ORDER BY total_revenue DESC

-- ThinkPad Laptop is the most returned product. Which region contributed most to the high return rate of the ThinkPad Laptop?

WITH product_performance AS (
	SELECT
		product_name,
		g.region,
		SUM(usd_price) AS total_revenue,
		COUNT(DISTINCT id) AS order_volume,
		AVG(usd_price) AS avg_order_value,
		SUM(CASE WHEN s.refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS total_returns,
		SUM(CASE WHEN refund_ts IS NOT NULL THEN usd_price ELSE 0 END) AS returns_revenue,
		SUM(usd_price) - SUM(CASE WHEN refund_ts IS NOT NULL THEN usd_price ELSE 0 END) AS net_revenue
	FROM TechHive_cleaned.dbo.orders o
	LEFT JOIN TechHive_cleaned..dbo.order_status s
	ON s.order_id = o.id
	LEFT JOIN TechHive_cleaned..dbo.customers c
	ON c.customer_id = o.customer_id
	LEFT JOIN TechHive_cleaned..dbo.geo_lookup g
	ON g.country = c.country_code
	GROUP BY product_name, g.region
)
SELECT
	product_name,
	region,
	total_revenue,
	order_volume,
	avg_order_value,
	total_returns,
	returns_revenue,
	CONCAT(ROUND((CAST(total_returns AS FLOAT)/order_volume)*100,2), '%') AS return_rate_percentage,
	net_revenue
FROM product_performance
WHERE product_name = 'ThinkPad Laptop'
ORDER BY total_revenue DESC

-- What is the average quarterly order count and total sales for Macbooks sold in North America? (i.e. “For North America Macbooks, average of X units sold per quarter and Y in dollar sales per quarter”)

WITH quarterly_metrics AS (
  SELECT
	  DATETRUNC(purchase_ts, quarter) AS quarter,
	  COUNT(id) AS order_volume,
	  ROUND(SUM(usd_price),2) AS revenue,
	  ROUND(AVG(usd_price),2) AS average_order_value
FROM TechHive_cleaned.dbo.orders o
LEFT JOIN TechHive_cleaned.dbo.customers c
ON o.customer_id = c.id
LEFT JOIN TechHive_cleaned.dbo.geo_lookup g
ON c.country_code = g.country
WHERE product_name = 'Macbook' AND g.region = 'NA'
GROUP BY DATETRUNC(purchase_ts, quarter)
ORDER BY DATETRUNC(purchase_ts, quarter)
)
SELECT
  ROUND(AVG(order_volume),2) AS average_quarterly_orders,
  ROUND(AVG(revenue),2) AS average_quarterly_sales
FROM quarterly_metrics