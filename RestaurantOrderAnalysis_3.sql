-- Analyze the menu_items and order_details table to understand customer behavior

-- 1. Combine the menu_items and order_details tables into a singe table

SELECT *
FROM order_details
LEFT JOIN menu_items
	ON menu_items.menu_item_id=order_details.item_id
;

-- 2. What were the least and most ordered items? What categories were they in?

SELECT 
	mi.category,
	mi.item_name,
	COUNT(od.order_id) AS num_items
FROM order_details as od
LEFT JOIN menu_items as mi
	ON mi.menu_item_id=od.item_id
GROUP BY 
	mi.category,
	mi.item_name
ORDER BY
	num_items DESC
;

-- 3. What were the top 5 orders that spent the most money?

SELECT
	od.order_id,
    SUM(mi.price) AS total_spent
FROM 
	order_details AS od
LEFT JOIN 
	menu_items AS mi ON mi.menu_item_id=od.item_id
GROUP BY
	od.order_id
ORDER BY 
	total_spent DESC
LIMIT 5
;

-- 4. View the details of the highest spend order. What insights can you gather from the results?

SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON mi.menu_item_id=od.item_id
WHERE od.order_id = 440
;

SELECT 
	mi.category,
    COUNT(item_id) AS num_of_items
FROM 
	order_details AS od
LEFT JOIN menu_items AS mi
	ON mi.menu_item_id=od.item_id
WHERE 
	od.order_id = 440
GROUP BY 
	mi.category
ORDER BY
	num_of_items DESC
;

-- 5. View the details of the top 5 highest spend orders. What insights can you gather from the results?

SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON mi.menu_item_id=od.item_id
WHERE od.order_id IN (440, 2075, 1957, 330, 2675)
;

SELECT 
	od.order_id,
	mi.category,
    COUNT(item_id) AS num_of_items
FROM 
	order_details AS od
LEFT JOIN menu_items AS mi
	ON mi.menu_item_id=od.item_id
WHERE 
	od.order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY 
	od.order_id,
	mi.category
ORDER BY
	num_of_items DESC
;