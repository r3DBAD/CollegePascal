program r3d1337;
type
    toy = record
        name: string;
        price: real;
        age: string; 
    end;

var
    toys: array[1..3] of toy;
    i: integer;

begin

    writeln('Введите информацию о 3 игрушках:');

    for i := 1 to 3 do
    begin
        writeln;
        writeln('Игрушка ', i, ':');
        
        with toys[i] do
        begin
            write('Название: ');
            readln(name);
            
            write('Цена (руб.): ');
            readln(price);
            
            write('Возрастной диапазон: ');
            readln(age);
        end;
    end;

    writeln;
    writeln('Каталог игрушек:');
    writeln('================================================');
    writeln('| №  |        Название         |  Цена (руб.)  | Возраст |');
    writeln('================================================');

    for i := 1 to 3 do
    begin
        with toys[i] do
        begin
            writeln('| ', i:2, ' | ', name:20, ' | ', price:12:2, ' | ', age:8, ' |');
        end;
    end;
    
    writeln('================================================');
end.