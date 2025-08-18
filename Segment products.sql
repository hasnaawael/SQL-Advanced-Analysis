/*
===============================================================================
Data Segmentation Analysis
===============================================================================
Purpose:
    - To group data into meaningful categories for targeted insights.
    - For customer segmentation, product categorization, or regional analysis.

SQL Functions Used:
    - CASE: Defines custom segmentation logic.
    - GROUP BY: Groups data into segments.
===============================================================================
*/

/*Segment products into cost ranges and 
count how many products fall into each segment*/
WITH product_segment AS
(
SELECT cost ,product_name ,product_key,
CASE 
	WHEN cost < 100 THEN 'Beloww 100'
	WHEN cost BETWEEN 100 AND 500 THEN '100 - 500'
	WHEN cost BETWEEN 500 AND 1000 THEN '500 - 1000'
	ELSE 'Above 100'
END AS cost_range
FROM gold.dim_products
)
SELECT cost_range , Count(product_key) AS total_product
FROM product_segment
GROUP BY cost_range
ORDER BY total_product DESC ;