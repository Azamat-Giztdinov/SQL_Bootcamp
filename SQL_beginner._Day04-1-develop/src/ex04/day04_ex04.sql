create view v_symmetric_union
as
select *
from (
         with date2 as (select person_id
                        from person_visits
                        where visit_date = '2022-01-02'),
              date6 as (select person_id
                        from person_visits
                        where visit_date = '2022-01-06')
             (select *
              from date2
              except
              select *
              from date6)
         union
         (select *
          from date6
          except
          select *
          from date2)
         order by person_id) as day;

