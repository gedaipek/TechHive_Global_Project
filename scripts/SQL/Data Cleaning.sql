SELECT *
FROM Project_Elits.dbo.order_info
WHERE id = 'ca24d628bdb'

WITH removing_duplicates AS 
(
	SELECT 
	*,
	ROW_NUMBER() OVER (PARTITION BY customer_id, id, purchase_ts, product_name, product_id, usd_price, local_price, currency, purchase_platform ORDER BY(SELECT NULL)) AS rn
	FROM Project_Elits.dbo.order_info
)
DELETE FROM Project_Elits.dbo.order_info
WHERE id IN 
(
	SELECT
	id
	FROM removing_duplicates
	WHERE rn > 1
)