-- Query 1: Receita total por categoria (apenas pedidos completed)

select categories.name as category_name, round(sum(quantity * unit_price), 2)
from order_items
join products on order_items.product_id = products.product_id
join orders on order_items.order_id = orders.order_id
join categories on products.category_id = categories.category_id
where status = 'completed'
group by categories.name;