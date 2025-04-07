program r3d1337;

type
    anketa = record
        fio: string;
        birth: string;
        kurs: 1..5;
    end;

var
    student: anketa;

begin
    writeln('Введите Ф.И.О.: ');
    readln(student.fio);
    
    writeln('Введите дату рождения (дд.мм.гггг): ');
    readln(student.birth);
    
    writeln('Введите курс (1-5): ');
    readln(student.kurs);

    writeln;
    writeln('Анкетные данные студента:');
    writeln('Ф.И.О.: ', student.fio);
    writeln('Дата рождения: ', student.birth);
    writeln('Курс: ', student.kurs);
end.