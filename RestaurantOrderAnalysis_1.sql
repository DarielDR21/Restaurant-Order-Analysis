# Object 1: Explore the items table to get an idea of what's on the menu

-- 1. View the menu_items 

SELECT * FROM menu_items;

-- 2. write a query to find the number of items on the menu

SELECT COUNT(menu_item_id) FROM menu_items;

-- 3. What are the least and most expensive items on the menu

SELECT
    menu_item_id,
    item_name,
    price
FROM
    menu_items
WHERE
	price = (SELECT MAX(price) FROM menu_items)
UNION
SELECT
    menu_item_id,
    item_name,
    price
FROM
    menu_items
WHERE
    price = (SELECT MIN(price) FROM menu_items)
;


-- 4. How many italian dishes are on the menu?
SELECT
	COUNT(menu_item_id)
FROM menu_items
WHERE category = 'Italian'
;

-- 5. What are the least and most expensive italian dishes on the menu

SELECT
	"Most Expensive" AS type,
	menu_item_id,
    item_name,
    price
FROM
	menu_items
WHERE
	price = (SELECT MAX(price) FROM menu_items WHERE category = 'Italian')
UNION ALL
SELECT
	"Least Expensive" AS type,
	menu_item_id,
    item_name,
    price
FROM
	menu_items
WHERE
	price = (SELECT MIN(price) FROM menu_items WHERE category = 'Italian')
    AND menu_item_id = (SELECT menu_item_id FROM menu_items WHERE category = 'Italian' ORDER BY price LIMIT 1)
;
-- 6. How many dishes are in each category? 

SELECT 
	category,
	COUNT(menu_item_id)
FROM 
	menu_items
GROUP BY 
	category
;

-- 7. What is the avg dish price within each category

SELECT 
	category,
	CONCAT('$ ', ROUND(AVG(price), 2)) AS avg_price
FROM 
	menu_items
GROUP BY 
	category


