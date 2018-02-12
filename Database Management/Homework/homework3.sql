insert into course values('CS-001', 'Weekly Seminar', 'Comp. Sci.', 0);

insert into section values('CS-001', 1, 'Fall', 2009, NULL, NULL, NULL);

Insert into takes
select ID, 'CS-001', 1, 'Fall', 2009, null
from student
where dept_name='Comp. Sci.';

delete from takes
where ID = (select ID from student where name='Chavez');

delete from takes
where course_id='CS-001';

SET FOREIGN_KEY_CHECKS=0; /* to disable the foreign key checks otherwise will produce error without it*/
delete from course
where course_id='CS-001'; /*It cannot delete CS-001 because it is the parent to the CS-001 courses in takes*/
SET FOREIGN_KEY_CHECKS=1; /* to renable them after the change has been made*/


delete from takes
where course_id= (select course_id from course where title like '%database%');


select name,student.ID , count(takes.course_id)
from student left join takes on student.ID=takes.ID
group by student.ID;




select * from course;
select * from takes;
select * from section;
select * from student;

select count(ID) from takes;


select distinct s.name, s.salary 
from instructor as s JOIN instructor as t
where s.salary > t.salary AND s.dept_name = "Comp. Sci." AND t.dept_name = "Comp. Sci.";


select name, title
from instructor natural join teaches natural join course;

select name, course_id from instructor natural join teaches 
where (instructor.ID, dept_name)=(teaches.ID, 'Biology');


