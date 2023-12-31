create index if not exists idx_person_name on person (upper(name));

set enable_seqscan = off;

explain analyze
select name from person
where upper(name) = 'KATE';