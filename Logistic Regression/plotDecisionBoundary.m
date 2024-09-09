function plotDecisionBoundary(weights)
    
    u = linspace(30, 100, 100);
    v = linspace(30, 100, 100);

    z = zeros(length(u), length(v));

    for i = 1:length(u)
        for j = 1:length(v)
            x = [1, quardraticMap([u(i), v(i)])];
            z(i,j) = x*weights;
        end
    end
    z = sigmoid(z');
    
    contour(u, v, z, [0.5 0.5], 'LineWidth', 2);

end

















