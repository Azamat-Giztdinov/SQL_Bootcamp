with pizz_id as (select pizzeria.id as pizzeria_id
                 from pizzeria
                          join menu on pizzeria.id = menu.pizzeria_id
                 where (menu.price < 800 and pizzeria.name <> (select * from mv_dmitriy_visits_and_eats)))
insert
into person_visits
values ((select max(id) from person_visits) + 1,
        (select person.id from person where (person.name = 'Dmitriy')),
        (select min(pizz_id.pizzeria_id) from pizz_id), '2022-01-08');
refresh materialized view mv_dmitriy_visits_and_eats;

-- SELECT * FROM mv_dmitriy_visits_and_eats;