p '2. Дано цілочисловий масив. Необхідно спочатку вивести його елементи з непарними індексами, а потім - з парними.'
p '[15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]'
array = [15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]
p  array.select.with_index { | x,i | i.odd? } + array.select.with_index { | x,i | i.even? }
