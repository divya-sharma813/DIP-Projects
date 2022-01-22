% Assignment2:
% Task-->Read a color image,convert the color image to gray scale and dispaly both images.
% Make some part of that gray scale image total black and display it.
% Now subtract this to gray image and display output image.

% reading orignal image
org = imread('a.png');
imshow(org);
pause(3);

% original to grayscale
% gr1 = rgb2gray(org);
% imshow(gr1);
% pause(3);
gr1 = (org(:,:,1)/3 + org(:,:,2)/3 + org(:,:,3)/3);
imshow(gr1);
pause(3);

% making center of image black

gr2 = gr1;
s = size(gr2);

for i = int16(3*s(1)/10):int16(7*s(1)/10)
    for j = int16(3*s(2)/10):int16(7*s(2)/10)
        gr2(i,j) = 0;        
    end
end

imshow(gr2);
pause(3);

% gr1 - gr2
gr3 = gr1 - gr2;
imshow(gr3);
pause(3);