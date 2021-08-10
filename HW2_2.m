% Problem 2
close all; clear;

tab = zeros(10);

% for y = 2 
z = linspace(0, 10, 100000);
x = [2, 5, 8];
w = lagrange_weights(x);
y = [960, 2911, 6052];
v2 = langrange_eval_barycentric(z, x, y, w);

% for y = 5 
y = [4980, 7441, 9535];
v5 = langrange_eval_barycentric(z, x, y, w);

% for y = 8 
y = [11863, 12742, 11495];
v8 = langrange_eval_barycentric(z, x, y, w);

locat = 10000:10000:100000;
tab(:,2) = v2(locat);
tab(:, 5) = v5(locat);
tab(:, 8) = v8(locat);

% now doing all the xs (all rows)
for i = 1:10
   y(1) = tab(i, 2);
   y(2) = tab(i, 5);
   y(3) = tab(i, 8);
   v = langrange_eval_barycentric(z, x, y, w);
   tab(i, :) = v(locat);
end

%generate table
T1 = array2table(tab, 'VariableNames', {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10'}, ...
    'RowNames', {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10'});


