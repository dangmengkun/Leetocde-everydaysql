To decide whether a value in a column is unique or not, we can use GROUP BY and COUNT
Check whether the value of a record's TIV_2015 is unique, if it is not unique, and at the same time, 
its location (LAT, LON) pair is unique, then this record meeting the criteria. So it should be counted in the sum.

solution 1 window function & subquery
select CAST(SUM(TIV_2016) AS DECIMAL(10,2)) AS TIV_2016
from 
(select tiv_2016,
count(tiv_2015) over(partition by tiv_2015) as s,
count(*) over (partition by LAT,LON) as a
from insurance
) t
where s>1
AND a=1;

solution 2 Subquery 注意select后面加上concat
select sum(tiv_2016) as TIV_2016
from insurance 
where tiv_2015 in 
(select a.tiv_2015 from insurance as a group by tiv_2015 having count(*)>1)
AND concat(LAT,LON) IN (SELECT concat(LAT,LON) FROM insurance as b group by LAT,LON having count(*)=1)
