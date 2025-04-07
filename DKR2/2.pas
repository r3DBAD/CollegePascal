program my52;
var
  orig_str,subseq_str:string;
  i,j:integer;
  is_subseq:boolean;
begin
  writeln('Введите изначальную строку');
  readln(orig_str);
  writeln('Введите подстроку');
  readln(subseq_str);
  is_subseq := True;
  if Length(subseq_str)>Length(orig_str) then
  begin
    is_subseq:= False
  end
  else
  begin
    i:=1;
    j:=1;
    while (i<=Length(orig_str)) and (j<=Length(subseq_str)) do
    begin
      if orig_str[i] = subseq_str[j] then
        j := j+1;
        i := i+1;
    end;
    if j <= Length(subseq_str) then
      is_subseq := False;
  end;

  if is_subseq then
    writeln('Строка является подпоследовательностью строки')
  else
    writeln('Строка не является подпоследовательностью строки')
end.