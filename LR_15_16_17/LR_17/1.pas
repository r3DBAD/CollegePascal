program r3d1337;

type
  PNode = ^TNode;
  TNode = record
    data: integer;
    next, prev: PNode;
  end;

  TDeque = record
    front, back: PNode;
  end;

var
  deque: TDeque;
  inputFile, outputFile: TextFile;
  number: integer;

procedure InitDeque(var d: TDeque);
begin
  d.front := nil;
  d.back := nil;
end;

procedure PushBack(var d: TDeque; value: integer);
var
  newNode: PNode;
begin
  New(newNode);
  newNode^.data := value;
  newNode^.next := nil;
  newNode^.prev := d.back;
  if d.back <> nil then
    d.back^.next := newNode
  else
    d.front := newNode;
  d.back := newNode;
end;

function PopBack(var d: TDeque): integer;
var
  temp: PNode;
begin
  if d.back = nil then
    writeln('Дек пуст');
  Result := d.back^.data;
  temp := d.back;
  d.back := d.back^.prev;
  if d.back <> nil then
    d.back^.next := nil
  else
    d.front := nil;
  Dispose(temp);
end;

begin
  InitDeque(deque);

  AssignFile(inputFile, 'input.txt');
  Reset(inputFile);
  while not Eof(inputFile) do
  begin
    ReadLn(inputFile, number);
    PushBack(deque, number);
  end;
  CloseFile(inputFile);

  AssignFile(outputFile, 'output.txt');
  Rewrite(outputFile);
  try
    while deque.back <> nil do
    begin
      WriteLn(outputFile, PopBack(deque));
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
  CloseFile(outputFile);
end.