function grad = backward(W, y, A, lambda)

    K = length(A);
    m = length(y);

    D = cell(1, K);
    D{K} = A{K} - y;
    grad = cell(1, K - 1);

    for i = flip(2:K)
        A{i-1} = [ones(m, 1), A{i-1}];
        D{i-1} = D{i}*W{i-1}.*gradSig(A{i-1});
        D{i-1} = D{i-1}(:, 2:end);
        grad{i-1} = (1/m)*((D{i})'*A{i-1} + lambda*W{i-1});
        grad{i-1}(:, 2:end) = grad{i-1}(:, 2:end) - 1/m*lambda*W{i-1}(:, 2:end);
    end
end


















