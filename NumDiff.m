%Aug 4, 2021 - Numerical Differentiation
%Edited in class on Aug 9, 2021

close all, clear all

x0 = 1.2;
f = @(x) sin(x);
fpp = @(x) -sin(x);

% fp = @(x) cos(x);

n = -5:0.05:0;
h = 10.^n;

% fp0 = fp(x0);
% fp0_first = (f(x0+h) - f(x0))./h;
D_1h = (f(x0+h) - 2*f(x0) + f(x0-h))./(h.^2); 
D_2h = (f(x0+2*h) -2*f(x0) + f(x0-2*h))./((2*h).^2); 

% fp0_second_1h = (f(x0+h) - f(x0-h))./(2*h); %Center difference
% fp0_fourth = (f(x0-2*h) - 8*f(x0-h) + 8*f(x0+h)-f(x0+2*h))./(12*h); %Fourth order center difference


clf
%loglog(h, abs(fp0 - fp0_first)./abs(fp0));
% hold on 
M = 1;
loglog(h, abs(fpp(x0) - D_1h))
hold on

loglog(h, abs((1/3)*(D_1h-D_2h)))
% loglog(h, (M/6)*h.^2)
% loglog(h, eps()./h)
% loglog(h, abs(fp0 - fp0_second)./abs(fp0));
%loglog(h, abs(fp0 - fp0_fourth)./abs(fp0));
%loglog(h, h.^2)
% loglog(h, 1./h.^-4);

xlabel('h');
ylabel('Absolute Error')
% legend('First', 'Second', 'Fourth', 'Location', 'southeast')
legend('Second', 'truncation', 'Location', 'southeast')


