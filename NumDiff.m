%Aug 4, 2021 - 2D Tensor Product Interpolation

close all, clear all

x0 = 1.2;
f = @(x) sin(x);
fp = @(x) cos(x);

n = -10:0.5:0;
h = 10.^n;

fp0 = fp(x0);
fp0_first = (f(x0+h) - f(x0))./h;
fp0_second = (f(x0+h) - f(x0-h))./(2*h);
fp0_fourth = (f(x0-2*h) - 8*f(x0-h) + 8*f(x0+h)-f(x0+2*h))./(12*h);


clf
loglog(h, abs(fp0 - fp0_first)./abs(fp0));
hold on 
loglog(h, abs(fp0 - fp0_second)./abs(fp0));
loglog(h, abs(fp0 - fp0_fourth)./abs(fp0));
loglog(h, 1./h.^-4);

xlabel('h');
ylabel('Relative Error')
legend('First', 'Second', 'Fourth', 'Location', 'southeast')



