select address, pizzeria.name as name, (count(menu_id)) as count_of_orders
from person
join person_order po on person.id = po.person_id
join menu on po.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
group by address, pizzeria.name
order by address, name;
