select order_date, concat(person.name, '(age:', person.age, ')') as person_information
from person_order join person
on person.id = person_id
order by order_date asc, person_information asc;