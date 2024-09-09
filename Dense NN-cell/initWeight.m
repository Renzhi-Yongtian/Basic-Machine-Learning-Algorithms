function W = initWeight(layers)

    K = length(layers);
    W = cell(1, K - 1);
    for l = 1:(K-1)
        W(l) = {randn(layers(l + 1), layers(l) + 1)};
    end
end