% Assignment4:
% Task---> read a color image and display its reddish,greenisg and bluish image

% reading orignal image
org = imread('a.png');
imshow(org);
pause(3);

r = org;
g = org;
b = org;

% R
r(:,:,2) = 0;
r(:,:,3) = 0;
imshow(r);
pause(3);

% G
g(:,:,1) = 0;
g(:,:,3) = 0;
imshow(g);
pause(3);

% B
b(:,:,1) = 0;
b(:,:,2) = 0;
imshow(b);
pause(3);