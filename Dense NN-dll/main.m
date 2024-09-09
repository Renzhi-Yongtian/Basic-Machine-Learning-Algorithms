% Load Data
load("ex3data1.mat");
y = (y == 1:10);
m = size(y, 1);

% Initialize linked list
layers = [400, 50, 25, 10];     % layer1, 2, 3 = 400, 25, 10
head = initNN(layers);
headA = initA(layers, m);

% Train model
learning_rate = 0.1;
reg = 0.01;
iteration = 1000;        

for i = 1:iteration

    output = forward(X, head, headA);
    cost = computeCost(output, y, reg, head);
    fprintf("%dth iteration: Cost = %f\n", i, cost);
    headG = backward(head, headA, y);

    update(head, headG, learning_rate, reg, m);

end






