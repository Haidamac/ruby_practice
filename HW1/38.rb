p '38. Дано цілочисельний масив. Знайти індекс останнього максимального елемента'
p '[15, 87, 97, 99, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, -94, 50]'
array = [15, 87, 97, 99, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, -94, 50]
p array.size - 1 - array.reverse.index(array.max)
