program r3d1337;

type
  PNode = ^TNode;
  TNode = record
    data: integer;
    next: PNode;
  end;

var
  head, current: PNode;
  value, minValue, maxValue: integer;
  isFirst: boolean;

procedure AddNode(var head: PNode; value: integer);
var
  newNode: PNode;
begin
  New(newNode);
  newNode^.data := value;
  newNode^.next := head;
  head := newNode;
end;

begin
  head := nil;
  
  WriteLn('Введите числа списка (0 - завершение ввода):');
  repeat
    ReadLn(value);
    if value <> 0 then
      AddNode(head, value);
  until value = 0;

  minValue := MaxInt; 
  maxValue := -MaxInt - 1;
  isFirst := True; 

  current := head;
  while current <> nil do
  begin
    if isFirst then
    begin
      minValue := current^.data; 
      maxValue := current^.data;
      isFirst := False;
    end
    else
    begin
      if current^.data < minValue then
        minValue := current^.data;
      if current^.data > maxValue then
        maxValue := current^.data;
    end;
    current := current^.next;
  end;

  if not isFirst then 
  begin
    WriteLn('Минимальное значение: ', minValue);
    WriteLn('Максимальное значение: ', maxValue);
  end
  else
    WriteLn('Список пуст');

  while head <> nil do
  begin
    current := head;
    head := head^.next;
    Dispose(current);
  end;
end.
  