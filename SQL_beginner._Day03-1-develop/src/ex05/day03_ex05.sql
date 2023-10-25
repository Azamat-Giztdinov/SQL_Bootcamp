with visit as (select pizzeria.name as pizzeria_name, visit_date, person_id
               from person_visits
                        join person on person_visits.person_id = person.id
                        join pizzeria on person_visits.pizzeria_id = pizzeria.id
               where person.name = 'Andrey')
select pizzeria_name
from visit
except
select pizzeria_name
from visit
         join person_order po on visit.person_id = po.person_id and visit.visit_date = po.order_date;
