% Read a sample image
image = imread('cameraman.tif');
% Convert to double for manipulation
image_double = im2double(image);
% Determine negative of an image
negative_image = imcomplement(image_double);
% Display results
figure;
subplot(2, 3, 1);
imshow(image);
title('Original Image');
subplot(2, 3, 3);
imshow(negative_image);
title('Negative Image');
