-- Show all users.
SELECT 
    *
FROM
    users;

-- Find the email of the user named "Alice Johnson".
SELECT 
    email
FROM
    users
WHERE
    user_name = 'Alice Johnson';

-- List all products in the "Electronics" category.
SELECT 
    p.*
FROM
    products p
        JOIN
    categories c ON p.category_id = c.category_id
WHERE
    c.category_name = 'Electronics';
    
-- Show all orders with the status "pending".
SELECT 
    *	
FROM
    orders
WHERE
    order_status = 'Pending';
    
-- Get product names and prices where the stock is more than 20.
SELECT 
    product_name, price
FROM
    products
WHERE
    stock > 20;

###############################################################################
# Basic JOINs
-- List all orders with user names.
SELECT 
    o.order_id, u.user_name, o.total_amount, o.order_status
FROM
    orders o
        JOIN
    users u
WHERE
    o.user_id = u.user_id;
    
-- Show each order's items with product names and quantities.
SELECT 
    oi.order_item_id, p.product_name, oi.order_quantity
FROM
    order_items oi
        JOIN
    products p
WHERE
    oi.product_id = p.product_id;
-- Get a list of products with their category names.

#####################################################################################
# Filtering & Sorting
-- List products priced over $50, sorted from highest to lowest price.
SELECT 
    product_name, price
FROM
    products
WHERE
    price > 50
ORDER BY price DESC	;

-- Show users who registered in the last 30 days.
SELECT 
    user_name
FROM
    users
WHERE
    created_at >= NOW() - INTERVAL 30 DAY;
