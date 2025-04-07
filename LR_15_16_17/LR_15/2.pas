program r3d1337;

type
    anketa = record
        fio: string;
        birth: string;
        kurs: 1..5;
    end;

var
    students: array of anketa; 
    i, MAX_STUDENTS: integer;

begin

    write('Введите количество студентов: ');
    readln(MAX_STUDENTS);
    
    SetLength(students, MAX_STUDENTS);

    writeln('Введите данные о студентах:');
    
    for i := 0 to MAX_STUDENTS - 1 do
    begin
        writeln;
        writeln('Студент ', i + 1, ':');
        
        write('Ф.И.О.: ');
        readln(students[i].fio);
        
        write('Дата рождения (дд.мм.гггг): ');
        readln(students[i].birth);
        
        write('Курс (1-5): ');
        readln(students[i].kurs);
    end;
    
    writeln;
    writeln('Таблица студентов:');
    writeln('======================================================');
    writeln('| №  |        Ф.И.О.        |  Дата рождения  | Курс |');
    writeln('------------------------------------------------');

    for i := 0 to MAX_STUDENTS - 1 do
    begin
        writeln('| ', i + 1:2, ' | ', students[i].fio:20, ' | ', students[i].birth:14, ' | ', students[i].kurs:4, ' |');
    end;
    
    writeln('======================================================');
end.
