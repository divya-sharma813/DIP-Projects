% Assignment3:
% Task: Create two images one with a white circle at center and another with a white rectangle at center and 
% performe all logical gate operations on both images and display the output images.

% creating image with rectangle in center
rec = zeros(1001);
s = size(rec);

for i = int16(3*s(1)/10):int16(7*s(1)/10)
    for j = int16(2*s(2)/10):int16(8*s(2)/10)
        rec(i,j) = 1;        
    end
end

imshow(rec);
pause(3);

% creating image with circle in center
%define radius and center coordinates
r=250;x_c=0;y_c=0;

[y,x]=ndgrid(-500:500,-500:500);

cir = (x-x_c).^2+(y-y_c).^2 <= r^2;

imshow(cir);
pause(3);

% AND 
and = rec & cir;
imshow(and);
pause(3);

% OR 
or = rec | cir;
imshow(or);
pause(3);

% XOR 
x_o_r =  xor(rec, cir);
imshow(x_o_r);
pause(3);

% NAND 
nand = ~(rec & cir);
imshow(nand);
pause(3);

% NOR 
nor = ~(rec | cir);
imshow(nor);
pause(3);

% NXOR 
nx_o_r =  ~xor(rec, cir);
imshow(nx_o_r);
pause(3);