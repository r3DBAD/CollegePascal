program my52;

var
  f: File of Real; 
  numbers: array of Real; 
  n, i: Integer;
  lastLocalMax: Real;
  found: Boolean;

begin
  n := 10; 
  SetLength(numbers, n);

  AssignFile(f, 'd:\test.dat');
  Rewrite(f);
  
  Randomize; 
  for i := 0 to n - 1 do
  begin
    numbers[i] := Random * 100; 
    Write(f, numbers[i]); 
  end;

  CloseFile(f);

  AssignFile(f, 'd:\test.dat');
  Reset(f);
  
  SetLength(numbers, 0);
  n := 0; 

  while not Eof(f) do
  begin
    SetLength(numbers, n + 1);
    Read(f, numbers[n]);
    n := n + 1; 
  end;

  CloseFile(f);

  lastLocalMax := 0; 
  found := False;

  for i := 1 to n - 2 do 
  begin
    if (numbers[i] > numbers[i - 1]) and (numbers[i] > numbers[i + 1]) then
    begin
      lastLocalMax := numbers[i];
      found := True;
    end;
  end;

  if found then
    WriteLn('Последний локальный максимум: ', lastLocalMax)
  else
    WriteLn('Локальные максимумы не найдены.');
end.
