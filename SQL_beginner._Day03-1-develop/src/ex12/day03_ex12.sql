insert into person_order (id, person_id, menu_id, order_date)
select (generate_series((select max(id) from person_order) + 1,
                        (select max(id) from person_order) + (select count(*) from person))),
       (generate_series((select min(id) from person),
                        (select count(*) from person))),
       (select menu.id from menu where menu.pizza_name = 'greek pizza'),
       '2022-02-25';
