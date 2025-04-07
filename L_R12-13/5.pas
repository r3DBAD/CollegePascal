program my52;

var
  inputFile, outputFile: text;
  number, maxNumber, minNumber: Integer;
  firstNum: Boolean;

begin
  AssignFile(inputFile, 'd:\input.txt');
  Reset(inputFile);

  firstNum := True;
  maxNumber := 0;   
  minNumber := 0;   

  while not Eof(inputFile) do
  begin
    ReadLn(inputFile, number);
    
    if firstNum then
    begin
      maxNumber := number;
      minNumber := number;
      firstNum := False;
    end
    else
    begin
      if number > maxNumber then
        maxNumber := number;
      if number < minNumber then
        minNumber := number;
    end;
  end;

  Close(inputFile);

  Assign(outputFile, 'd:\output.txt');
  Rewrite(outputFile);
  WriteLn(outputFile, 'Max: ', maxNumber);
  WriteLn(outputFile, 'Min: ', minNumber);
  Close(outputFile);
end.
