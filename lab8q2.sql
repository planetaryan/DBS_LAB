set serveroutput ON
DECLARE
CURSOR C1 is select * from Student;


vRaiseDate date;



BEGIN
	
	FOR temp IN C1
	LOOP
	
	update Instructor set salary=1.05*salary where id=temp.id;

	vRaiseDate:='&raise_date';

	insert into salary_raise values(temp.id,vRaiseDate,temp.salary);

END Loop; 
END;
/