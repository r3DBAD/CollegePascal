program r3d1337;

uses crt;

const
  len_lst = 10;

type
  Node = record
    data: Integer;
    next: Integer; 
  end;

  RingList = record
    nodes: array[1..len_lst] of Node;
    first, last, count: Integer;
    free: Integer; 
  end;

procedure SetupList(var myList: RingList);
var
  i: Integer;
begin
  myList.first := 0;    
  myList.last := 0;    
  myList.count := 0;
  
  for i := 1 to len_lst - 1 do
    myList.nodes[i].next := i + 1;
  myList.nodes[len_lst].next := 0;
  myList.free := 1;
end;

function IsFull(myList: RingList): Boolean;
begin
  IsFull := (myList.free = 0);
end;

function IsEmpty(myList: RingList): Boolean;
begin
  IsEmpty := (myList.count = 0);  
end;

procedure AddNumber(var myList: RingList; num: Integer);
var
  newIdx: Integer;
begin
  if IsFull(myList) then
  begin
    newIdx := myList.first;
    myList.first := myList.nodes[myList.first].next;
    myList.count := myList.count - 1;
    
    if myList.count = 0 then
      myList.last := 0;
  end
  else
  begin
    newIdx := myList.free;
    myList.free := myList.nodes[myList.free].next;
  end;
  
  myList.nodes[newIdx].data := num;
  myList.nodes[newIdx].next := 0;
  
  if myList.last <> 0 then
    myList.nodes[myList.last].next := newIdx;
  myList.last := newIdx;
  
  if myList.first = 0 then
    myList.first := newIdx;
  
  myList.count := myList.count + 1;
  
  Writeln('Добавил число ', num);
end;

procedure RemoveNumber(var myList: RingList);
var
  oldFirst: Integer;
begin
  if IsEmpty(myList) then
  begin
    Writeln('а тут пусто,что удалять то');
    Exit;
  end;
  
  oldFirst := myList.first;
  myList.first := myList.nodes[myList.first].next;
  
  myList.nodes[oldFirst].next := myList.free;
  myList.free := oldFirst;
  
  myList.count := myList.count - 1;
  
  if myList.count = 0 then
    myList.last := 0;
  
  Writeln('удалил первый элемент');
end;

procedure ShowList(myList: RingList);
var
  i, pos: Integer;
begin
  if IsEmpty(myList) then
  begin
    Writeln('йоу тут пусто');
    Exit;
  end;
  
  Write('Вот что в списке: ');
  pos := myList.first;
  
  for i := 1 to myList.count do
  begin
    Write(myList.nodes[pos].data, ' ');
    pos := myList.nodes[pos].next;
  end;
  
  Writeln;
  Writeln('Всего элементов: ', myList.count);
end;

procedure ShowMenu(var choice: Integer; var quit: Boolean);
var
  key: Char;
begin
  repeat
    ClrScr; 
    Writeln('=== МОЙ КРУТОЙ КОЛЬЦЕВОЙ СПИСОК ===');
    Writeln;
    
    if choice = 1 then
      Writeln('--> 1. Добавить число')
    else
      Writeln('     1. Добавить число');
    
    if choice = 2 then
      Writeln('--> 2. Удалить число')
    else
      Writeln('     2. Удалить число');
    
    if choice = 3 then
      Writeln('--> 3. Показать список')
    else
      Writeln('     3. Показать список');
    
    Writeln;
    Writeln('ESC - Выход (но зачем?)');
    
    key := ReadKey;
    if key = #27 then  
    begin
      quit := True;
      Exit;
    end;
    
    if key = #0 then  
    begin
      key := ReadKey;
      case key of
        #38: if choice > 1 then Dec(choice); 
        #40: if choice < 3 then Inc(choice); 
      end;
    end;
  until key = #13;
end;

var
  myCoolList: RingList;
  menuChoice, num: Integer;
  exitProgram: Boolean;
begin
  SetupList(myCoolList);  
  menuChoice := 1;       
  exitProgram := False;   
  
  repeat
    ShowMenu(menuChoice, exitProgram);
    if exitProgram then Break;
    
    case menuChoice of
      1: begin
           Write('Введи число (только целое!): ');
           Readln(num);
           AddNumber(myCoolList, num);
           Writeln('Нажми Enter чтобы продолжить...');
           Readln;
         end;
      2: begin
           RemoveNumber(myCoolList);
           Writeln('Нажми Enter чтобы продолжить...');
           Readln;
         end;
      3: begin
           ShowList(myCoolList);
           Writeln('Нажми Enter чтобы продолжить...');
           Readln;
         end;
    end;
  until exitProgram;
  
  Writeln('На сегодня все');
end.
