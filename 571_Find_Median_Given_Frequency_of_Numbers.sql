with tb1 as(
select *, sum(frequency) over (order by number) as cum_num,
    sum(frequency) over () as total
    from numbers)
select avg(number) as median
from tb1
where total/2 between cum_num - frequency AND cum_num
