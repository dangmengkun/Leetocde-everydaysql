select question_id as survey_log 
from (select question_id,
sum(case when action='show' then 1 else 0 end) as show_rate,
sum(case when action='answer' then 1 else 0 end) as answer_rate
from survey_log
group by question_id) tb1
order  by (answer_rate/show_rate) DESC
limit 1
