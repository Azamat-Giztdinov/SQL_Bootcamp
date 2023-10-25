comment on table person_discounts is 'Таблица персональных скидок';
comment on column person_discounts.id is 'Индекс строки таблицы';
comment on column person_discounts.person_id is 'Индекс покупателя';
comment on column person_discounts.pizzeria_id is 'Колонка идентификаторов  посещенных пиццерий';
comment on column person_discounts.discount is 'Персональная скидка';

SELECT count(*) = 5 as check
FROM   pg_description
WHERE  objoid = 'person_discounts'::regclass