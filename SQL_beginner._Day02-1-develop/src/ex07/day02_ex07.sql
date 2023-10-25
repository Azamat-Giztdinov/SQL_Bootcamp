select distinct pizzeria.name as name from person_visits pv
join person on pv.person_id = person.id
join pizzeria on pv.pizzeria_id = pizzeria.id
join menu on pizzeria.id = menu.pizzeria_id
where person.name = 'Dmitriy' and pv.visit_date = '2022-01-08'
and menu.price < 800;