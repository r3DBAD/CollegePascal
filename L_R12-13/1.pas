﻿program my52;
var
   filetext: text;
   a:string;
   i:integer;
begin
assign(filetext,'d:\text.txt');
rewrite(filetext);
for i:=1 to 10 do
  begin
  writeln(filetext,i)
end;
close(filetext);
reset(filetext);

for i:=1 to 10 do 
begin
  readln(filetext,a);
  writeln(a);
end;

close(filetext);
end.