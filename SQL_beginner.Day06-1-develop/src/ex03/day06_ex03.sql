create unique index if not exists idx_person_discounts_unique on only person_discounts (person_id, pizzeria_id);

set enable_seqscan = off;
explain analyze
select *
from person_discounts
where person_id = 4 and pizzeria_id = 6;