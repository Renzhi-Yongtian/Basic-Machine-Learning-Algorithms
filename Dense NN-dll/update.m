function head = update(headW, headG, alpha, lambda, m)

    tempW = headW;
    tempG = headG;

    while ~isempty(tempW)
        tempW.Weight = tempW.Weight - alpha*tempG.Weight - lambda/m*(tempW.Weight);
        tempW.bias = tempW.bias - alpha*tempG.bias;
        tempW = tempW.Next;
        tempG = tempG.Next;
    end

end