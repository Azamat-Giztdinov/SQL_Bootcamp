drop function if exists fnc_person_visits_and_eats_on_date;
create function fnc_person_visits_and_eats_on_date(in pperson varchar default 'Dmitriy',
                                                    in pprice numeric default 500,
                                                    in pdate date default '2022-01-08')
      returns table (
          name varchar
          )
as $$
begin
    return query(
        select distinct pizzeria.name as name from person_visits pv
        join person on pv.person_id = person.id
        join pizzeria on pv.pizzeria_id = pizzeria.id
        join menu on pizzeria.id = menu.pizzeria_id
        where person.name = pperson and pv.visit_date = pdate
        and menu.price < pprice
    );

end;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');