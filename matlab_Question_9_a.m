% Read the input image
input_image = imread('cameraman.tif');
% Convert the input image to grayscale if it's not already in grayscale
if size(input_image, 3) == 3
    input_image = rgb2gray(input_image);
end
% Convert the image to double precision for processing
input_image = im2double(input_image);
% Compute the 2D Fourier Transform of the input image
F = fft2(input_image);
% Shift the zero-frequency component to the center of the spectrum
F_shifted = fftshift(F);
% Define a high-pass filter in the frequency domain
[M, N] = size(F);
u = 0:(M-1);
v = 0:(N-1);
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
[V, U] = meshgrid(v, u);
D = sqrt(U.^2 + V.^2);
cutoff_frequency = 30; % Adjust this cutoff frequency as needed
H = double(D > cutoff_frequency);
% Apply the high-pass filter to the frequency domain representation of the image
G = F_shifted .* H;
% Shift the zero-frequency component back to the corner
G_shifted = ifftshift(G);
% Compute the inverse Fourier Transform to obtain the filtered image
filtered_image = ifft2(G_shifted);
% Convert the filtered image back to the uint8 format
filtered_image = uint8(abs(filtered_image) * 255);
% Display the original and filtered images
figure;
subplot(1, 2, 1);
imshow(input_image);
title('Original Image');
subplot(1, 2, 2);
imshow(filtered_image);
title('High-pass Filtered Image');
