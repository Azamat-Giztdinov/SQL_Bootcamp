select person.name                         as name,
       pizza_name,
       price,
       (price - price * pd.discount / 100) as discount_price,
       p.name                                 pizzeria_name
from person_order po
         join person on po.person_id = person.id
         join menu on po.menu_id = menu.id
         join person_discounts pd on person.id = pd.person_id and menu.pizzeria_id = pd.pizzeria_id
         join pizzeria p on menu.pizzeria_id = p.id
order by 1, 2;