function cache = forward(W, X)

    K = length(W) + 1;
    A = cell(1, K);
    A{1} = X;
    for i = 2:K
        A{i} = sigmoid([ones(size(A{i-1}, 1), 1), A{i-1}]*(W{i-1})');
    end
    output = A{K};
    cache = {output, A};
end