program my52;

var
  n: integer;
  i: integer;
  sum: integer;

function IsPrime(num: Int64): Boolean;
var
  j: Int64;
begin
  if num < 2 then
  begin
    IsPrime := False;
    Exit;
  end;
  for j := 2 to Trunc(Sqrt(num)) do
  begin
    if (num mod j = 0) then
    begin
      IsPrime := False;
      Exit;
    end;
  end;
  IsPrime := True;
end;

begin
  Assign(input, 'd:\z3.in.txt');
  Reset(input);
  ReadLn(n);
  Close(input);

  sum := 0;
  i := 1;
  while True do
  begin
    if IsPrime(i) then
    begin
      if i * i * i * i > n then
        Break; 

      sum := sum + (i * i * i * i);
    end;
    i :=i+1;
  end;

  Assign(output, 'd:\z3.out.txt');
  Rewrite(output);
  WriteLn(sum);
  Close(output);
end.
