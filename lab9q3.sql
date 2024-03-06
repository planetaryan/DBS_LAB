set serveroutput on

create or replace
procedure course_popular(dept_name varchar) is
dept_name department1.dept_name%type;
c_id course.course_id%type;
c_name course.title%type;

begin

select course_id into c_id from (select course_id,max(t.num) from (select count(*) as num from takes,course where takes.course_id=course.course_id and course.dept_name=dept_name group by course_id) t )

select title into cname from course where course_id=c_id;

dbms_output.put_line(dept_name || cname);


end;
/