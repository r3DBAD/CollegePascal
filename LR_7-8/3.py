my_str = str(input('Введите строку'))
cnt_of_digits = 0
for i in my_str:
    if i.isdigit():
        cnt_of_digits+=1
print(f'Количество цифр-{cnt_of_digits}')