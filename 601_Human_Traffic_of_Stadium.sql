solution1 window_function+ subquery
WITH tb AS(
    SELECT *, ROW_NUMBER() OVER (ORDER BY id) AS r
    FROM stadium
    WHERE people >=100
),
tb2 AS (
    SELECT id, visit_date, people, COUNT(*) OVER (PARTITION BY id-r) AS num
    FROM tb
)
SELECT id, visit_date, people
FROM tb2
WHERE num >= 3;


solution 2 
subquery
select distinct a.* 
from stadium as a,stadium b,stadium c
where a.people>=100 and b.people>=100 and c.people>=100
and (
    (a.id=b.id+1 and b.id=c.id+1 and a.id=c.id+2)
    or 
    (a.id=b.id+1 and a.id=c.id-1 and c.id=b.id+2)
     or
     (a.id=b.id-1 and a.id=c.id-2 and b.id=c.id-1)
     )
  order by a.id   
     




