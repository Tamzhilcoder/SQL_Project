INSERT INTO users (user_name, email, pass_word) VALUES
('Alice Johnson', 'alice@example.com', 'hashed_pw1'),
('Bob Smith', 'bob@example.com', 'hashed_pw2'),
('Charlie Lee', 'charlie@example.com', 'hashed_pw3');

INSERT INTO categories (category_name, category_description) VALUES
('Electronics', 'Devices like smartphones, laptops, and accessories'),
('Books', 'Fiction, non-fiction, and educational books'),
('Clothing', 'Apparel for men, women, and children');

INSERT INTO products (product_name, product_description, price, stock, category_id) VALUES
('iPhone 14', 'Apple smartphone with A15 chip', 999.99, 25, 1),
('Samsung Galaxy S22', 'Android smartphone with high-end features', 899.50, 30, 1),
('The Alchemist', 'Inspirational novel by Paulo Coelho', 12.99, 100, 2),
('Men\'s T-Shirt', 'Cotton t-shirt, various sizes', 19.99, 50, 3),
('Women\'s Jeans', 'Slim fit denim jeans', 39.99, 40, 3);

INSERT INTO orders (user_id, total_amount, order_status) VALUES
(1, 1019.98, 'pending'),
(2, 12.99, 'shipped'),
(3, 59.98, 'delivered');

INSERT INTO order_items (order_id, product_id, order_quantity, order_price) VALUES
(1, 1, 1, 999.99),
(1, 4, 1, 19.99),
(2, 3, 1, 12.99),
(3, 4, 1, 19.99),
(3, 5, 1, 39.99);

INSERT INTO reviews (product_id, user_id, rating, review_comment) VALUES
(1, 1, 5, 'Amazing phone! Super fast and great camera.'),
(3, 2, 4, 'Enjoyed reading it, very motivational.'),
(5, 3, 3, 'Nice jeans but the size runs small.');
