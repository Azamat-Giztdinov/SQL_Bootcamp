select pizza_name, price, pizzeria.name as pizzeria_name, visit_date
from person_visits pv
         join person on pv.person_id = person.id
         join pizzeria on pv.pizzeria_id = pizzeria.id
         join menu on pizzeria.id = menu.pizzeria_id
where person.name = 'Kate'
  and menu.price between 800 and 1000
order by pizza_name, price, pizzeria_name;
