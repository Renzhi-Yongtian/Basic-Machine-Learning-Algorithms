function output = forward(X, head, headA)
    
    m = size(X, 1);

    tempW = head;
    tempA = headA;
    temp = X;

    while ~isempty(tempW)

        temp = temp*(tempW.Weight)';
        b = ((tempW.bias)*ones(1, m))';
        temp = temp + b;
        temp = sigmoid(temp);
        

        tempA.Output = temp;
        tempA = tempA.Next;
        tempW = tempW.Next;
    end
    output = temp;
end





