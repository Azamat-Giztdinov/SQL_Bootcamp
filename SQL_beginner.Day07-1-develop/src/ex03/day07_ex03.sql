select name, sum(count) as total_count
from (select pizzeria.name as name, count
      from (select *
            from (select pizzeria_id, count(person_id) as count
                  from person_visits pv
                  group by pizzeria_id
                 ) as visit
            union all
            select *
            from (select pizzeria_id, count(menu_id) as count
                  from person_order
                           join menu on person_order.menu_id = menu.id
                           join pizzeria p on menu.pizzeria_id = p.id
                  group by pizzeria_id
                 ) as p_order) as new_table
               join pizzeria on pizzeria_id = pizzeria.id) as pizz
group by name
order by total_count desc, name asc;
