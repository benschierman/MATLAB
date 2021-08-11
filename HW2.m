%Aug 16, 2021 - HW 2

close all, clear all

%% Initiation
f = @(x) abs(x);
%f = @(x) (1)./(1+25*x.^2);
%f = @(x) exp(sin(pi*x))
n = 50;

%Determine x0 [which is x(1)]
z = linspace(-1, 1, 100001);
zfx = f(z); % Plotting (z, zfx) gives us the function above
azfx = abs(zfx);
[M, I] = max(azfx);
x(1) = z(I);

%% For Loop

for i = 1:n % I think we start this at 1 since I already determined the first x value above
y = f(x);
w = lagrange_weights(x);
v = langrange_eval_barycentric(z, x, y, w);  %this is the interpolated polynomial
[M, I] = max(abs(zfx - v));
x(i+1) = z(I);
disp(i)
end

%%Plots

figure(1);
tit = char(f);
plot(z, zfx) % this is our actual function
hold on
error = abs(zfx - v);
plot(z,v)
legend('f(x)', 'Interpolated Function', 'FontSize', 18, 'Location', 'Northwest')
title("f(x) =" + tit + " where n =" + n + "")

figure(2);
plot(z, error) %this is the error
hold on
a = zeros(1, 100001);
a(:) = mean(error);
plot(z, a, '--')
legend('Error - |f(x) - p_n(x)|', 'Mean Error', 'FontSize', 24, 'Location', 'North')
title("f(x) =" + tit + " where n = " + n + ".")


