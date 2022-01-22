% Assignment1:
% Task1-->Read a color image and convert it into gray scale image without using inbulit function(i.e do it by average method(R+G+B)/3)).
% Task2-->Convert the pixel of gray scale image to either 1 or 0.
% Task3-->Add gray image and image with pixels either 1 or 0 and add 20 to gray scale image.
% Performe the task and display the output images. 

% reading orignal image
org = imread('a.png');
imshow(org);
pause(3);

% original to grayscale
% gr1 = rgb2gray(org);
% imshow(gr1);
% pause(3);
gr2 = (org(:,:,1)/3 + org(:,:,2)/3 + org(:,:,3)/3);
imshow(gr2);
pause(3);

% converting into binary image
s = size(gr2);

for i = 1:s(1)
    for j = 1:s(2)
        if gr2(i,j) >= 127
            b(i,j) = 1;
        else
            b(i,j) = 0;
        end
        
    end
end

imshow(b);
pause(3);

% RGB + binary

rb1 = org + uint8(b);
imshow(rb1);
pause(3);

% RGB + 20

rb2 = org + uint8(20);
imshow(rb2);
pause(3);

