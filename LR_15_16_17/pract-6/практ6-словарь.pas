program r3d1337;

type
  PWordNode = ^TWordNode;
  TWordNode = record
    word: string;
    count: integer;
    prev, next: PWordNode;
  end;

var
  head, tail: PWordNode;
  currentNode: PWordNode;
  inputWord: string;

procedure AddWord(word: string);
var
  newNode, temp: PWordNode;
begin
  currentNode := head;
  while (currentNode <> nil) and (currentNode^.word < word) do
    currentNode := currentNode^.next;

  if (currentNode <> nil) and (currentNode^.word = word) then
    Inc(currentNode^.count)  
  else
  begin
    New(newNode);
    newNode^.word := word;
    newNode^.count := 1;
    newNode^.next := nil;
    newNode^.prev := nil;

    if head = nil then
    begin
      head := newNode;
      tail := newNode;
    end
    else
    begin
      temp := head;
      while (temp^.next <> nil) and (temp^.word < word) do
        temp := temp^.next;

      if temp^.word > word then
      begin
        newNode^.next := temp;
        newNode^.prev := temp^.prev;
        if temp^.prev <> nil then
          temp^.prev^.next := newNode
        else
          head := newNode;
        temp^.prev := newNode;
      end
      else
      begin
        newNode^.prev := temp;
        newNode^.next := temp^.next;
        if temp^.next <> nil then
          temp^.next^.prev := newNode
        else
          tail := newNode;
        temp^.next := newNode;
      end;
    end;
  end;
end;

procedure SortByFrequency;
var
  swapped: boolean;
  temp: PWordNode;
begin
  if head = nil then Exit;
  repeat
    swapped := False;
    temp := head;
    while temp^.next <> nil do
    begin
      if temp^.count < temp^.next^.count then
      begin
        Swap(temp^.count, temp^.next^.count);
        Swap(temp^.word, temp^.next^.word);
        swapped := True;
      end;
      temp := temp^.next;
    end;
  until not swapped;
end;

procedure PrintList;
begin
  currentNode := head;
  while currentNode <> nil do
  begin
    WriteLn(currentNode^.word, ': ', currentNode^.count);
    currentNode := currentNode^.next;
  end;
end;

procedure ClearList;
var
  temp: PWordNode;
begin
  while head <> nil do
  begin
    temp := head;
    head := head^.next;
    Dispose(temp);
  end;
  tail := nil;
end;

begin
  head := nil;
  tail := nil;

  while True do
  begin
    Write('Введите слово ("стоп" для завершения): ');
    ReadLn(inputWord);
    if inputWord = 'стоп' then
      break;
    AddWord(inputWord);
  end;

  SortByFrequency;
  WriteLn('Алфавитно-частотный словарь:');
  PrintList;

  ClearList;
end.
