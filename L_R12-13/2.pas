program my52;
var
   text2: text;
   N,K,i:integer;
   string_with_stars:string;
begin
writeln('Введите кол-во строк N');
readln(N);
writeln('Введите кол-во симоволов K');
readln(K);
string_with_stars := StringOfChar('*',K);
assign(text2,'d:\text2.txt');
rewrite(text2);
for i:=1 to n do
begin
  writeln(text2,string_with_stars)
end;
close(text2)
end.