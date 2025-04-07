program my52;

const
  NumberOfElements = 10; 
var
  InputFile: File of Real;
  OddFile, EvenFile: TextFile;
  Number: Real;
  i: Integer;

begin
  Assign(InputFile, 'd:\input.dat');
  Rewrite(InputFile);
  
  Randomize;
  for i := 1 to NumberOfElements do
  begin
    Number := Random * 100; 
    Write(InputFile, Number); 
  end;
  
  Close(InputFile);
 
  Assign(InputFile, 'd:\input.dat');
  Reset(InputFile);
  
  AssignFile(OddFile, 'd:\odd.txt');
  Rewrite(OddFile);
  
  Assign(EvenFile, 'd:\even.txt');
  Rewrite(EvenFile);
  i := 1; 
  while not Eof(InputFile) do
  begin
    Read(InputFile, Number);
    if i mod 2 = 1 then
      WriteLn(OddFile, Number:0:2)
    else 
      WriteLn(EvenFile, Number:0:2);
    i := i + 1;
  end;

  Close(InputFile);
  Close(OddFile);
  Close(EvenFile);
  
  WriteLn('Все файлы созданы');
end.
