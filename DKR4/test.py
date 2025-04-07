import matplotlib.pyplot as plt
import numpy as np

def f(x):
    """Функция f(x) = x^3 + x^2 - x + 1."""
    return x**3 + x**2 - x + 1

def midpoint_rectangle_method(a, b, n):
    """Метод средних прямоугольников для вычисления определенного интеграла."""
    h = (b - a) / n 
    area = 0  
    for i in range(n):
        mid_point = a + (i + 0.5) * h
        area += f(mid_point) * h 
    return area

def estimate_error(a, b, n):
    """Оценка погрешности (по правилу трапеций)."""
    h = (b - a) / n
    area_with_trapezoids = (f(a) + f(b)) * (b - a) / 2
    for i in range(1, n):
        area_with_trapezoids += f(a + i * h) * h
    return abs(area_with_trapezoids - midpoint_rectangle_method(a, b, n))

def plot_function_and_area(a, b):
    """Отрисовка графика функции и области интегрирования."""
    x = np.linspace(a, b, 400)
    y = f(x)

    plt.figure(figsize=(10, 6))
    plt.plot(x, y, label='f(x) = x^3 + x^2 - x + 1', color='blue')
    plt.fill_between(x, y, color='gray', alpha=0.5, where=((x >= a) & (x <= b) & (y >= 0)), label='Площадь под кривой')
    plt.axhline(0, color='black', lw=0.5, ls='--')
    plt.title('График функции и площадь под кривой')
    plt.xlabel('x')
    plt.ylabel('f(x)')
    plt.xlim(a-1, b+1)
    plt.ylim(min(f(np.linspace(a, b, 100))) - 1, max(f(np.linspace(a, b, 100))) + 1)
    plt.legend()
    plt.grid()
    plt.show()

def main():
    print("Программа для вычисления площади фигуры, ограниченной кривой и осью X.\n")
    
    while True:
        try:
            a = float(input("Введите нижний предел интегрирования (a): "))
            b = float(input("Введите верхний предел интегрирования (b): "))
            if a < 0 or b < 0 or a >= b:
                print("Ошибка: входные значения должны быть положительными и a < b.")
                continue
            break
        except ValueError:
            print("Ошибка: введите числовые значения.")

    while True:
        try:
            n = int(input("Введите число подынтервалов (n): "))
            if n <= 0:
                print("Ошибка: число подынтервалов должно быть положительным.")
                continue
            break
        except ValueError:
            print("Ошибка: введите целое число.")

    area = midpoint_rectangle_method(a, b, n)
    error = estimate_error(a, b, n)

    print(f"\nВычисленная площадь: {area:.6f}")
    print(f"Оценка погрешности: {error:.6f}")

    plot_function_and_area(a, b)

if __name__ == "__main__":
    main()
