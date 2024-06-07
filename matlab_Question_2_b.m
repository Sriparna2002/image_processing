% Read a sample image
image = imread('cameraman.tif');
% Convert to double for manipulation
image_double = im2double(image);
% Manipulate contrast
contrast_factor = 1.5; % Factor to manipulate contrast
manipulated_contrast = imadjust(image_double, [], [], contrast_factor);
% Display results
figure;
subplot(2, 3, 1);
imshow(image);
title('Original Image');
subplot(2, 3, 2);
imshow(manipulated_contrast);
title('Manipulated Contrast');
