set serveroutput ON
DECLARE
CURSOR C1 is select * from course;

instructor_name Instructor.name%TYPE;
b section.building%TYPE;
r section.room_number%TYPE;
t section.time_slot_id%TYPE;

count_stud number(2);

BEGIN
	
	FOR temp IN C1
	LOOP
	
	dbms_output.put_line(temp.course_id || temp.title || temp.dept_name || temp.credits);

	select name into instructor_name
	from instructor,teaches
	where temp.course_id=teaches.course_id and teaches.id=instructor.id;
	
	dbms_output.put_line(instructor_name);

	select building,room_number,time_slot_id into b,r,t
	from section
	where temp.course_id=section.course_id; 
	
	dbms_output.put_line(b || r || t);

	select count(*) into count_stud
	from takes
	where takes.course_id=temp.course_id;
	
	dbms_output.put_line(count_stud);
	

END Loop; 
END;
/