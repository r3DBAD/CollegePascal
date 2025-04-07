program r3d1337;

type
  t_chs = set of Char; 
  
const
  lett: t_chs = ['a'..'z', 'A'..'Z', '_'];  
  num: t_chs = ['0'..'9'];  

var
  str: string;  
  i: integer;      
  is_correct: boolean;

begin
  is_correct := true; 
  
  write('Введите строку: ');
  readln(str);
  
  if length(str) = 0 then
  begin
    is_correct := false;
    writeln('Строка пуста.');
  end
  else
  begin
    if not (str[1] in lett) then
    begin
      is_correct := false;
      writeln('Первый символ или строка или подчеркивание');
    end
    else
    begin
      for i := 2 to length(str) do
      begin
        if not (str[i] in lett + num) then
        begin
          is_correct := false;
          writeln('Нельзя использовать этот символ: ', str[i]);
          break;
        end;
      end;
    end;
  end;

  if is_correct then
    writeln('Строка соблюдает условия')
  else
    writeln('Строка не соблюдает условия');
end.
