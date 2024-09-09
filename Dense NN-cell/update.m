function W_new = update(W, grad, alpha)

    K = length(W);

    for i = 1:K
        W_new{i} = W{i} - alpha*grad{i};
    end
end