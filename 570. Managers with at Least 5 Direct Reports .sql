select e.Name 
from employee as e
inner join
(select ManagerId
from employee
group by ManagerId
having count(ManagerId)>=5) as b
on e.Id=b.ManagerId;
