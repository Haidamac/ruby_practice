p '64. Дано цілочисельний масив. Знайти максимальну кількість максимальних елементів, що йдуть підряд.'
p '[15, 99, 99, 99, -94, 14, 15, 99, 99, 38, -14, 17, 25, 99, 99, 99, 99]'
array = [15, 99, 99, 99, -94, 14, 15, 99, 99, 38, -14, 17, 25, 99, 99, 99, 99]
i = 0
a_res = []
a_fin = []
while i < array.size
    if array[i]==array.max 
       a_res << array[i] # якщо знайшли мінімальний елемент, додаємо його до проміжного масиву
    else
        if a_fin.size < a_res.size  
           a_fin = a_res  # якщо послідовність мінімальних елементів закінчилася, фіксуємо максимальний зі знайдених результатів
        end 
        a_res = [] # очищаємо проміжний масив для нового пошуку
    end
    i += 1
end
a_fin = a_res if a_fin.size < a_res.size # фіксуємо остаточний результат в кінці масиву
p a_fin.size

# якось дуже костильно вийшло, але не придумав, як простіше