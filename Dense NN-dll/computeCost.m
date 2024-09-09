function cost = computeCost(output, y, lambda, head)

    m = size(y, 1);

    reg = 0;
    temp = head;
    while ~isempty(temp)
        W = temp.Weight;
        b = temp.bias;
        reg = reg + sum(sum(W.*W)) + sum(sum(b.*b));
        temp = temp.Next;
    end
    reg = lambda/(2*m)*reg;

    cost = -(1/m)*(sum(sum(y .* log(output + eps) + (1 - y) .* log(1 - output + eps))));
    cost = cost + reg;
end