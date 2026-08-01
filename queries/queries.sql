-- Query 1: Receita total por categoria (apenas pedidos completed)

select categories.name as category_name, round(sum(quantity * unit_price), 2)
from order_items
join products on order_items.product_id = products.product_id
join orders on order_items.order_id = orders.order_id
join categories on products.category_id = categories.category_id
where status = 'completed'
group by categories.name;

-- Query 2: Top 5 clientes por valor total gasto (apenas pedidos completed)
select customers.customer_id, customers.name, round(sum(quantity * unit_price), 2) as total_spent
from customers
join orders on orders.customer_id = customers.customer_id
join order_items on order_items.order_id = orders.order_id
where status = 'completed'
group by customers.name
order by round(sum(quantity * unit_price), 2) desc
limit 5;

-- Query 3: Produtos com estoque abaixo de 30 unidades
select name, stock_quantity from products
where stock_quantity < 30
order by stock_quantity asc;

-- Query 4: Ticket médio por pedido (apenas pedidos completed)
SELECT AVG(order_total)
FROM (
    SELECT order_id, SUM(quantity * unit_price) AS order_total
    FROM order_items
    JOIN orders ON order_items.order_id = orders.order_id
    WHERE status = 'completed'
    GROUP BY order_id
) AS pedidos;