set serveroutput on

create or replace
procedure dept_details(dept_name varchar) is
dept_name varchar(20);

declare
cursor c1 is select* from instructor where dept_name=dept_name;
cursor c2 is select* from course where dept_name=dept_name;



begin

dept_name:='&department_name';

for t1 in c1
loop

dbms_output.put_line(t1.name);

end loop;

for t2 in c2
loop

dbms_output.put_line(t2.title);

end loop;


end;
/