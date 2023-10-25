select name from person
join person_order on person.id = person_order.person_id
join menu on person_order.menu_id = menu.id
where address in ('Moscow', 'Samara') and gender = 'male'
and menu.pizza_name in ('pepperoni pizza','cheese pizza')
order by name desc;