% Read a sample image
image = imread('cameraman.tif');
% Convert to double for manipulation
image_double = im2double(image);
% Increase brightness
increased_brightness = image_double + 0.3; % Increase by 0.3 (on a scale of 0 to 1)
increased_brightness(increased_brightness > 1) = 1; % Ensure values stay within bounds

% Decrease brightness
decreased_brightness = image_double - 0.3; % Decrease by 0.3 (on a scale of 0 to 1)
decreased_brightness(decreased_brightness < 0) = 0; % Ensure values stay within bounds

% Display results
figure;
subplot(2, 3, 1);
imshow(image);
title('Original Image');
subplot(2, 3, 2);
imshow(increased_brightness);
title('Increased Brightness');
subplot(2, 3, 3);
imshow(decreased_brightness);
title('Decreased Brightness');
