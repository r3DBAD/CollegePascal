import math
def less_than_minSeven(x):
    y = x**(1/3)/(math.cos(x) + math.sin(x))
    return y
    
def mineSeven_less_x_less_zero(x):
    y = (math.log(abs(x),10)) + x 
    return round(y,2) 
    
def x_more_than_zero(x):
    y = math.tan(x)/(math.cos(2*x)) - (math.cos(x) / math.tan(x))
    return round(y,2)

x = float(input('Введите число x'))

if x < -7:
    y = less_than_minSeven(x)
    print(y)
if x >= -7 and x < 0:
    print('Вы ввели отрицательное число,но формула автоматически посчитала модуль этого числа')
    y = mineSeven_less_x_less_zero(x)

    print(y)
if x >= 0:
    y = x_more_than_zero(x)
    print(y)
    
start = -9
stop = 2 
step = 0.3

x_val = []
reslt = []
x = start
while x<stop:
    x_val.append(round(x,2))
    if x<-7:
        reslt.append(less_than_minSeven(x))
    elif -7<= x<0:
        reslt.append(mineSeven_less_x_less_zero(x))
    else:
        reslt.append(x_more_than_zero(x))
    x+=step
print('\nЗначение функции на интервале от -9 до 2')
for x_v,res in zip(x_val,reslt):
    print(f'f({x_v}) = {res}')
    
    



    
    
