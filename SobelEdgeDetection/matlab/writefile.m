a = imread('coin.jpg');
a = rgb2gray(a);
b = a(:);
dlmwrite('input_image.txt',b); 