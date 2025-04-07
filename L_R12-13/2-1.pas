program my52;

var 
  inputFile, outputFile: file of char; 
  line: string; 
  lastSpaceIndex, i: integer; 
  ch: char;

begin 
  Assign(inputFile, 'd:\string1.dat'); 
  Reset(inputFile); 

  line := '';

  while not Eof(inputFile) do 
  begin 
    Read(inputFile, ch); 
    line := line + ch; 
  end; 

  lastSpaceIndex := LastPos(' ', line);  

  if lastSpaceIndex > 0 then 
    line := Copy(line, 1, lastSpaceIndex - 1);  

  Close(inputFile); 

  Assign(outputFile, 'd:\output.txt'); 
  Rewrite(outputFile); 
  
  i := 1;

  while i <= Length(line) do 
  begin
    Write(outputFile, line[i]);
    i := i + 1; 
  end;

  Close(outputFile); 
end.
