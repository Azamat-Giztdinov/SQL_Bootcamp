select distinct (select name from person
    where person.id = person_order.person_id) as name
from person_order;
