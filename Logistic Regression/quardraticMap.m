function [X_maped, n] = quardraticMap(X)        % x1^2 x2^2 x1x2
    
    n = size(X, 2);
    n = n + n*(n+1)/2;
    
    X_maped = [X, zeros(size(X,1), n - size(X, 2))];
    k = 1;
    for i = 1:size(X,2)
        for j = i:size(X,2)
            X_maped(:, size(X,2) + k) = X(:,i).*X(:,j);
            k = k + 1;
        end
    end
end