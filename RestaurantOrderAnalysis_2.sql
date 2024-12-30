# Objective 2: Explore the order_details table to get an idea of what data has been collectec

-- 1. View the order_details table 

SELECT *
FROM 
	order_details;

-- 2. What is the date range of the table

SELECT 
	MIN(order_date) AS starting_date,
    MAX(order_date) AS latest_date
FROM 
	order_details;

-- 2023-01-1 and 2023-03-31
-- 3. How many orders were made during this date range

SELECT
	COUNT(DISTINCT order_id) AS count_of_orders
FROM
	order_details
;

-- 4. How many items were ordered within this date range

SELECT 
	COUNT(item_id) AS count_of_items
FROM
	order_details
;

-- 5. Which orders had the most number of items

SELECT 
	order_id,
    COUNT(item_id) AS num_of_items
FROM
	order_details
GROUP BY
	order_id
ORDER BY num_of_items DESC
LIMIT 5
;

-- 6. How many orders had more than 12 items
CREATE TEMPORARY TABLE num_orders
SELECT 
	order_id,
	COUNT(item_id) as count_of_items
FROM
	order_details
GROUP BY
	order_id
HAVING 
	COUNT(item_id) > 12
;

SELECT COUNT(*)
FROM num_orders;
	