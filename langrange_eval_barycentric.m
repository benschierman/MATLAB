function [v] = langrange_eval_barycentric(z, x, y, w)
    % INPUTS: 
    % z     evaluation points [array of size m]
    % x     abscissae [array of size n]
    % y     function values at x [array of size n]
    % w     lagrange weights for x [array of size n]
    % OUTPUTS: 
    % v     interpolated polynomial evaluated at z
    
    n = length(x);
    num = zeros(size(z));
    den = zeros(size(z));
    
    for j = 1:n
        val = w(j) ./ (z - x(j));
        num = num + y(j) * val;
        den = den + val;
    end
  
    v = num ./ den;
    for j = find(isnan(v))
        [~, k] = min(abs(z(j)-x));
        v(j) = y(k);
    end
end
    
    