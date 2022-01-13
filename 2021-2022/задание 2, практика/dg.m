clear all; close all;

k = 1000;
gamma = 0.07;

t = norminv((2-gamma)/2);
d_g = (t * 0.5) / sqrt(k);
disp('гарантированный доверительный интервал');disp(d_g);
