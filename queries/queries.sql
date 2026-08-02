
Queries · SQL
-- ============================================================
-- Query 1: Produtos com estoque abaixo de 30 unidades
-- EN: Lists products with stock below 30 units, ordered from most
--     to least critical. Goal: quickly spot items that need restocking.
-- PT: Lista produtos com estoque abaixo de 30 unidades, ordenados do
--     mais crítico para o menos crítico. Objetivo: identificar rapidamente
--     itens que precisam de reposição.
-- ============================================================
SELECT name, stock_quantity FROM products
WHERE stock_quantity < 30
ORDER BY stock_quantity ASC;
 
 
-- ============================================================
-- Query 2: Receita total por categoria (apenas pedidos completed)
-- EN: Sums revenue (quantity * unit price) grouped by product category,
--     considering only completed orders. Goal: understand which product
--     categories generate the most revenue for the business.
-- PT: Soma a receita (quantidade * preço unitário) agrupada por categoria
--     de produto, considerando apenas pedidos completos. Objetivo: entender
--     quais categorias de produto geram mais receita para o negócio.
-- ============================================================
SELECT categories.name AS category_name, ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM order_items
JOIN products ON order_items.product_id = products.product_id
JOIN orders ON order_items.order_id = orders.order_id
JOIN categories ON products.category_id = categories.category_id
WHERE STATUS = 'completed'
GROUP BY categories.name;
 
 
-- ============================================================
-- Query 3: Top 5 clientes por valor total gasto (apenas pedidos completed)
-- EN: Ranks the top 5 customers by total amount spent, considering only
--     completed orders. Goal: identify the store's most valuable customers,
--     useful for loyalty programs or targeted marketing.
-- PT: Classifica os 5 clientes que mais gastaram no total, considerando
--     apenas pedidos completos. Objetivo: identificar os clientes mais
--     valiosos da loja, útil para programas de fidelidade ou marketing
--     direcionado.
-- ============================================================
SELECT customers.customer_id, customers.name, ROUND(SUM(quantity * unit_price), 2) AS total_spent
FROM customers
JOIN orders ON orders.customer_id = customers.customer_id
JOIN order_items ON order_items.order_id = orders.order_id
WHERE STATUS = 'completed'
GROUP BY customers.customer_id, customers.name
ORDER BY total_spent DESC
LIMIT 5;
 
 
-- ============================================================
-- Query 4: Clientes que nunca compraram (LEFT JOIN)
-- EN: Finds customers registered in the system who have never placed
--     an order, using a LEFT JOIN to keep customers with no matching
--     orders. Goal: identify inactive customers, useful for re-engagement
--     campaigns.
-- PT: Encontra clientes cadastrados no sistema que nunca fizeram nenhum
--     pedido, usando LEFT JOIN para manter clientes sem pedidos
--     correspondentes. Objetivo: identificar clientes inativos, útil para
--     campanhas de reengajamento.
-- ============================================================
SELECT customers.name FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE orders.order_id IS NULL;
 
 
-- ============================================================
-- Query 5: Ticket médio por pedido (apenas pedidos completed)
-- EN: Calculates the average amount spent per order using a subquery:
--     the inner query sums the total per order, and the outer query
--     averages those totals. Goal: understand typical order value,
--     a key metric for pricing and promotion strategy.
-- PT: Calcula o valor médio gasto por pedido usando uma subquery: a
--     consulta interna soma o total por pedido, e a consulta externa
--     tira a média desses totais. Objetivo: entender o valor típico de
--     um pedido, uma métrica chave para estratégias de preço e promoção.
-- ============================================================
SELECT ROUND(AVG(order_total), 2) AS average_ticket
FROM (
    SELECT order_items.order_id, SUM(quantity * unit_price) AS order_total
    FROM order_items
    JOIN orders ON order_items.order_id = orders.order_id
    WHERE STATUS = 'completed'
    GROUP BY order_items.order_id
) AS pedidos;
 
 
-- ============================================================
-- Query 6: Ranking de produtos mais vendidos por quantidade (window function)
-- EN: Ranks products by total units sold using the RANK() window function,
--     considering only completed orders. Goal: identify best-selling
--     products without collapsing individual rows via a subquery, showing
--     each product's sales rank position.
-- PT: Classifica os produtos pela quantidade total vendida usando a window
--     function RANK(), considerando apenas pedidos completos. Objetivo:
--     identificar os produtos mais vendidos sem precisar de subquery,
--     mostrando a posição de cada produto no ranking de vendas.
-- ============================================================
SELECT products.name AS products_name, SUM(quantity) AS total_sold, RANK() OVER (ORDER BY SUM(quantity) DESC) AS sales_rank
FROM order_items
JOIN products ON order_items.product_id = products.product_id
JOIN orders ON order_items.order_id = orders.order_id
WHERE status = 'completed'
GROUP BY products.name
ORDER BY sales_rank;
 
