select order_date, concat(ps.name, '(age:', ps.age, ')') as person_information
from person_order natural join (select id as person_id, name, age from person) as ps
order by order_date asc, person_information asc;