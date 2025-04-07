program my52;

var
  f: File of Real;  
  numbers: array of Real; 
  val: Real;
  sum: Real;
  count: Integer;
  i, n: Integer;

begin
  Randomize;
  n := 10; 

  SetLength(numbers, n);
  AssignFile(f, 'd:\test.dat');
  Rewrite(f);
  
  for i := 0 to n - 1 do
  begin
    numbers[i] := Random * 100; 
    Write(f, numbers[i]); 
  end;

  CloseFile(f);
  
  AssignFile(f, 'd:\test.dat');
  Reset(f);
  
  sum := 0.0; 
  count := 0; 
  while not Eof(f) do
  begin
    Read(f, val);
    count := count + 1;

    if count mod 2 = 0 then
      sum := sum + val; 
  end;

  CloseFile(f);
  
  WriteLn('Сумма элементов с четными номерами: ', sum:0:2);
end.
