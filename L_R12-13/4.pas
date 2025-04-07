program my52;

var
  inputFile, tempFile: text;
  K, i: Integer;
  line: string;
begin
  Write('Введите номер строки K: ');
  ReadLn(K);

  assign(inputFile, 'd:\input.txt');
  Reset(inputFile);

  Assign(tempFile, 'd:\temp.txt');
  Rewrite(tempFile);

  i := 0;
  while not EOF(inputFile) do
  begin
    ReadLn(inputFile, line);
    i := i+1;

    if i = K then
    begin
      WriteLn(tempFile); 
    end;

    
    WriteLn(tempFile, line);
  end;

  Close(inputFile);
  Close(tempFile);

  if i < K then
  begin
    DeleteFile('d:\temp.txt');
  end
  else
  begin
    Erase(inputFile);
    Rename(tempFile, 'd:\input.txt');
  end;

  WriteLn('все было сделано');
end.
