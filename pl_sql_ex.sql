set serveroutput ON
DECLARE
bk_count number;
bk_subject varchar2(50);
BEGIN

	bk_subject :='&Subject';
	
	dbms_output.put_line('Input Subject is:' || bk_subject);

	SELECT count(*) INTO bk_count
	FROM book
	WHERE subject =bk_subject;

	dbms_output.put_line('Number of books is'||bk_count);



END;
/