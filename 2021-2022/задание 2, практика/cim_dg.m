clear all; close all;
 
p = 0.1;
gamma = 0.07;
k = 1000;

t = norminv((2-gamma)/2);
d = t*sqrt((1-p)*p/k);
disp('доверительный интервал');disp(d); 