with new_table as (select pizza_name, pizzeria.name as pizzeria_name, price, pizzeria.id
                   from menu
                            join pizzeria on menu.pizzeria_id = pizzeria.id)
select m1.pizza_name, m1.pizzeria_name as pizzeria_name_1, m2.pizzeria_name as pizzeria_name_2, m1.price
from new_table as m1
         join new_table as m2 on m1.pizza_name = m2.pizza_name and m1.price = m2.price
    and m1.id > m2.id
order by 1;
