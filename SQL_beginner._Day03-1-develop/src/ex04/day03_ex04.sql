with woman as (select pizzeria.name
               from pizzeria
                        join menu on pizzeria.id = menu.pizzeria_id
                        join person_order po on menu.id = po.menu_id
                        join person on po.person_id = person.id
               where person.gender = 'female'),
     man as (select pizzeria.name
             from pizzeria
                      join menu on pizzeria.id = menu.pizzeria_id
                      join person_order po on menu.id = po.menu_id
                      join person on po.person_id = person.id
             where person.gender = 'male')
select *
from (
         select woman.name as pizzeria_name
         from woman
         except
         select *
         from man) as w_m
union
select *
from (
         select *
         from man
         except
         select *
         from woman) as m_w
order by 1;


