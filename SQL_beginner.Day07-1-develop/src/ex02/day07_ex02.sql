select pizzeria.name as name, count, action_type
from (select *
      from (select pizzeria_id, count(person_id) as count, ('visit') as action_type
            from person_visits pv
            group by pizzeria_id
            order by count desc
            limit 3) as visit
      union
      select *
      from (select pizzeria_id, count(menu_id) as count, ('order') as action_type
            from person_order
                     join menu on person_order.menu_id = menu.id
                     join pizzeria p on menu.pizzeria_id = p.id
            group by pizzeria_id
            order by count desc
            limit 3
           ) as p_order) as new_table
         join pizzeria on pizzeria_id = pizzeria.id
order by action_type, count desc;

