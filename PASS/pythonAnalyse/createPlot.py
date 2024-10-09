
import matplotlib.pyplot as plt

# Функция для считывания данных из файла
def read_data_from_file(file_path):
    data = {}
    with open(file_path, 'r') as file:
        for line in file:
            parts = line.split(' : ') 
            print(parts)
            instruction = parts[0].strip()
            count = int(parts[1].strip())
            data[instruction] = count
    return data

# Путь к файлу
file_path = 'logs/statLen1.dat'  # Замените на ваш путь к файлу
save_png = 'png/len1.png'

# Считывание данных
data = read_data_from_file(file_path)

# Подготовка данных для графика
instructions = list(data.keys())
counts = list(data.values())

# Построение графика
plt.figure(figsize=(6, 12))
plt.barh(instructions, counts, color='skyblue')
plt.xlabel('Количество инструкций')
plt.ylabel('Инструкции')
plt.title('Распределение инструкций')
plt.grid(axis='x')

# Сохранение графика в формате PNG
plt.savefig(save_png)

# Показать график (по желанию)
plt.show()
