array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]

p '- дізнатись кількість елементів в масиві:'
p array.size

p '– перевернути масив:'
p array.reverse

p '– знайти найбільше число:'
p array.max

p '– знайти найменше число:'
p array.min

p '– відсортувати від меншого до більшого:'
p array.sort

p '– відсортувати від більшого до меншого:'
p array.sort.reverse

p '– видалити всі непарні числа:'
p array.reject {|x| x.odd?}

p '– залишити тільки ті числа, які без остачі ділятся на 3:'
p array.select {|x| x%3==0}

p '– видалити з масиву числа, які повторюються (тобто, потрібно вивести масив, в якому немає повторень):'
p array.uniq

p '- розділити кожен елемент на 10, в результаті елементи не мають бути округленими до цілого:'
p array.collect {|x| x.to_f/10}

p '– отримати новий масив, який би містив в собі ті літери англійського алфавіту, порядковий номер яких є в нашому масиві:'
p array.select{|x| x < 128}.map{|x| x.chr.match?(/[[:alpha:]]/) ? x.chr : nil}.compact

p array.map{|x| x <27 ? ('a'..'z').to_a[x] : nil}.compact

p '- змінити місцями мінімальний і максимальний елементи масиву:'
ar_res = array.clone
ar_res[ar_res.index(ar_res.min)], ar_res[ar_res.index(ar_res.max)] = ar_res[ar_res.index(ar_res.max)], ar_res[ar_res.index(ar_res.min)]
p ar_res

# or

ar_res = array.clone
ar_res[ar_res.index(ar_res.max)], ar_res[ar_res.index(ar_res.min)] = ar_res.minmax
p ar_res
    
p '– знайти елементи, які знаходяться перед мінімальним числом в масиві:'
p array[0...array.index(array.min)]

p '– необхідно знайти три найменших елементи:'
p array.min(3)