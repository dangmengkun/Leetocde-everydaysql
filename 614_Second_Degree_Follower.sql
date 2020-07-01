  
-- Solution 1: Subquery
select followee as follower, count(distinct follower) as num
from follow 
where followee in (select follower from follow)
group by followee
order by followee

-- Solution 2: Join
SELECT f1.follower, COUNT(DISTINCT f2.follower) AS num
FROM follow f1
JOIN follow f2
ON f1.follower = f2.followee
GROUP BY f1.follower
ORDER BY f1.follower;
