set serveroutput ON
DECLARE
gpa Student.gpa%TYPE;
sRollNo number;
BEGIN
		

	sRollNo :='&Student_roll_no';
	
	dbms_output.put_line('Input roll no is:' || sRollNo );

	SELECT GPA INTO gpa
	FROM Student
	WHERE RollNo =sRollNo;

	dbms_output.put_line('GPA is '||gpa);



END;
/