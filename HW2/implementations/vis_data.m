layers = get_lenet();
load lenet.mat
% load data
% Change the following value to true to load the entire dataset.
fullset = false;
[xtrain, ytrain, xvalidate, yvalidate, xtest, ytest] = load_mnist(fullset);
xtrain = [xtrain, xvalidate];
ytrain = [ytrain, yvalidate];
m_train = size(xtrain, 2);
batch_size = 64;


layers{1}.batch_size = 1;
img = xtest(:, 1);
img = reshape(img, 28, 28);
figure
imshow(img')

%[cp, ~, output] = conv_net_output(params, layers, xtest(:, 1), ytest(:, 1));
output = convnet_forward(params, layers, xtest(:, 1));
output_1 = reshape(output{1}.data, 28, 28);
output_2 = reshape(output{3}.data, 24, 24, 20);
% Fill in your code here to plot the features.
fig = figure
for i = 1:output{3}.channel
    subplot(4,5,i);
    temp = output_2(:, :, i);
    imshow(temp');
endfor
