set serveroutput on
CREATE OR REPLACE TRIGGER log_check_Instructor
after INSERT OR UPDATE OF id,name,dept_name,salary
on Instructor
FOR EACH ROW
declare
dept_budget department1.budget%type;

begin
select budget into dept_budget from department where dept_name=:OLD.dept_name;
CASE

WHEN UPDATING('id') or UPDATING('name') or UPDATING('dept_name') or UPDATING('salary') THEN
	IF :NEW.NAME  like '[^A-Za-z]' then
		dbms_output.put_line("Only alphabets in name allowed");
	elsif :NEW.salary<=0 then
		dbms_output.put_line("salary cannot be 0 or negative");
	elsif :NEW.salary>dept_budget then
		
		dbms_output.put_line("salary cannot be greater than department budget");
	end if;



END CASE;
END;
/
