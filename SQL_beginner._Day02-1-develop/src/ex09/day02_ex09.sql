select name from person
join person_order on person.id = person_order.person_id
join menu on person_order.menu_id = menu.id
where gender = 'female'
and menu.pizza_name in ('pepperoni pizza','cheese pizza')
group by name
having count(name) > 1
order by name;