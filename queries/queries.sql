-- Query 1: Receita total por categoria (apenas pedidos completed)
select categories.name as category_name, round(sum(quantity * unit_price), 2) as total_revenue
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
group by customers.customer_id, customers.name
order by total_spent desc
limit 5;

-- Query 3: Produtos com estoque abaixo de 30 unidades
select name, stock_quantity from products
where stock_quantity < 30
order by stock_quantity asc;

-- Query 4: Ticket médio por pedido (apenas pedidos completed)
select round(avg(order_total), 2) as average_ticket
from (
    select order_items.order_id, sum(quantity * unit_price) as order_total
    from order_items
    join orders on order_items.order_id = orders.order_id
    where status = 'completed'
    group by order_items.order_id
) as pedidos;
