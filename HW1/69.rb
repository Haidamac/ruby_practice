p '69. Дано дійсне число R і масив дійсних чисел. Знайти два елементи масиву, сума яких найбільш близька до цього числа'
p 'R=51.3333333'
p '[-391.334, 106.734, -132.406, 419.246, -22.538, 106.064, -301.273, 20.306, 504.192, -231.992, -76.499, -15.125, -149.259, 269.296, 188.499, -571.249, 193.426]'
r = 51.3333333
array = [-391.334, 106.734, -132.406, 419.246, -22.538, 106.064, -301.273, 20.306, 504.192, -231.992, -76.499, -15.125, -149.259, 269.296, 188.499, -571.249, 193.426]

# наразі не вдалося всю логіку запхати в 1 рядок

a_sort = array.sort
el1 = a_sort[a_sort.map{ |x| (x-r).abs}.index(a_sort.map{ |x| (x-r).abs}.min)]
a_res = [el1]
i_el1 = a_sort.index(el1)
if i_el1 < a_sort.size-1 && (a_sort[i_el1-1] + el1 - r) > (a_sort[i_el1+1] + el1 - r)
    a_res << a_sort[i_el1+1]
else
    a_res << a_sort[i_el1-1]
end
p a_res    