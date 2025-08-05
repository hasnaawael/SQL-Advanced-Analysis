/*
=============================================================
Analysis Sales Performance overtime
=============================================================
Script Purpose:
It’s a valuable technique for analyzing how measurements change over time, 
helping to track trends and uncover seasonality in business data.
By (Year - Month)
*/
SELECT 
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date) , MONTH(order_date)
ORDER BY YEAR(order_date) , MONTH(order_date)