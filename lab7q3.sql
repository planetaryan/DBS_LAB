set serveroutput ON
DECLARE
issue date;
return date;
days number;
BEGIN
		

	issue :='&issue_date';
	
	return :='&return_date';

	days :=return-issue;

	dbms_output.put_line('No. of days: '|| days);

	if days<=7 then
		dbms_output.put_line('Fine/day: NIL');
	elsif days>=8 and days<=15 then
		dbms_output.put_line('Fine/day: 1');
	elsif days>=16 and days<=30 then
		dbms_output.put_line('Fine/day: 2');
	else
		dbms_output.put_line('Fine: 5');
	
	

	end if;
END;
/