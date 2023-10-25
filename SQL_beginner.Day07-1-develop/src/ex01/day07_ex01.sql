select name, count(pizzeria_id) as count_of_visits  from person_visits
join person p on person_visits.person_id = p.id
group by name
order by 2 desc , 1 asc
limit 4;
