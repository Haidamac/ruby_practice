p '68. Дано цілочисловий масив. Перевірити, чи чергуються у ньому додатні та від\'ємні числа'
p '[15, -88, 97, -94, 11, -14, 15, -18, 25, -38, 13, -18, 25, -24, 99, -24, 51]'
array = [15, -88, 97, -94, 11, -14, 15, -18, 25, -38, 13, -18, 25, -24, 99, -24, 51]
a1 = array.select.with_index { | x,i | i.even? } 
a2 = array.select.with_index { | x,i | i.odd? }
if array[0].positive? || array[0] == 0
    if a1.all? {|x| x.positive?} && a2.all? {|x| x.negative?}
        p true
    else
        p false
    end
else 
    if a1.all? {|x| x.negative?} && a2.all? {|x| x.positive?}
        p true
    else
        p false
    end
end

# не знайшов методу розв"язку в 1 рядок