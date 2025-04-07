program my52;

type
  str = string[254];

var
  inputFile: file of str;
  outputFile: TextFile;
  lines: array of string;
  line: str;
  maxLength, i, j, count: integer;

begin
  AssignFile(inputFile, 'd:\input.dat');
  Rewrite(inputFile);

  SetLength(lines, 10); 
  lines[0] := 'grtgtrrgttgrtg';
  lines[1] := 'grtg';
  lines[2] := 'drg';
  lines[3] := 'drgd';
  lines[4] := 'drgdrg';
  lines[5] := 'drgdrgdrgdr';
  lines[6] := 'drgd';
  lines[7] := 'asefsaefsaefasefsafsaefsaef';
  lines[8] := 'fsefs';
  lines[9] := 'sefsefsefsefs';

  for count := 0 to High(lines) do
    Write(inputFile, lines[count]);

  CloseFile(inputFile);

  AssignFile(inputFile, 'd:\input.dat');
  Reset(inputFile);

  maxLength := 0;
  count := 0;

  while not Eof(inputFile) do
  begin
    Read(inputFile, line);
    SetLength(lines, count + 1);
    lines[count] := line;
    if Length(line) > maxLength then
      maxLength := Length(line);
    count := count + 1;
  end;

  CloseFile(inputFile);
  
  Assign(outputFile, 'd:\output.txt');
  Rewrite(outputFile);

  for i := 0 to count - 1 do
  begin
    for j := i + 1 to count - 1 do
    begin
      if Length(lines[i]) < Length(lines[j]) then
      begin
        line := lines[i];
        lines[i] := lines[j];
        lines[j] := line;
      end;
    end;
  end;

  for i := 0 to count - 1 do
  begin
    if (i = 0) or (Length(lines[i]) <> Length(lines[i - 1])) then
      WriteLn(outputFile, lines[i]);
  end;

  Close(outputFile);
end.
