select day::date as missing_date
from generate_series('2022-01-01', '2022-01-10',interval '1 day') as day
left join (select distinct visit_date from person_visits
where person_id = 1 or person_id =2) as date
on day.day= date.visit_date
where date.visit_date is NULL;