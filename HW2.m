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
x(1) = max_x(I); % - This is the max of the function (x value)

for i = 1:n
    x(i+1) = maxx(i);
    %p(i) = 
    
    plot(x)
    hold on
    fplot(f, [-1 1]);
    drawnow();
    pause();
end 
d=12;
and then;


