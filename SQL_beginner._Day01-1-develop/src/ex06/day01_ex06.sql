select order_date as action_date, name as person_name from person_order join person p on person_order.person_id = p.id
intersect
select visit_date as action_date, name as person_name from person_visits join person p on person_visits.person_id = p.id
order by action_date asc , person_name desc;