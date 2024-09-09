function headG = backward(headW, headA, y)

    
    tempA = headA;
    tempW = headW;
    headG = dlnodeNet(1, 1);
    tempG = headG;
    while ~isempty(tempA.Next)
        tempA = tempA.Next;
        tempW = tempW.Next;
        insertAfter(dlnodeNet(1, 1), tempG);
        tempG = tempG.Next;
    end
    tempG = tempG.Prev;
    
    deltaW = tempA.Output - y;
    tempA = tempA.Prev;
    while ~isempty(tempA)
        tempG.bias = (sum(deltaW, 1))';
        deltaW = deltaW*(tempW.Weight).*(tempA.Output);
        tempG.Weight = (tempA.Next.Output)'*deltaW;
        tempG = tempG.Prev;
        tempW = tempW.Prev;
        tempA = tempA.Prev;
    end
end










