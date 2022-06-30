pkg load statistics

%% Network defintion
layers = get_lenet();

%% Loading data
fullset = false;
[xtrain, ytrain, xvalidate, yvalidate, xtest, ytest] = load_mnist(fullset);

% load the trained weights
load lenet_test.mat

%% Testing the network
% Modify the code to get the confusion matrix
for i=1:100:size(xtest, 2)
    [output, P] = convnet_forward(params, layers, xtest(:, i:i+99));
    ##[~, argmax] = max(P);
    ##argmax;
    ##for j = 1:size(argmax, 2)
    ##   fprintf('true = %d pred = %d\n', ytest(i:i+99)(j), argmax(j));
    ##end

    [~, argmax] = max(P);
    C = confusionmat(ytest(i:i+99), argmax);
    cm = confusionchart(ytest(i:i+99), argmax);
    error('test');
end
