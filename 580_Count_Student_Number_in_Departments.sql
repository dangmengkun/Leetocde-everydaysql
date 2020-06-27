-- Solution 1: Join (注意分清right join还是left join)
Left joining full dept tables (including empty dept) will result in NULL */
select d.dept_name,count(s.student_id) as student_number
from student as s 
right join department as d
on s.dept_id=d.dept_id
group by d.dept_id
ORDER BY student_number DESC, d.dept_name

-- Solution 2: Subquery (我一直很不擅长用subquery)
SELECT DISTINCT d.dept_name,
    (SELECT COUNT(*) FROM student where dept_id = d.dept_id)  AS student_number
FROM department d
ORDER BY student_number DESC, d.dept_name;
