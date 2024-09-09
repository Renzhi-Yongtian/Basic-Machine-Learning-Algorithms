% Load data
data = load('linear.txt');

[m, n] = size(data);   % m->number of training examples; n->number of parameters.

X = data(:, 1:n-1);
X = [ones(m, 1), X];   % Bias unit.
Y = data(:, n);

fprintf("Data Read. Press any key to proceed...");
pause;

% Visualize
% plot(X, Y, 'rx');

% Initialize weight matrix
mean_init = 0;
std_init = 1;
weights = normrnd(mean_init, std_init, n, 1);
% weights = 0.5*ones(n, 1);

% Train the model
iteration = 1000;
learning_rate = 0.01;
reg_const = 0;

options = optimset('GradObj', 'on', 'MaxIter', 400);
[W, C] = fminunc(@(weights)(cost(X, weights, Y, reg_const)), weights, options);

% for i = 1:iteration
% 
%     [J, grad] = cost(X, weights, Y, reg_const);
%     if mod(i,10) == 0
%         fprintf("Iteration %d: cost = %d\n", i, J);
%     end
%     weights = update(weights, learning_rate, grad);
% 
% end

prediction = predict(X, W);

plot(X(:,2), Y,"rx", X(:, 2), prediction);

























