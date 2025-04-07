program my52;

var
  inputFile: File of Char; 
  i: Integer;
  randomChar: Char;
  count: Integer;

begin
  AssignFile(inputFile, 'd:\chars.dat');
  Rewrite(inputFile);

  Randomize;
  count := 20;  
  
  for i := 1 to count do
  begin
    randomChar := Chr(Random(26) + 65);
    Write(inputFile, randomChar);
  end;

  CloseFile(inputFile);

  AssignFile(inputFile, 'd:\chars.dat');
  Reset(inputFile);

  for i := 0 to count - 1 do
  begin
    Seek(inputFile, i); 
    Read(inputFile, randomChar); 
    
    if i mod 2 = 0 then
      randomChar := '!'; 

    Seek(inputFile, i); 
    Write(inputFile, randomChar);
  end;

  CloseFile(inputFile);
end.
