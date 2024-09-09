function J = computeCost(output, y, W, lambda)

    m = size(y, 1);
    
    J = -(1/m)*(sum(sum(y .* log(output + eps) + (1 - y) .* log(1 - output + eps), 'all')));
    J_reg = 0;

    for i = 1:length(W)
        J_reg = J_reg + (sum(sum(W{i}.*W{i})));
    end
    J = J + J_reg*(lambda/(2*m));
end