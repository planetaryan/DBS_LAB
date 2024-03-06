set serveroutput on

create or replace
procedure greeting() is

begin

dbms_output.put_line("Good Day to You");

end;
/