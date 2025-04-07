import random

def generate_random_numbers(file_name, count, min_value=0, max_value=1000):
    with open(file_name, 'w') as file:
        numbers = [str(random.randint(min_value, max_value)) for _ in range(count)]
        file.write("\n".join(numbers))

generate_random_numbers("random_numbers.txt",500)
