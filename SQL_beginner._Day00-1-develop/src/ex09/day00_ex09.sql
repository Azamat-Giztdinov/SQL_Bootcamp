select pv.person as person_name,
       pv.pizzeria as pizzeria_name
from ( select (
                select name from person
                where person.id = person_visits.person_id
            ) as person,
            ( select name from pizzeria
                where pizzeria.id = person_visits.pizzeria_id
            )as pizzeria  from person_visits
        where visit_date between '2022-01-07' and '2022-01-09'
    ) as pv
order by person_name asc, pizzeria_name desc;