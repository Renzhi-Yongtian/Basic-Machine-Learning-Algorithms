function head = initNN(layers)

    K = length(layers);
    head = dlnodeNet(randn(layers(2), layers(1)), randn(layers(2), 1));
    temp = head;

    for i = 2:K-1
        insertAfter(dlnodeNet(randn(layers(i + 1), layers(i)), ...
            randn(layers(i + 1), 1)), temp);
        temp = temp.Next;
    end
end



