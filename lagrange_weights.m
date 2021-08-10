function [w] = lagrange_weights(x)
% 
%tic
    n = length(x);
    w = ones(size(x));
    
    for j = 1:n
        for i = 1:n
            if i ~= j 
                w(j) = w(j) * (x(j)-x(i));
            end
        end
        
        w(j) = 1 / w(j);
    end
    
 
end
