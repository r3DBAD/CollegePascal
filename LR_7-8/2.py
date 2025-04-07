my_str = 'awea'
x = my_str.find('x')
w = my_str.find('w')
if x == -1 and w == -1:
    print('обоих символовы нет в строке')
elif x == -1:
    print('x нет в строке')
elif w == -1:
    print('w нет в строке')
else:
    if x < w:
        print('x встечается раньше в строке')
    else:
        print('w встечается раньше в строке')

    