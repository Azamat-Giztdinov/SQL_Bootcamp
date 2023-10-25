select p.name as name, count(menu_id) as count_of_orders,
       round(avg(price), 2) as average_price, max(price) as max_price, min(price) as min_price
from person_order po
join menu on po.menu_id = menu.id
join pizzeria p on p.id = menu.pizzeria_id
group by p.name
order by p.name;
