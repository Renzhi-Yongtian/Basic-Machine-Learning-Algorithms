function headA = initA(layers, m)
    
    headA = dlnodeA(randn(m, layers(2)));
    temp = headA;
    K = length(layers);

    for i = 2:K-1
        insertAfter(dlnodeA(randn(m, layers(i + 1))), temp);
        temp = temp.Next;
    end
end






