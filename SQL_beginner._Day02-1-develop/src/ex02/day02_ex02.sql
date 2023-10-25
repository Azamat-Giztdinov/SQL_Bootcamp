select
    (case
        when person.name is NULL then '-'
        else person.name
    end
    ) as person_name,
    vs.visit_date as visit_date,
    (case
        when pz.name is NULL then '-'
        else pz.name
    end
    ) as pizzeria_name from person
full join (select * from person_visits where visit_date between '2022-01-01' and '2022-01-03') as vs
on person.id = vs.person_id
full join (select * from pizzeria) as pz on pz.id= vs.pizzeria_id
order by person_name, visit_date, pizzeria_name;