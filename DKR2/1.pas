program my52;
var
  lst: array of Integer; 
  n, i, j: Integer;
  min_diff: Integer;
  elem1, elem2: Integer;

begin
  Write('Введите количество элементов массива: ');
  ReadLn(n); 
  SetLength(lst, n); 

  WriteLn('Введите элементы массива:');
  for i := 0 to n - 1 do
  begin
    Read(lst[i]);
  end;

  min_diff := MaxInt;
  elem1 := -1;
  elem2 := -1;
  
  for i := 0 to n - 1 do
    for j := i + 1 to n - 1 do
    begin
      if Abs(lst[i] - lst[j]) < min_diff then
      begin
        min_diff := Abs(lst[i] - lst[j]);
        elem1 := lst[i];
        elem2 := lst[j];
      end;
    end;

  WriteLn('Два элемента с минимальной разностью: ', elem1, ' и ', elem2);
  WriteLn('Минимальная разность: ', min_diff);
end.
