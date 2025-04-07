program r3d1337;

var
  i: Integer; 
  i_ptr: ^Integer; 

begin
  i := 2; 
  i_ptr := @i; 
  
  WriteLn(i_ptr^);
end.