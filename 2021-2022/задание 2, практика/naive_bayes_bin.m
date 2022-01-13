clear all; close all;
 
pw1 = 0.3;
pw2 = 0.7;
n = 5;
p = 0.9;
q = 0.2;

l0_ = log(pw2 / pw1);
L0 = round((l0_ - n * log((1 - p)/(1 - q))) / log(p * (1 - q)/ q / (1 - p)));

alpha = binocdf(L0 - 1, n, p);
beta = 1 - binocdf(L0, n, q);
sum = pw1 * alpha + pw2 * beta;

disp('ошибка первого рода');disp(alpha); 
disp('ошибка второго рода');disp(beta); 
disp('суммарная ошибка');disp(sum); 