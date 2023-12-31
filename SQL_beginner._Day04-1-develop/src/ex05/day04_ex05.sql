create view v_price_with_discount
as
select person.name as name, pizza_name, price, round(price - price * 0.1) discount_price
from person_order po
         join person on po.person_id = person.id
         join menu on po.menu_id = menu.id
order by name, pizza_name;
