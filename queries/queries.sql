-- Query 1: Receita total por categoria (apenas pedidos completed)
SELECT categories.name AS category_name, ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM order_items
JOIN products ON order_items.product_id = products.product_id
JOIN orders ON order_items.order_id = orders.order_id
JOIN categories ON products.category_id = categories.category_id
WHERE STATUS = 'completed'
GROUP BY categories.name;

-- Query 2: Top 5 clientes por valor total gasto (apenas pedidos completed)
SELECT customers.customer_id, customers.name, ROUND(SUM(quantity * unit_price), 2) AS total_spent
FROM customers
JOIN orders ON orders.customer_id = customers.customer_id
JOIN order_items ON order_items.order_id = orders.order_id
WHERE STATUS = 'completed'
GROUP BY customers.customer_id, customers.name
ORDER BY total_spent DESC
LIMIT 5;

-- Query 3: Produtos com estoque abaixo de 30 unidades
SELECT name, stock_quantity FROM products
WHERE stock_quantity < 30
ORDER BY stock_quantity ASC;

-- Query 4: Ticket médio por pedido (apenas pedidos completed)
SELECT ROUND(AVG(order_total), 2) AS average_ticket
FROM (
    SELECT order_items.order_id, SUM(quantity * unit_price) AS order_total
    FROM order_items
    JOIN orders ON order_items.order_id = orders.order_id
    WHERE STATUS = 'completed'
    GROUP BY order_items.order_id
) AS pedidos;

-- Query 5: Clientes que nunca compraram (LEFT JOIN)
SELECT customers.name FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE orders.order_id IS NULL;

-- Query 6: Ranking de produtos mais vendidos por quantidade (window function)
SELECT products.name AS products_name, SUM(quantity) AS total_sold, RANK() OVER (ORDER BY sum(quantity) DESC) AS sales_rank
FROM order_items
JOIN products ON order_items.product_id = products.product_id
JOIN orders ON order_items.order_id = orders.order_id
WHERE status = 'completed'
GROUP BY products.name
ORDER BY sales_rank;