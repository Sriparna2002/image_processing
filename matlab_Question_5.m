% Read the image from the provided file path
image = imread('cameraman.tif');
% Convert the image to grayscale if it is not already
if size(image, 3) == 3
    image = rgb2gray(image);
end
% Define the 3x3 averaging mask
mask_3x3 = (1/9) * ones(3, 3);
% Define the 5x5 averaging mask
mask_5x5 = (1/25) * ones(5, 5);
% Perform convolution using the conv2 function with the 3x3 mask
convolved_image_3x3 = conv2(double(image), mask_3x3, 'same');
% Perform convolution using the conv2 function with the 5x5 mask
convolved_image_5x5 = conv2(double(image), mask_5x5, 'same');
% Display the original and convolved images
figure;

subplot(2, 2, 1);
imshow(image);
title('Original Image');
subplot(2, 2, 2);
imshow(uint8(convolved_image_3x3));
title('Convolved with 3x3 Mask');
subplot(2, 2, 3);
imshow(uint8(convolved_image_5x5));
title('Convolved with 5x5 Mask');
