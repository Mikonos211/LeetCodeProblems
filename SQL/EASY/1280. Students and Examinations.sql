select s.student_id , s.student_name, u.subject_name  , count(e.subject_name) as attended_exams 
from Students s
cross join Subjects u
left join Examinations e on e.student_id = s.student_id and e.subject_name = u.subject_name
group by s.student_id, s.student_name, u.subject_name
order by student_id , u.subject_name
