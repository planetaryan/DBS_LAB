set serveroutput on

declare
cursor c is select * from department;

begin

for row in c
loop

course_popular(row.dept_name);
end;
/