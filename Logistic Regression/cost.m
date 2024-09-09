function [J, grad] = cost(X, weights, Y)

    m = size(Y, 1);
    
    h = sigmoid(X * weights);
    J = - (1/m) * (Y' * log(h) + (1 - Y)' * log(1 - h));
    grad = (1/m) * (X' * (h - Y));

end