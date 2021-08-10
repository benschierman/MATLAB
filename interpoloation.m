%July 26

%f = @(x) abs(x);
f = @(x) (1)./(1+25*x.^2);


n = 5;
i = 0:n;
x = cos((2*i+1)/(2*(n+1))*pi); %Change this to a vector to set up your own grid points 
y = f(x);

w = lagrange_weights(x);
z = linspace(-1, 1, 1001); %this get changed to 100001

v = langrange_eval_barycentric(z, x, y, w); %this is the estimated function
%find the error subtract f from v



 figure(1);
 plot(z, f(z))
 hold on
 plot(z, v)
 
 figure(2);
 plot(z, abs(v-f(z)))

 %f = @(x) 1./ (1 +25 .* x.^2);
 %f = @(x) x.^5;
%f = @(x) exp(3.*x).*sin(200*x.^2)./(1+20*x.^2);
%f = @(x) sin(5*x)
%f = @(x) abs(x)
f = @(x) sign(x);
degrees = 1:5;
maxerr=zeros(size(degrees));
for i = 1:length(degrees);
    n = degrees(i);
    t = cos((2*(0:n)+1)/(2*(n+1))*pi);
    a = -1;
    b = 1;
    x = a+(b-a)/(2)*(t+1);
    y = f(x);

    w = lagrange_weights(x);
    z = linspace(a, b, 1001);

    v = langrange_eval_barycentric(z, x, y, w);
    maxerr(i) = max(abs(v-f(z)));
    
end
figure(3);
plot (z,v);
hold on
plot(z, f(z))
plot (x, (f(x)))

figure(4);
%semilogy(degrees, maxerr)
loglog(degrees, maxerr)