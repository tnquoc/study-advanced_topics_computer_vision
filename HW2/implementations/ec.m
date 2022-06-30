clear all;
close all;
clc;

pkg load image

img = imread('../images/image4.jpg');
level = graythresh(img);
##BW = imbinarize(img,level);
BW = im2bw(img, level);
##size(img), size(BW)
##figure,
##imshow(img);
##figure,
##imshow(BW);
##BW = ~BW;
error('sdsd');
stats = regionprops(BW);
for index=1:length(stats)
##    if stats(index).Area > 200 && stats(index).BoundingBox(3)*stats(index).BoundingBox(4) < 30000
      if stats(index).Area > 30 && stats(index).BoundingBox(3)*stats(index).BoundingBox(4) < 30000
        x = ceil(stats(index).BoundingBox(1));
        y= ceil(stats(index).BoundingBox(2));
        widthX = floor(stats(index).BoundingBox(3)-1);
        widthY = floor(stats(index).BoundingBox(4)-1);
        subimage(index) = {BW(y:y+widthY,x:x+widthX,:)};
        figure, imshow(subimage{index});
    end
end
error('sdsd');

pad = 1;
xtest = zeros([784, size(subimage, 2)]);
for i = 1:size(subimage)(2)
    processed_img = imresize(subimage{i}, [26, 26]);
    processed_img = padarray(processed_img, [pad, pad], 0);
    figure, imshow(processed_img);
    xtest(:, i) = reshape(processed_img, [784, 1]);
end

pkg load statistics

%% Network defintion
layers = get_lenet();

% load the trained weights
load lenet_pretrained.mat
##ytest = 1:9;
##ytest(end+1) = 0;
ytest = [6 0 6 2 6];

%% Testing the network
% Modify the code to get the confusion matrix
layers{1}.batch_size = size(subimage, 2);
[output, P] = convnet_forward(params, layers, xtest);
[~, argmax] = max(P);
argmax;
for j = 1:size(argmax, 2)
   fprintf('true = %d pred = %d\n', ytest(j), argmax(j));
end

##[~, argmax] = max(P);
##C = confusionmat(ytest, argmax);
##cm = confusionchart(ytest, argmax);
##error('test');


