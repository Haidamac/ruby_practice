p '26. Дано цілочисельний масив. Перетворіть його, вставивши перед кожним від`ємним елементом нульовий елемент'
p '[15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]'
array = [15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]
p array.map { |x| x.negative? ? [0, x] : x }.flatten!
