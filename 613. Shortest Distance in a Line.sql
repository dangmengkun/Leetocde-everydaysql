One trick here is to add the condition in the join to avoid calculating the distance between a point with itself.

select min(abs(p1.x-p2.x)) as shortest
from point p1 join point p2
on p1.x!=p2.x
