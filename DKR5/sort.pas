program my52;

type
  Comparator = function(a, b: Integer): Boolean;

function Ascending(a, b: Integer): Boolean;
begin
  Ascending := a > b;
end;

function Descending(a, b: Integer): Boolean;
begin
  Descending := a < b;
end;

procedure BubbleSort(var arr: array of Integer; compare: Comparator);
var
  i, j, temp: Integer;
begin
  for i := High(arr) downto 1 do
    for j := 0 to i - 1 do
      if compare(arr[j], arr[j + 1]) then
      begin
        temp := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := temp;
      end;
end;


procedure RadixSort(var arr: array of Integer; compare: Comparator);
var
  i, digit, maxVal, exp: Integer;
  output: array of Integer;
  count: array[0..9] of Integer;

  function GetDigit(num, exp: Integer): Integer;
  begin
    GetDigit := (num div exp) mod 10;
  end;

begin
  if Length(arr) = 0 then
    Exit;

  maxVal := arr[0];
  for i := 1 to High(arr) do
    if arr[i] > maxVal then
      maxVal := arr[i];

  exp := 1;
  while maxVal div exp > 0 do
  begin
    SetLength(output, Length(arr));

    for i := 0 to 9 do
      count[i] := 0;

    for i := 0 to High(arr) do
    begin
      digit := GetDigit(arr[i], exp);
      Inc(count[digit]);
    end;

    for i := 1 to 9 do
      count[i] := count[i] + count[i - 1];

    for i := High(arr) downto 0 do
    begin
      digit := GetDigit(arr[i], exp);
      output[count[digit] - 1] := arr[i];
      Dec(count[digit]);
    end;

    for i := 0 to High(arr) do
      arr[i] := output[i];

    exp := exp * 10;
  end;

  if (compare <> nil) and (compare(1, 0)) then
  begin
    for i := 0 to (High(arr) div 2) do
    begin
      digit := arr[i];
      arr[i] := arr[High(arr) - i];
      arr[High(arr) - i] := digit;
    end;
  end;
end;

procedure ReadDataFromFile(const fileName: string; var arr: array of Integer);
var
  f: TextFile;
  num: Integer;
  count: Integer;
begin
  AssignFile(f, fileName);
  Reset(f);
  count := 0;
  while not Eof(f) do
  begin
    ReadLn(f, num);
    Inc(count);
    SetLength(arr, count);
    arr[count - 1] := num;
  end;
  CloseFile(f);
end;

procedure WriteDataToFile(const fileName: string; const arr: array of Integer);
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, fileName);
  Rewrite(f);
  for i := 0 to High(arr) do
    WriteLn(f, arr[i]);
  CloseFile(f);
end;

var
  numbers: array of Integer;
  inputFile, outputFileBubble, outputFileRadix: string;
begin
  inputFile := 'D:\train vscode\python\train\random_numbers.txt';
  outputFileBubble := 'D:\test\bubble_sorted.txt';
  outputFileRadix := 'D:\test\radix_sorted.txt';


  ReadDataFromFile(inputFile, numbers);

  BubbleSort(numbers, Descending);
  WriteDataToFile(outputFileBubble, numbers);

  ReadDataFromFile(inputFile, numbers);

  RadixSort(numbers, Descending);
  WriteDataToFile(outputFileRadix, numbers);

  WriteLn('Файлы сохранились в папки: ', outputFileBubble, ' and ', outputFileRadix);
end.
