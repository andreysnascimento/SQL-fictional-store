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
