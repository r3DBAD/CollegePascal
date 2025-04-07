program r3d1337;

type
  PWordNode = ^TWordNode;
  TWordNode = record
    word: string;
    count: integer;
    next: PWordNode;
  end;

var
  head: PWordNode;
  currentNode, prevNode, newNode: PWordNode;
  inputWord: string;
  uniqueWordCount: integer;

procedure AddWord(word: string);
begin
  currentNode := head;
  prevNode := nil;

  while (currentNode <> nil) and (currentNode^.word < word) do
  begin
    prevNode := currentNode;
    currentNode := currentNode^.next;
  end;

  if (currentNode <> nil) and (currentNode^.word = word) then
    Inc(currentNode^.count)
  else
  begin
    New(newNode);
    newNode^.word := word;
    newNode^.count := 1;
    newNode^.next := currentNode;

    if prevNode = nil then
      head := newNode
    else
      prevNode^.next := newNode;
    Inc(uniqueWordCount);
  end;
end;

procedure PrintWordList;
begin
  currentNode := head;
  while currentNode <> nil do
  begin
    WriteLn(currentNode^.word, ': ', currentNode^.count);
    currentNode := currentNode^.next;
  end;
end;

procedure FreeMemory;
begin
  while head <> nil do
  begin
    currentNode := head;
    head := head^.next;
    Dispose(currentNode);
  end;
end;

begin
  head := nil;
  uniqueWordCount := 0;

  while True do
  begin
    Write('Введите слово ("стоп" для завершения): ');
    ReadLn(inputWord);
    if inputWord = 'стоп' then
      break;

    AddWord(inputWord);
  end;

  WriteLn('Алфавитно-частотный словарь:');
  PrintWordList;
  WriteLn('Количество уникальных слов: ', uniqueWordCount);

  FreeMemory;
end.
