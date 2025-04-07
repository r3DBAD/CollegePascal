unit SnowMain;
uses GraphABC;

var
  Scale: real = 1.0;       
  OffsetX: integer = 0;    
  OffsetY: integer = 0;    
  Depth: integer = 5;      

procedure FrstPart(x1, y1, x2, y2: real; n: integer);
var
  dx, dy, xA, yA, xB, yB, xC, yC: real;
begin
  if n = 0 then
    Line(round(x1), round(y1), round(x2), round(y2))
  else
  begin
    dx := (x2 - x1) / 3;
    dy := (y2 - y1) / 3;
    xA := x1 + dx;
    yA := y1 + dy;
    xB := x1 + 2 * dx;
    yB := y1 + 2 * dy;
    xC := (xA + xB) / 2 - (yB - yA) * sqrt(3) / 2;
    yC := (yA + yB) / 2 + (xB - xA) * sqrt(3) / 2;

    FrstPart(x1, y1, xA, yA, n - 1);
    FrstPart(xA, yA, xC, yC, n - 1);
    FrstPart(xC, yC, xB, yB, n - 1);
    FrstPart(xB, yB, x2, y2, n - 1);
  end;
end;

procedure ThreeSidesDraw;
var
  x1, y1, x2, y2, x3, y3: real;
  cx, cy: real;
begin
  LockDrawing;

  ClearWindow;
  SetBrushColor(clWhite);
  SetPenColor(clBlack);
  
  cx := 300 + OffsetX;
  cy := 300 + OffsetY;

  x1 := cx - 150 * Scale;
  y1 := cy + 100 * Scale;
  x2 := cx + 150 * Scale;
  y2 := y1;
  x3 := cx;
  y3 := cy - 200 * Scale;

  FrstPart(x1, y1, x2, y2, Depth);
  FrstPart(x2, y2, x3, y3, Depth);
  FrstPart(x3, y3, x1, y1, Depth);

  Redraw; 
end;

procedure KeyDownHandler(Key: integer);
begin
  case Key of
    VK_Right: OffsetX := OffsetX + 20; 
    VK_Left:  OffsetX := OffsetX - 20;  
    VK_Up:    OffsetY := OffsetY - 20;  
    VK_Down:  OffsetY := OffsetY + 20;  
    VK_W:     Scale := Scale * 1.1;     
    VK_S:     Scale := Scale / 1.1;     
    VK_Add:
      if Depth < 10 then
        Depth := Depth + 1;
    VK_Subtract:
      if Depth > 0 then
        Depth := Depth - 1;
  end;
  DrawSnowflake;  
end;
end.
