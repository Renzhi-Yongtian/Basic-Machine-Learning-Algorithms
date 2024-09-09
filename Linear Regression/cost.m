function [J, grad] = cost(X, weights, Y, lambda)

    [m,] = size(Y,1);
    J = 1./(2*m).*((X*weights-Y)'*(X*weights-Y) + lambda*(weights')*weights);
    
    grad = (1/m)*(X'*(X*weights-Y) + lambda*weights);

end