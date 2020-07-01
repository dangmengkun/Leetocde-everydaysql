select cast(
    min(
        SQRT(
            POWER(p1.x-p2.x,2)+POWER(p1.y-p2.y,2)
        )
    )
    AS DECIMAL(10,2)
    ) as shortest
FROM point_2d p1 join point_2d p2
on p1.x!=p2.x or p1.y!=p2.y
