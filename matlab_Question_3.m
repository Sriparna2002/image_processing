% Read a sample image
image = imread('cameraman.tif');

% Perform histogram equalization
equalized_image = histeq(image);

% Display original and equalized images
figure;
subplot(2, 2, 1);
imshow(image);
title('Original Image');
subplot(2, 2, 2);
imshow(equalized_image);
title('Histogram Equalized Image');

% Display histograms
subplot(2, 2, 3);
imhist(image);
title('Histogram of Original Image');
subplot(2, 2, 4);
imhist(equalized_image);
title('Histogram of Equalized Image');
