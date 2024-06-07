% Read the input image
input_image = imread('cameraman.tif');
% Convert the input image to double precision for processing
input_image = im2double(input_image);
% Define motion blur parameters
motion_angle = 45; % Angle of motion blur (in degrees)
motion_length = 20; % Length of motion blur kernel
% Create motion blur filter kernel
motion_kernel = fspecial('motion', motion_length, motion_angle);
% Apply motion blur to the input image
blurred_image = imfilter(input_image, motion_kernel, 'conv', 'circular');
% Display the original and blurred images
figure;
subplot(1, 2, 1);
imshow(input_image);
title('Original Image');
subplot(1, 2, 2);
imshow(blurred_image);
title('Motion Blurred Image');
