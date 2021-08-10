%Aug 16, 2021 - HW 2

close all, clear all


f = input('Please enter a function f(x) in the form @(x) [function] \n');
n = input('How many points would you like to compute? \n');

if isempty(f);
    f = @(x) abs(x);
end

if isempty(n);
    n = 5;
end

%Set up 100001 points and evaluate them at the function f
max_x = linspace(-1, 1, 100001);
maxx = f(max_x);

%Take absolute value
maxabs = abs(maxx);

% Determine x and y value in the array 
[M, I] = max(maxabs);
x(1) = maxx(I); % - This is the max of the function (x value)
p0 = I;
pp = abs(maxx - p0);
[M,I] = max(abs(maxx - p0));
x(2) = maxx(I);
mp = (x(2)-x(1))/(f(x(2))-f(x(1)));
p1 = @(xx) mp*(xx-x(2))+f(x(2));


fplot(f, [-1, 1])
hold on
plot(p0)
fplot(p1)
   
%fplot(f, [-1 1]);
  %  drawnow();
 %   pause();
 



