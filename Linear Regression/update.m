function weights_new = update(weights, alpha, grad)
    
    weights_new = weights - alpha*grad;

end