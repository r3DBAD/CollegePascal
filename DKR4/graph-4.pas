uses 
  Crt, GraphABC;

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

procedure DrawGraph(a, b: real);
var
    x, y: real;
    screenX, screenY: integer;
    scaleX, scaleY: real;
begin
    SetWindowSize(800, 600);
    SetPenColor(clBlack);
    SetPenWidth(2);
    
    Line(50, 300, 750, 300); 
    Line(400, 50, 400, 550);
    
    scaleX := 600 / (b - a);  
    scaleY := 250 / (f(b) - f(a));
    
    x := a;
    
    MoveTo(Round(50 + (x - a) * scaleX), Round(300 - (f(x) - f(a)) * scaleY));
  
    while x <= b do
    begin
        y := f(x);
        
        screenX := Round(50 + (x - a) * scaleX); 
        screenY := Round(300 - (y - f(a)) * scaleY); 
        
        LineTo(screenX, screenY);
        
 
        x := x + 0.01;
    end;
    
    SetBrushColor(clBlue);  
    x := a;
    
    while x <= b do
    begin
        y := f(x);
        
        screenX := Round(50 + (x - a) * scaleX);
        screenY := Round(300 - (y - f(a)) * scaleY); 

        if screenY <= 300 then
            Rectangle(screenX, 300, screenX + 1, screenY); 
        
        x := x + 0.01;
    end;
end;

var
    a, b: real;
    n: integer;
    area, error: real;
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


    DrawGraph(a, b);

end.
