set serveroutput on

CREATE OR REPLACE TRIGGER log_change_Takes
BEFORE INSERT OR UPDATE OF id,course_id,sec_id,semester,year,grade 
OR DELETE on takes
FOR EACH ROW
begin
CASE
WHEN INSERTING THEN
insert into log_change_Takes 
            VALUES (LOCALTIMESTAMP, :NEW.id, :NEW.course_id, :NEW.sec_id, :NEW.semester, :NEW.year, :NEW.grade);
WHEN UPDATING('id') or UPDATING('course_id') or UPDATING('sec_id') or UPDATING('semester') or UPDATING('year') or UPDATING('grade') THEN
insert into log_change_Takes
            VALUES (LOCALTIMESTAMP, :NEW.id, :NEW.course_id, :NEW.sec_id, :NEW.semester, :NEW.year, :NEW.grade);
WHEN DELETING THEN
insert into log_change_Takes 
            VALUES (LOCALTIMESTAMP, :OLD.id, :OLD.course_id, :OLD.sec_id, :OLD.semester, :OLD.year, :OLD.grade);
END CASE;
END;
/
