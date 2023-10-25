select name, rating from pizzeria
left join person_visits
on pizzeria.id = pizzeria_id
where person_visits.pizzeria_id is NULL;