clear ; close all; clc

input_layer_size  = 400;
hidden_layer_size = 25;
num_labels = 10;

%% =============== Part 1: Load and Visualize Data ===============

fprintf('Loading Data ...\n')
load('ex4data1.mat');
m = size(X, 1);

sel = randperm(size(X, 1));
sel = sel(1:100);

displayData(X(sel, :));

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =============== Part 2: Initialize Parameters ===============

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


%% =============== Part 3: Implement Backpropagation ===============

fprintf('\nChecking Backpropagation... \n');

checkNNGradients;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% =============== Part 4: Training Neural Network ===============

fprintf('\nTraining Neural Network... \n')

options = optimset('MaxIter', 50);

lambda = 1;

costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================= Part 5: Visualize Weights =================

fprintf('\nVisualizing Neural Network... \n')

displayData(Theta1(:, 2:end));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ================= Part 6: Implement Predict =================

pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);


