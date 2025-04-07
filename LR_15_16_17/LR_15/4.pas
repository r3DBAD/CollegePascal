program r3d1337;

type
    toy = record
        name: string[30]; 
        price: real;
        age: string[10];
    end;

var
    toys: array[1..3] of toy; 
    toys_1: array[1..3] of toy;
    f: file of toy;
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

    assign(f, 'C:\Users\Гость1\Desktop\LR_15\toys.dat');
    rewrite(f);

    for i := 1 to 3 do
        write(f, toys[i]);

    close(f); 

    assign(f, 'C:\Users\Гость1\Desktop\LR_15\toys.dat');
    reset(f); 
    for i := 1 to 3 do
        read(f, toys_1[i]); 
    close(f); 

    writeln;
    writeln('Игрушки, считанные из файла:');
    writeln('================================================');
    writeln('| №  |        Название         |  Цена (руб.)  | Возраст |');
    writeln('================================================');

    for i := 1 to 3 do
    begin
        with toys_1[i] do
        begin
            writeln('| ', i:2, ' | ', name:20, ' | ', price:12:2, ' | ', age:8, ' |');
        end;
    end;
    
    writeln('================================================');
end.
