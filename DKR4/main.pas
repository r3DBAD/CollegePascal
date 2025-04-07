uses Crt;

function f(x: real): real;
begin
    f := Power(x, 3) + Power(x, 2) - x + 1;
end;

function MidpointRectangleMethod(a, b: real; n: integer): real;
var
    h, mid_point, area: real;
    i: integer;
begin
    h := (b - a) / n;
    area := 0; 
    for i := 0 to n - 1 do
    begin
        mid_point := a + (i + 0.5) * h; 
        area := area + f(mid_point) * h;
    end;
    MidpointRectangleMethod := area;
end;

function EstimateError(a, b: real; n: integer): real;
var
    h, area_with_trapezoids: real;
    i: integer;
begin
    h := (b - a) / n;
    area_with_trapezoids := (f(a) + f(b)) * (b - a) / 2;
    for i := 1 to n - 1 do
    begin
        area_with_trapezoids := area_with_trapezoids + f(a + i * h) * h;
    end;
    EstimateError := Abs(area_with_trapezoids - MidpointRectangleMethod(a, b, n));
end;

procedure DisplayMenu(var option: integer);
var
    ch: char;
begin
    clrscr;
    writeln('Выберите действие:');
    writeln('1. Вычислить площадь под кривой');
    writeln('2. Выход');
    writeln;
    writeln('Используйте стрелки для перемещения по меню и Enter для выбора.');

    case option of
        1: writeln('-> Вычислить площадь под кривой');
        2: writeln('   Выход');
    end;

    repeat
        ch := readkey;

        case ch of
            #0: 
            begin
                ch := readkey;
                if ch = #38 then 
                begin
                    option := option - 1;
                    if option < 1 then option := 2;
                end
                else if ch = #40 then 
                begin
                    option := option + 1;
                    if option > 2 then option := 1;
                end;
                clrscr;
                writeln('Выберите действие:');
                writeln('1. Вычислить площадь под кривой');
                writeln('2. Выход');
                writeln;
                case option of
                    1: writeln('-> Вычислить площадь под кривой');
                    2: writeln('   Выход');
                end;
            end;
        end;
    until ch = #13; 
end;

var
    a, b: real;
    n: integer;
    area, error: real;
    option: integer;
begin
   

    repeat
        DisplayMenu(option);
        
        if option = 1 then
        begin
            writeln('Программа для вычисления площади фигуры, ограниченной кривой и осью X.');

            repeat
                write('Введите нижний предел интегрирования (a): ');
                readln(a);
                write('Введите верхний предел интегрирования (b): ');
                readln(b);
                if (a < 0) or (b < 0) or (a >= b) then
                    writeln('Ошибка: входные значения должны быть положительными и a < b.');
            until (a >= 0) and (b >= 0) and (a < b);

            repeat
                write('Введите число подынтервалов (n): ');
                readln(n);
                if n <= 0 then
                    writeln('Ошибка: число подынтервалов должно быть положительным.');
            until n > 0;

            area := MidpointRectangleMethod(a, b, n);
            error := EstimateError(a, b, n);

            writeln;
            writeln('Вычисленная площадь: ', area:0:6);
            writeln('Оценка погрешности: ', error:0:6);
            readln;
        end;

    until option = 2; 
end.
