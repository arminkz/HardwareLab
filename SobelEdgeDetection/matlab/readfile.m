ylength = 140;
xlength = 140;

txt = textread('output_image.txt');
output_image(1:ylength,1:xlength) = zeros;

cnt = 1;
for y=1:ylength-2
    for x=1:xlength-2
        output_image(x,y) = txt(cnt);
        cnt = cnt + 1;
    end
end

%imshow(uint8(output_image))
imwrite(uint8(output_image),'coin_sobel.jpg');


