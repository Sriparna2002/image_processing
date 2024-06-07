% Read a sample grayscale image
image = imread('cameraman.tif');
% Reduce the number of gray levels
gray_levels = [128, 64, 32, 16, 8];
% Prepare a figure
figure;
subplot(2, 3, 1);
imshow(image);
title('Original Image');
for i = 1:length(gray_levels)
    % Reduce gray levels
    reduced_image = round(image / (256/gray_levels(i))) * (256/gray_levels(i));
    % Display the reduced image
    subplot(2, 3, i + 1);
    imshow(reduced_image, []);
    title([num2str(gray_levels(i)) ' Gray Levels']);
end
