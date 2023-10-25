with woman as (select pizzeria.name
               from pizzeria
                        join person_visits pv on pizzeria.id = pv.pizzeria_id
                        join person on pv.person_id = person.id
               where person.gender = 'female'),
     man as (select pizzeria.name
             from pizzeria
                      join person_visits pv on pizzeria.id = pv.pizzeria_id
                      join person on pv.person_id = person.id
             where person.gender = 'male')
select *
from (
         select woman.name as pizzeria_name
         from woman
         except all
         select *
         from man) as w_m
union all
select *
from (
         select *
         from man
         except all
         select *
         from woman) as m_w
order by 1;
