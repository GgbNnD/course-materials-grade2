clc;
clear;
a = 1:12;
b = reshape(a,3,4);

c = zeros(3,4);
c(:) = a(:);

a = [1 2 3 ; 4 5 6 ; 7 8 9];
rank(a);
sum(a);


x = randn(10000,5);
mean(x);

f = [1 1];
i = 1;
while f(i)+f(i+1)<1000
    f(i+2) = f(i)+f(i+1);
    i = i+1;
end
f