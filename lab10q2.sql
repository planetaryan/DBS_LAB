
CREATE OR REPLACE TRIGGER log_change_Instructor
BEFORE UPDATE OF id,name,dept_name,salary
on Instructor
FOR EACH ROW
begin
CASE

WHEN UPDATING('id') or UPDATING('name') or UPDATING('dept_name') or UPDATING('salary') THEN
insert into log_change_Instructor
            VALUES (:OLD.id, :OLD.name, :OLD.dept_name, :OLD.salary);

END CASE;
END;
/
