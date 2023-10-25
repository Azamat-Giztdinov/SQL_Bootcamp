insert into person_discounts
select ROW_NUMBER() OVER ( ) AS id,
       person_id,
       pizzeria_id,
       (case
            when (count(pizzeria_id) = 1) then 10.5
            when (count(pizzeria_id) = 2) then 22
            else 30
           end)
from person_order
         join menu m on person_order.menu_id = m.id
group by person_id, pizzeria_id;