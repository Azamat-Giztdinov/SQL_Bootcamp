drop function if exists fnc_fibonacci;

create function fnc_fibonacci(in pstop integer default 10)
returns table (
        number integer
    )
as $$
    with recursive fib(first, second) as (
        select 0, 1
        union
        select second, first + second from fib
        where second < pstop
    )
    select first from fib
$$ language sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();