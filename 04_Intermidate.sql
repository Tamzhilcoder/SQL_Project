# Aggregations & GROUP BY
-- Count the number of products in each category.
SELECT 
    c.category_name, p.product_name, COUNT(p.stock) as stock
FROM
    categories c
        JOIN
    products p
WHERE
    c.category_id = p.category_id
GROUP BY c.category_id;

-- Get total order amount per user.
SELECT 
    u.user_name, SUM(o.total_amount) AS total_order_amount
FROM
    users u
        LEFT JOIN
    orders o ON u.user_id = o.user_id
    group by u.user_id;
    
-- Find the average rating of each product.
SELECT 
    p.product_name, round(avg(r.rating),0) as avg_rating
FROM
    products p
        JOIN
    reviews r
WHERE
    p.product_id = r.product_id
GROUP BY r.product_id;

-- Show the number of orders per order status.
SELECT 
    order_status, COUNT(order_id) as count
FROM
    orders
group by order_status;

# Subqueries
-- Find the user(s) who placed the highest-value order.
SELECT 
    u.user_name, SUM(o.total_amount) AS order_value
FROM
    users u
        JOIN
    orders o
WHERE
    u.user_id = o.user_id
GROUP BY u.user_id
ORDER BY o.total_amount DESC
LIMIT 1;

SELECT 
    u.user_name, o.total_amount
FROM
    users u
        JOIN
    orders o ON o.user_id = u.user_id
WHERE
    o.total_amount = (SELECT 
            MAX(total_amount)
        FROM
            orders);
            
-- List products that have never been ordered.
SELECT 
    product_name
FROM
    products
WHERE
    product_id NOT IN (SELECT DISTINCT
            product_id
        FROM
            order_items);
            
SELECT 
    p.product_name, SUM(oi.order_quantity) AS orders
FROM
    products p
        LEFT JOIN
    order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id;

-- Find categories that have at least one product out of stock.
SELECT DISTINCT
    c.category_name
FROM
    categories c
        JOIN
    products p ON c.category_id = p.category_id
WHERE
    p.stock = 0;
    
-- Show all orders with user name, Product name and quantities
SELECT 
    oi.order_id, u.user_name, p.product_name, oi.Order_quantity
FROM
    order_items oi
        JOIN
    products p ON p.product_id = oi.product_id
        JOIN
    orders o ON oi.order_id = o.order_id
        JOIN
    users u ON o.user_id = u.user_id
GROUP BY oi.order_id;

-- List users along with the number of reviews they have written

SELECT 
    u.user_name, COUNT(r.review_id) AS no_of_reviews
FROM
    users u
        Left JOIN
    reviews r ON r.user_id = u.user_id
    group by u.user_id;
    
-- Get the list of users who ordered more than 3 distinct products
SELECT 
    u.user_name
FROM
    users u
        JOIN
    orders o ON u.user_id = o.user_id
        JOIN
    order_items oi ON oi.order_id = o.order_id
GROUP BY u.user_id
HAVING COUNT(DISTINCT oi.product_id) > 3;

-- Show all orders placed in last 7 days
SELECT 
    *
FROM
    orders
WHERE
    order_date >= NOW() - INTERVAL 7 DAY;

-- Find the most recent order by each users
SELECT 
    u.user_name, o.order_id, MAX(o.order_date)
FROM
    users u
        LEFT JOIN
    orders o ON u.user_id = o.user_id
GROUP BY u.user_id;

SELECT o1.*
FROM orders o1
JOIN (
  SELECT user_id, MAX(order_date) AS latest_order
  FROM orders
  GROUP BY user_id
) o2 ON o1.user_id = o2.user_id AND o1.order_date = o2.latest_order;

