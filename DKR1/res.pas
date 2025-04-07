program my52;


function LessThanMinSeven(x: Real): Real;
begin
    LessThanMinSeven := Power(x, 1/3) / (Cos(x) + Sin(x));
end;

function MineSevenLessXLessZero(x: Real): Real;
begin
    MineSevenLessXLessZero := Log10(Abs(x)) + x;
end;

function XMoreThanZero(x: Real): Real;
begin
    XMoreThanZero := Tan(x) / Cos(2 * x) - (Cos(x) / Tan(x));
end;

var
    x, y: Real;
    start, stop, step: Real;
    x_val: array of Real;
    reslt: array of Real;
    i: Integer;

begin
    Write('Введите число x: ');
    ReadLn(x);

    if x < -7 then
    begin
        y := LessThanMinSeven(x);
        WriteLn(y:0:2);
    end
    else if (x >= -7) and (x < 0) then
    begin
        WriteLn('Вы ввели отрицательное число, но формула автоматически посчитала модуль этого числа');
        y := MineSevenLessXLessZero(x);
        WriteLn(y:0:2);
    end
    else
    begin
        y := XMoreThanZero(x);
        WriteLn(y:0:2);
    end;

    start := -9;
    stop := 2;
    step := 0.3;
    SetLength(x_val, Trunc((stop - start) / step) + 1);
    SetLength(reslt, Trunc((stop - start) / step) + 1);

    i := 0;
    x := start;
    while x < stop do
    begin
        x_val[i] := round(x);
        if x < -7 then
            reslt[i] := LessThanMinSeven(x)
        else if (x >= -7) and (x < 0) then
            reslt[i] := MineSevenLessXLessZero(x)
        else
            reslt[i] := XMoreThanZero(x);
        
        x := x + step;
        i := i + 1;
    end;

    WriteLn('Значение функции на интервале от -9 до 2');
    for i := 0 to Length(x_val) - 1 do
    begin
        WriteLn('f(', x_val[i]:0:2, ') = ', reslt[i]:0:2);
    end;
end.
