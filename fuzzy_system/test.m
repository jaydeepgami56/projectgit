% data = [rand(10,1) 10*rand(10,1)-5 rand(10,1)];
% fis = genfis1(data, [3 7], char('pimf','trimf'));
% [x,mf] = plotmf(fis,'input',1);
% subplot(2,1,1), plot(x,mf);
% xlabel('input 1 (pimf)');
% [x,mf] = plotmf(fis,'input',2);
% subplot(2,1,2), plot(x,mf);
% xlabel('input 2 (trimf)');

clc
clear all
close all



% data = [rand(10,1) 10*rand(10,1)-5 10*rand(10,1)-5 rand(10,1)];
% numMFs = [3 7 7];
% mfType = str2mat('pimf','trimf','trimf');
% fismat = genfis1(data,numMFs,mfType);
% [x,mf] = plotmf(fismat,'input',1);
% subplot(2,1,1), plot(x,mf);
% xlabel('input 1 (pimf)');
% [x,mf] = plotmf(fismat,'input',2);
% subplot(2,1,2), plot(x,mf);
% xlabel('input 2 (trimf)');





load a1;
% b=a1(1:50,1:12);
% I=b';
% O=a1(1:50,13)';
% a=b';
% x = (0:0.1:10)';
% y = sin(2*x)./exp(x/5);

% data=[a1(1:50,1) a1(1:50,2) a1(1:50,3) a1(1:50,4) a1(1:50,5) a1(1:50,6) a1(1:50,7) a1(1:50,8) a1(1:50,9) a1(1:50,10) a1(1:50,11) a1(1:50,12) a1(1:50,13)];
% numMFs = [2 5 3 3 2 2 2 3 2 3 2 2];
% mfType = str2mat('pimf','trimf','trimf','trimf','trimf','trimf','trimf','trimf','trimf','trimf','trimf','trimf');
% 
% fismat = genfis1(data,numMFs,mfType);

% [fis,error,stepsize] = anfis(a1)
% trnData = a1(1:10,1:13);
% numMFs = [12 1];
% mfType = 'gbellmf';
% epoch_n = 20;
% in_fis = genfis1(trnData,[5 2 4 3 3 2 3 3 2 3 4 3],mfType);

% data=[a1(1:50,1) a1(1:50,2) a1(1:50,3) a1(1:50,4) a1(1:50,5) a1(1:50,6) a1(1:50,7) a1(1:50,8) a1(1:50,9) a1(1:50,10) a1(1:50,11) a1(1:50,12) a1(1:50,13)];% a1(1:50,6) a1(1:50,7) a1(1:50,8) a1(1:50,9) a1(1:50,10) a1(1:50,11) a1(1:50,12) a1(1:50,13)];
data = csvread('heart-statlog.csv');

numMFs1 = [2 5 3 3 2 2 2 3 2 3 2 2];
mfType1 = str2mat('pimf','trimf','trimf','trimf','trimf','trimf' ,'trimf','trimf','trimf','trimf','trimf','trimf')%,'trimf','trimf');

fismat = genfis2(data(1:50,1:12),data(1:50,13),0.5);
out_fis = anfis(data(1:50,1:13),fismat,1);

save out_fis
output=round(evalfis(data(1:50,1:12),out_fis));

% genetic
fismat=apply_ga(fismat,output,data);
out_ga = anfis(data,fismat,20);
output_ga=round(evalfis(a1(1:50,1:12),out_fis));

output1=round(evalfis(a1(1:50,1:12),out_fis));

% plot(x,y,x,evalfis(x,out_fis));
figure;
plot(a1(1:50,13),'r');
%  hold on
 figure
plot(output,'g');
legend('Training Data','ANFIS Output');