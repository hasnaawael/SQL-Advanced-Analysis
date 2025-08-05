/*

Cumulative Analysis: To know how business are growing
-- Calculate the total sales per month 
-- The running totals of sales over time == Total sales from the first year to the current year 

*/
SELECT 
order_date,
total_sales,
SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
AVG(Avg_price) OVER (ORDER BY order_date) AS moving_average_price

-- This is what calculates the total sales for each year.
FROM
(
SELECT 
DATETRUNC(year, order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) AS Avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
)t