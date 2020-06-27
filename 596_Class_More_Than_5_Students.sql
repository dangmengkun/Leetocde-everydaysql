 the same student can be in the same class more than once. 
so you need to get a result containing a unique list of students and classes, then count.
select class
from courses 
group by class
having count(distinct student)>=5
