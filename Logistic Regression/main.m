% Load data
data = load('logistic.txt');

[m, n] = size(data);   % m->number of training examples; n->number of parameters.

X = data(:, 1:n-1);
Y = data(:, n);
[X, n] = quardraticMap(X);
n = n + 1;

% Normalize X
X_norm = X;

% Add bias
X_norm = [ones(m, 1), X_norm];   % Bias unit.

%fprintf("Data Read. Press any key to proceed...");
%pause;

% Feature mapping

% Initialize weight matrix
mean_init = 0;
std_init = 1;
%weights = normrnd(mean_init, std_init, n, 1);
weights = zeros(n, 1);

% Train the model
iteration = 1000;
learning_rate = 0.01;

[J,grad] = cost(X_norm, weights, Y);
fprintf('Initial cost at the starting point: %f\n', J);

options = optimset('GradObj', 'on', 'MaxIter', 400);
[W, J] = ...
	 fminunc(@(W)(cost(X_norm, W, Y)), weights, options);

% for i = 1:iteration
%     [J, grad] = cost(X_norm, weights, Y, reg_const);
%     weights = update(weights, learning_rate, grad);
% end

% Validation on training set
predictions = predict(X_norm, W);
%predictions = predictions > 0.5;
validate = (predictions == Y);
fprintf("Training set accuracy = %d\n", sum(validate));

% Visualize
pos = find(Y == 1);
neg = find(Y == 0);

plot(X(pos,1), X(pos,2), "k+");
hold on;
plot(X(neg,1), X(neg,2), "ko");
hold on;

plotDecisionBoundary(W);

hold off;

























