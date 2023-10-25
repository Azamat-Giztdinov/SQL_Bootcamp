select address, round(max(age) - (round(min(age), 2)/max(age)), 2) as formula,
       round(avg(age), 2) as average,
       (case
           when (max(age) - (round(min(age), 2)/max(age))) > round(avg(age), 2) then true
           else false
        end) as comparison
from person
group by address
order by address;
