# Write your MySQL query statement below
with tb as
(select avg(amount) as mean,date_format(pay_date,'%Y-%m') as pay_month
from salary 
group by date_format(pay_date,'%Y-%m')
 ),   易错点一 括号
tb2 as
(select department_id,avg(amount) as salary1,date_format(pay_date,'%Y-%m') as pay_month
from salary s
join employee e
on s.employee_id=e.employee_id
group by pay_month,department_id)   易错点二：groupby之后，前面select一定要出现这一列。groupby两个就出现两个

select tb2.pay_month,department_id,
case 
when salary1>mean then 'higher'
when salary1<mean then 'lower'
else 'same'
end as comparison      case这部分可以不用加括号
from tb
join tb2
on tb.pay_month=tb2.pay_month
