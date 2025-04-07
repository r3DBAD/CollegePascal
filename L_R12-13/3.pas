program my52;

var
  text3: text;
  s: string;
  
begin
  AssignFile(text3, 'd:\text3.txt');
  Rewrite(text3); 
  WriteLn(text3, 'Первая строка в файле.');
  WriteLn(text3, 'Вторая строка в файле.');
  CloseFile(text3);
  Write('Введите строку для добавления в конец файла: ');
  ReadLn(s);
  Append(text3); 
  WriteLn(text3, s);
  CloseFile(text3);

  WriteLn('добавили строку в конец файла');
end.
