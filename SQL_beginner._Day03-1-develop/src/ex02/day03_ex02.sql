select pizza_name, price, pizzeria.name as pizzeria_name
from menu
         join pizzeria on menu.pizzeria_id = pizzeria.id
         join (select id as menu_id
               from menu
               except
               select menu_id
               from person_order) as not_id
              on menu.id = not_id.menu_id
order by pizza_name, price;
