set serveroutput ON
DECLARE
gpa Student.gpa%TYPE;
grade varchar(1);
sRollNo number;
BEGIN
		

	sRollNo :='&Student_roll_no';
	
	dbms_output.put_line('Input roll no is:' || sRollNo );

	SELECT GPA INTO gpa
	FROM Student
	WHERE RollNo =sRollNo;

	dbms_output.put_line('GPA is '||gpa);

	IF gpa<4 then
		dbms_output.put_line('Grade: F');
	elsif gpa>=4 and gpa<5 then
		dbms_output.put_line('Grade: E');
	elsif gpa>=5 and gpa<6 then
		dbms_output.put_line('Grade: D');
	elsif gpa>=6 and gpa<7 then
		dbms_output.put_line('Grade: C');
	elsif gpa>=7 and gpa<8 then
		dbms_output.put_line('Grade: B');
	elsif gpa>=8 and gpa<9 then
		dbms_output.put_line('Grade: A');
	elsif gpa>=9 and gpa<=10 then
		dbms_output.put_line('Grade: A+');

	end if;
	
	
	
	


		



END;
/