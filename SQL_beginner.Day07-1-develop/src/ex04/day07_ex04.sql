select person.name, count_of_visits from (select person_id, count(pizzeria_id) as count_of_visits from person_visits pv
-- join person on pv.person_id = person.id
group by person_id
having count(pizzeria_id) > 3) as visit
join person on person_id = person.id;
