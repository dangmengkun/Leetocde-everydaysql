solution 1
select name
from salesperson s
where name not in
(select s.name
from salesperson s
left join orders o
on s.sales_id = o.sales_id
left join company c
on o.com_id = c.com_id
where c.name = "RED")

solution 2
SELECT name
FROM salesperson
WHERE sales_id NOT IN (
    SELECT o.sales_id
    FROM orders o
    JOIN company c
    ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);
