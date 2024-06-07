% Read the image from the provided file path
image = imread('cameraman.tif');
% Convert the image to grayscale if it is not already
if size(image, 3) == 3
    image = rgb2gray(image);
end
% Corrupt the image with salt-and-pepper noise
salt_pepper_noise_image = imnoise(image, 'salt & pepper', 0.05);
% Corrupt the image with Gaussian noise
gaussian_noise_image = imnoise(image, 'gaussian', 0, 0.01);

% Define the 3x3 and 5x5 averaging masks
mask_3x3 = (1/9) * ones(3, 3);
mask_5x5 = (1/25) * ones(5, 5);
% Apply 3x3 averaging filter to the noisy images
filtered_image_sp_3x3 = conv2(double(salt_pepper_noise_image), mask_3x3, 'same');
filtered_image_gauss_3x3 = conv2(double(gaussian_noise_image), mask_3x3, 'same');
% Apply 5x5 averaging filter to the noisy images
filtered_image_sp_5x5 = conv2(double(salt_pepper_noise_image), mask_5x5, 'same');
filtered_image_gauss_5x5 = conv2(double(gaussian_noise_image), mask_5x5, 'same');
% Display the original, noisy, and filtered images
figure;
% Original image
subplot(3, 4, 1);
imshow(image);
title('Original Image');
% Salt-and-pepper noise
subplot(3, 4, 2);
imshow(salt_pepper_noise_image);
title('Salt & Pepper Noise');
% Gaussian noise
subplot(3, 4, 3);
imshow(gaussian_noise_image);
title('Gaussian Noise');
% Filtered salt-and-pepper noise with 3x3 mask
subplot(3, 4, 5);
imshow(uint8(filtered_image_sp_3x3));
title('Filtered S&P Noise (3x3)');
% Filtered Gaussian noise with 3x3 mask
subplot(3, 4, 7);
imshow(uint8(filtered_image_gauss_3x3));
title('Filtered Gauss Noise (3x3)');
% Filtered salt-and-pepper noise with 5x5 mask
subplot(3, 4, 9);
imshow(uint8(filtered_image_sp_5x5));
title('Filtered S&P Noise (5x5)');
% Filtered Gaussian noise with 5x5 mask
subplot(3, 4, 11);
imshow(uint8(filtered_image_gauss_5x5));
title('Filtered Gauss Noise (5x5)');
