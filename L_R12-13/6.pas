program my52;

var
  sourceFile, targetFile: Text;
  line: string;

begin
  Assign(sourceFile, 'd:\input.txt');
  Reset(sourceFile);
  
  Assign(targetFile, 'd:\output.txt');
  Rewrite(targetFile);
  
  while not Eof(sourceFile) do
  begin
    ReadLn(sourceFile, line);
    
    if Trim(line) <> '' then
    begin
      WriteLn(targetFile, line);
    end;
  end;

  Close(sourceFile);
  Close(targetFile);
end.
