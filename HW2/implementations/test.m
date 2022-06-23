clear all;
close all;
clc;

##[xtrain, ytrain, xvalidate, yvalidate, xtest, ytest] = load_mnist(false);

##for i = 10:15
##  x = xtrain(:, i);
##  img = reshape(x,  [28, 28]);
##  img = transpose(img);
##  figure, imshow(img);
##endfor

input.height = 3;
input.width = 3;
input.channel = 1;
input.batch_size = 32;
input.data = 1:(9*32);
input.data = reshape(input.data, [9, 32]);
input.data;

h = input.height;
w = input.width;
c = input.channel;

layer.type = 'IP';
layer.num = 500;
layer.init_type = 'uniform';

scale = sqrt(3/(h*w*c));
param.w = 2*scale*rand(h*w*c, layer.num) - scale;
param.b = zeros(1, layer.num);

output = inner_product_forward(input, layer, param);









