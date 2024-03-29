%ГСВ с различными матрицами ковариации
clear all; close all;

pw=[0.5 0.5];
pw=pw/sum(pw);

n = 3; %размерность

m = [2, 1, -1; 2, -1, 2]'; %задавать по очереди каждый вектор
C1 = [2, -0.5, -0.3; -0.5, 1, -0.5; -0.3, -0.5, 1];
C1_=C1^-1;
C2 = [2, -0.5, -0.3; -0.5, 1, -0.5; -0.3, -0.5, 1];
C2_=C2^-1;

l0_=log(pw(2)/pw(1));
mg1 = 0.5*(trace(C2_*C1 - eye(n)) + (m(:,1)-m(:,2))'*C1_*(m(:,1)-m(:,2)) - log(det(C1)/det(C2)));
Dg1 = 0.5*(trace(C2_*C1 - eye(n))^2) + (m(:,1)-m(:,2))'*C2_*C1*C2_*(m(:,1)-m(:,2));

mg2 = 0.5*(trace(eye(n) - C1_*C2) - (m(:,1)-m(:,2))'*C2_*(m(:,1)-m(:,2)) + log(det(C2)/det(C1)));
Dg2 = 0.5*(trace(eye(n) - C1_*C2)^2) + (m(:,1)-m(:,2))'*C1_*C2*C1_*(m(:,1)-m(:,2));

alpha = normcdf(l0_,mg1,sqrt(Dg1));
disp('ошибка первого рода');disp(alpha); 

beta = 1-normcdf(l0_,mg2,sqrt(Dg2));
disp('ошибка второго рода');disp(beta); 

disp('суммарная ошибка');disp(pw(2)*beta+pw(1)*alpha); 

%верхняя граница Чернова
mu = (1/16)*(m(:,1)-m(:,2))'*((C1+C2)^-1)*(m(:,1)-m(:,2)) + 0.5*log(0.5*((det(C1)+det(C2))/sqrt(det(C1)*det(C2))));
alpha_ch = sqrt(pw(2)/pw(1))*exp(-mu);
beta_ch = sqrt(pw(1)/pw(2))*exp(-mu);
sum_ch = sqrt(pw(2)*pw(1))*exp(-mu);

disp('Верхняя граница Чернова для ошибки первого рода');disp(alpha_ch); 
disp('Верхняя граница Чернова для ошибки второго рода');disp(beta_ch); 
disp('Верхняя граница Чернова для суммарной ошибки');disp(sum_ch); 

