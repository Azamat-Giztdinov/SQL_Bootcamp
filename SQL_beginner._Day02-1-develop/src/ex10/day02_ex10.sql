select person.name as person_name1, pr.name as person_name2, pr.address as common_address from person
join person pr on person.address = pr.address
where person.id > pr.id
order by person_name1, person_name2, common_address;
