% Making Continuous-Time Pole-Zero Diagrams

clear;
close all;
clc;
%% Example
b = [1 -1];
a = [1 3 2];
zs = roots(b);
ps = roots(a);
figure(1);
subplot(2,2,1)
plot(real(zs),imag(zs),'o');
hold on;
plot(real(ps),imag(ps),'x');
title('Example')
grid;
axis([-3 3 -3 3])

%% Exercise a
% Exercise a1
a = [1 5];
b = [1 2 3];
aroot = roots(a);
broot = roots(b);
subplot(2,2,2)
plot(real(aroot),imag(aroot),'o');
hold on;
plot(real(broot),imag(broot),'x');
title('$H(s)=\frac{s+5}{s^2+2s+3}$','Interpreter','latex')
grid;
axis([-6 2 -2 2])

% Exercise a2
a = [2 5 12];
b = [1 2 10];
aroot = roots(a);
broot = roots(b);
subplot(2,2,3)
plot(real(aroot),imag(aroot),'o');
hold on;
plot(real(broot),imag(broot),'x');
title('$H(s)=\frac{2s^2+5s+12}{s^2+2s+10}$','Interpreter','latex')
grid;
axis([-2 0 -4 4])

% Exercise a3
a = [2 5 12];
b = [1 4 14 20];
aroot = roots(a);
broot = roots(b);
subplot(2,2,4)
plot(real(aroot),imag(aroot),'o');
hold on;
plot(real(broot),imag(broot),'x');
title('$H(s)=\frac{2s^2+5s+12}{(s^2+2s+10)(s+2)}$','Interpreter','latex')
grid;
axis([-3 0 -4 4])

figure(2)
zs = [-1+2i, -1-2i];  % 零点
ps = [3];              % 极点
plot(real(zs), imag(zs), 'o');  % 绘制零点
hold on;
plot(real(ps), imag(ps), 'x');  % 绘制极点
grid on;
axis([-4 4 -3 3]);
title('Pole-Zero Plot');

%% exercise 2
figure(3)
subplot(2,2,1)
b = [1 -1 0];  % 分子系数
a = [1 3 2];   % 分母系数
dpzplot(b, a); % 绘制零极点图

subplot(2,2,2)
b = [1 0 0];      % 分子系数
a = [1 1 0.5];    % 分母系数
dpzplot(b, a);    % 绘制零极点图

subplot(2,2,3)
b = [1 0.5 0 0];          % 分子系数
a = [1 -1.25 0.75 -0.125]; % 分母系数
dpzplot(b, a);             % 绘制零极点图