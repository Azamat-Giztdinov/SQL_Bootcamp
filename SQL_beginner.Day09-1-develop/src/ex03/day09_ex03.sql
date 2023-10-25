drop trigger if exists trg_person_insert_audit on person;
drop trigger if exists trg_person_update_audit on person;
drop trigger if exists trg_person_delete_audit on person;

drop function if exists fnc_trg_person_insert_audit;
drop function if exists fnc_trg_person_update_audit;
drop function if exists fnc_trg_person_delete_audit;

truncate person_audit;

create or replace function fnc_trg_person_audit()
returns trigger as $trg_person_audit$
begin
    if(tg_op = 'INSERT') then
        insert into person_audit select current_timestamp at time zone 'Europe/Moscow', 'I', new.*;
    elsif(tg_op = 'UPDATE') then
        insert into person_audit select current_timestamp at time zone 'Europe/Moscow', 'U', old.*;
    elsif(tg_op = 'DELETE') then
        insert into person_audit select current_timestamp at time zone 'Europe/Moscow', 'D', old.*;
    end if;
    return null;
end;
$trg_person_audit$ language plpgsql;


create trigger trg_person_audit
    after insert or update or delete
    on person
    for each row
    execute function fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;