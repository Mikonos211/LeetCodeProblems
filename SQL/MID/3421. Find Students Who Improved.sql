/* Write your T-SQL query statement below */
with pierwszeTesty as 
(select student_id, subject, score, exam_date
from (
    select *,
           row_number() over (partition by student_id, subject order by exam_date) as rn
    from scores
) as ranked
where rn = 1
), ostatnieEgzaminy as
(select student_id, subject, score, exam_date
from (
    select *,
           row_number() over (partition by student_id, subject order by exam_date desc) as rn
    from scores
) as ranked
where rn = 1)

select pierwszeTesty.student_id, pierwszeTesty.subject , pierwszeTesty.score as first_score, ostatnieEgzaminy.score as latest_score 
from pierwszeTesty
join ostatnieEgzaminy on ostatnieEgzaminy.student_id = pierwszeTesty.student_id
where pierwszeTesty.score < ostatnieEgzaminy.score and pierwszeTesty.subject = ostatnieEgzaminy.subject 
