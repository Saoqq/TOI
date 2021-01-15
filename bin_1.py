import numpy as np
from scipy import stats

pw1 = 0.5
pw2 = 0.5
n = 25
p = 0.6  # p > q!  Если больше, то по идее можно просто поставить "-" при вычислении L0, но это не точно
q = 0.4

l0 = pw2 / pw1
l0_ = np.log(l0)
print((l0_ - n * np.log((1 - p) / (1 - q))) / np.log((p * (1 - q)) / (q * (1 - p))))
L0 = np.round((l0_ - n * np.log((1 - p) / (1 - q))) / np.log((p * (1 - q)) / (q * (1 - p))))

if (l0_ - n * np.log((1 - p) / (1 - q))) / np.log((p * (1 - q)) / (q * (
        1 - p))) - L0 == 0:  # Это связано с тем, что при получении дробного числа, заканчивающегося на .5, питон округляет вниз, а матлаб - вверх
    L0 += 1

a = stats.binom.cdf(L0 - 1, n, p)
b = 1 - stats.binom.cdf(L0, n, q)
# вычисляет биномиальную кумулятивную функцию распределения
# при каждом из значений в x использование соответствующего количества
# испытаний в n и вероятность успеха для каждого испытания в p.
# ниже идет пример для матлаба, но по факту тут одно и то же
# Вычислите и постройте биномиальную кумулятивную функцию распределения для заданной области целочисленных
# значений, количества испытаний и вероятности успеха для каждого испытания.
# Бейсбольная команда играет в 100 игр в сезон и имеет шанс на победу 50-50 каждая игра.
# Найдите вероятность команды, выигрывающей больше чем 55 игр в сезон.
# format long
# 1 - binocdf(55,100,0.5)
print('Ошибка 1 рода: ')
print(a)
print('Ошибка 2 рода: ')
print(b)
print(pw1 * a + pw2 * b)
