p '67. Дано цілочисловий масив. Перевірити, чи чергуються у ньому парні та непарні числа'
p '[15, 88, 97, -94, 11, 14, 15, 18, 25, 38, -13, 18, 25, -24, 99, 24, 51]'
array = [15, 88, 97, -94, 11, 14, 15, 18, 25, 38, -13, 18, 25, -24, 99, 24, 51]
a1 = array.select.with_index { | x,i | i.even? } 
a2 = array.select.with_index { | x,i | i.odd? }
if array[0].even? || array[0] == 0
    if a1.all? {|x| x.even?} && a2.all? {|x| x.odd?}
        p true
    else
        p false
    end
else 
    if a1.all? {|x| x.odd?} && a2.all? {|x| x.even?}
        p true
    else
        p false
    end
end

# не знайшов методу розв"язку в 1 рядок