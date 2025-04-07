program r3d1337;

var
    n: integer;
    lastD, last2D: integer;

begin
    write('Введите число: ');
    readln(n);
    
    lastD := n mod 10;         
    last2D := n mod 100;    

    if (last2D = 11) or (last2D = 12) or (last2D = 13) or (last2D = 14) then
        writeln(n, ' лет')           
    else if lastD = 1 then
        writeln(n, ' год')         
    else if (lastD >= 2) and (lastD <= 4) then
        writeln(n, ' года')          
    else
        writeln(n, ' лет');          
end.
