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


####### inner_product_forward #######
##input.height = 3;
##input.width = 3;
##input.channel = 1;
##input.batch_size = 32;
##input.data = 1:(9*32);
##input.data = reshape(input.data, [9, 32]);
##input.data;
##
##h = input.height;
##w = input.width;
##c = input.channel;

##layer.type = 'IP';
##layer.num = 500;
##layer.init_type = 'uniform';
##
##scale = sqrt(3/(h*w*c));
##param.w = 2*scale*rand(h*w*c, layer.num) - scale;
##param.b = zeros(1, layer.num);
##
##output = inner_product_forward(input, layer, param);



####### pooling_layer_forward #######
##input.height = 4;
##input.width = 4;
##input.channel = 1;
##input.batch_size = 32;
##input.data = 1:(16*32);
##input.data = reshape(input.data, [16, 32]);
##input.data;
##
##h = input.height;
##w = input.width;
##c = input.channel;
##
##layer.type = 'POOLING';
##layer.k = 2;
##layer.stride = 2;
##layer.pad = 0;
##output = pooling_layer_forward(input, layer);

##x1 = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];
##x2 = [13 14 15 16; 9 10 11 12; 5 6 7 8; 1 2 3 4];
##x3 = [17 18 19 20; 21 22 23 24; 25 26 27 28; 29 30 31 32];
##y = zeros([4, 4, 3]);
##y(:, :, 1) = x1;
##y(:, :, 2) = x2;
##y(:, :, 3) = x3;
##k = 2;
##pooling_values = [];
##for i = 1:2:4
##  for j = 1:2:4
##    mat = y(j:j+k-1, i:i+k-1, :);
##    o = reshape(max(max(mat, [], 2), [], 1), [1, 3]);
##    pooling_values = [pooling_values; o];
##  endfor
##endfor
##size(pooling_values)
##pooling_values
##pooling_values =  reshape(pooling_values, [2, 2, 3])



####### conv_layer_forward #######
##x1 = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];
##x2 = [13 14 15 16; 9 10 11 12; 5 6 7 8; 1 2 3 4];
##x3 = [17 18 19 20; 21 22 23 24; 25 26 27 28; 29 30 31 32];
##y = zeros([4, 4, 3]);
##y(:, :, 1) = x1;
##y(:, :, 2) = x2;
##y(:, :, 3) = x3;
##input.height = 4;
##input.width = 4;
##input.channel = 3;
##input.batch_size = 32;
##input.data = 1:(48*32);
##input.data = reshape(input.data, [48, 32]);
##input.data;
##
##layer.type = 'CONV';
##layer.k = 3;
##layer.stride = 1;
##layer.pad = 0;
##layer.group = 1;
##layer.num = 50;
##
##h = input.height;
##w = input.width;
##c = input.channel;
##
##scale = sqrt(3/(h*w*c));
##param.w = 2*scale*rand(layer.k*layer.k*c/layer.group, layer.num) - scale;
##param.b = zeros(1, layer.num);
##output = conv_layer_forward(input, layer, param);


####### relu_backward #######
output = [1 -2 3; 4 5 -6];
layer.name = 'relu backwar';
input.data = [1 0 -2; -3 0 12];
input.height = 4;
input.width = 4;
input.channel = 3;
input.batch_size = 32;

x = relu_forward(input)
##input_od = relu_backward(output, input, layer)





