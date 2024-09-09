% Load data from files.
load("data.mat");
m = length(y);
y = (y == (1:10));

% Initialize Weights.
layers = [400, 200, 25, 15, 10];
W = initWeight(layers);
grad = initWeight(layers);

% Set hyperparameters.
iteration = 500;
alpha = 2;
lambda = 0.01;

% Train the model.
cost = zeros(iteration, 1);
for i = 1:iteration

    cache = forward(W, X);
    output = cache{1};
    grad = backward(W, y, cache{2}, lambda);
    W = update(W, grad, alpha);
    cost(i, 1) = computeCost(output, y, W, lambda);
    fprintf("Iteration %d: cost=%f\n", i, cost(i, 1));
end

% Predict and test.
out = forward(W, X);
[~, pred_labels] = max(out{1}, [], 2);
[~, true_labels] = max(y, [], 2);
correct_predictions = sum(pred_labels == true_labels);
accuracy = correct_predictions / m;

fprintf("Accuracy = %f\n", accuracy);






