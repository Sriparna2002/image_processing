% Read the image from the provided file path
image = imread('cameraman.tif');
% Convert the image to grayscale if it is not already
if size(image, 3) == 3
    image = rgb2gray(image);
end
% Corrupt the image with salt-and-pepper noise
salt_pepper_noise_image = imnoise(image, 'salt & pepper', 0.05);
% Define the 3x3 and 5x5 box filters
box_filter_3x3 = (1/9) * ones(3, 3);
box_filter_5x5 = (1/25) * ones(5, 5);
% Apply 3x3 box filter to the noisy image
filtered_image_box_3x3 = conv2(double(salt_pepper_noise_image), box_filter_3x3, 'same');
% Apply 5x5 box filter to the noisy image
filtered_image_box_5x5 = conv2(double(salt_pepper_noise_image), box_filter_5x5, 'same');
% Apply median filter to the noisy image
filtered_image_median = medfilt2(salt_pepper_noise_image, [3 3]);
% Display the original, noisy, and filtered images
figure;
% Original image
subplot(2, 3, 1);
imshow(image);
title('Original Image');
% Salt-and-pepper noise
subplot(2, 3, 2);
imshow(salt_pepper_noise_image);
title('Salt & Pepper Noise');
% Filtered with 3x3 box filter
subplot(2, 3, 3);
imshow(uint8(filtered_image_box_3x3));
title('Filtered with 3x3 Box Filter');
% Filtered with 5x5 box filter
subplot(2, 3, 4);
imshow(uint8(filtered_image_box_5x5));
title('Filtered with 5x5 Box Filter');
% Filtered with median filter
subplot(2, 3, 6);
imshow(filtered_image_median);
title('Filtered with Median Filter');
