clear all; close all;
 
pw1 = 0.3;
pw2 = 0.7;
n = 5;
p = 0.9;
q = 0.2;

l0_ = log(pw2 / pw1);
L0 = round((l0_ - n * log((1 - p)/(1 - q))) / log(p * (1 - q)/ q / (1 - p)))

% вариант через binopdf (cм. https://www.mathworks.com/help/stats/binocdf.html)
alpha = sum(binopdf(1 : L0 - 1, n, p), 'all');
beta = 1 - sum(binopdf(1 : L0, n, q), 'all');

alpha2 = binocdf(L0 - 1, n, p);
beta2 = 1 - binocdf(L0, n, q)

sum = pw1 * alpha + pw2 * beta;