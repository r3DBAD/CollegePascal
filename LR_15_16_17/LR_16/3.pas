8program r3d1337;

type
  PIntegerArray = ^TIntegerArray;
  TIntegerArray = array of integer;

var
  numbers: PIntegerArray;
  i, count: integer;

begin
  count := 10; 
  New(numbers); 
  SetLength(numbers^, count); 


  for i := 0 to count - 1 do
  begin
    Write('Введите элемент ', i + 1, ': ');
    ReadLn(numbers^[i]);
  end;

  WriteLn('Элементы списка:');
  for i := 0 to count - 1 do
  begin
    Write(numbers^[i], ' ');
  end;
  WriteLn;

  WriteLn('Четные элементы списка:');
  for i := 0 to count - 1 do
  begin
    if numbers^[i] mod 2 = 0 then
      Write(numbers^[i], ' ');
  end;
  WriteLn;

  Dispose(numbers);
end.
