% Read the image from the provided file path
image = imread('cameraman.tif');
% Convert the image to grayscale if it is not already
if size(image, 3) == 3
    image = rgb2gray(image);
end
% Convert image to double precision
image = im2double(image);
% Define the cut-off frequencies and order for Butterworth filters
D0_low1 = 30;  % Cut-off frequency for low-pass filter 1
D0_low2 = 60;  % Cut-off frequency for low-pass filter 2
D0_high1 = 30; % Cut-off frequency for high-pass filter 1
D0_high2 = 60; % Cut-off frequency for high-pass filter 2
n = 2;         % Order of the filter
% Get the image dimensions
[M, N] = size(image);
% Create the frequency grid
[u, v] = meshgrid(-floor(N/2):floor((N-1)/2), -floor(M/2):floor((M-1)/2));
D = sqrt(u.^2 + v.^2);
% Define the Butterworth low-pass filters
H_low1 = 1 ./ (1 + (D./D0_low1).^(2*n));
H_low2 = 1 ./ (1 + (D./D0_low2).^(2*n));
% Define the Butterworth high-pass filters
H_high1 = 1 - H_low1;
H_high2 = 1 - H_low2;
% Perform the Fourier Transform of the image
F = fftshift(fft2(image));
% Apply the filters in the frequency domain
F_low1 = F .* H_low1;
F_low2 = F .* H_low2;
F_high1 = F .* H_high1;
F_high2 = F .* H_high2;
% Perform the inverse Fourier Transform to get the filtered images
image_low1 = real(ifft2(ifftshift(F_low1)));
image_low2 = real(ifft2(ifftshift(F_low2)));
image_high1 = real(ifft2(ifftshift(F_high1)));
image_high2 = real(ifft2(ifftshift(F_high2)));
% Display the original and filtered images
figure;
subplot(3, 2, 1);
imshow(image, []);
title('Original Image');
subplot(3, 2, 2);
imshow(log(1 + abs(F)), []);
title('Magnitude Spectrum of Original Image');
subplot(3, 2, 3);
imshow(image_low1, []);
title(['Low-pass Filtered Image (D0 = ', num2str(D0_low1), ')']);

subplot(3, 2, 4);
imshow(image_low2, []);
title(['Low-pass Filtered Image (D0 = ', num2str(D0_low2), ')']);
subplot(3, 2, 5);
imshow(image_high1, []);
title(['High-pass Filtered Image (D0 = ', num2str(D0_high1), ')']);
subplot(3, 2, 6);
imshow(image_high2, []);
title(['High-pass Filtered Image (D0 = ', num2str(D0_high2), ')']);
