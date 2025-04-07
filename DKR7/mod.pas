program Snezhinka;
uses GraphABC, SnowMain;

begin
  SetWindowSize(600, 600);
  OnKeyDown := KeyDownHandler; 
  DrawSnowflake;                  
end.
