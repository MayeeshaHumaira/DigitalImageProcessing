% Id: 160204008
%Name: Mayeesha Humaira
% Part:A Assignment on Morphology

img=[0 0 0 0 0 0 0;0 0 0 0 0 0 0;0 0 1 0 1 0 0;0 0 1 0 1 0 0;0 0 1 1 1 0 0;0 0 0 0 0 0 0;0 0 0 0 0 0 0];
figure;
subplot(1,2,1);
imshow(img);
title('Given image');

[row, col]=size(img);
out=zeros(row, col);

%A 3*3 Disc Structuring Element is needed for Part A
filter=[0 1 0; 1 1 1; 0 1 0];
%Dilation
for i=2:row-1
    for j=2:col-1
        w=[img(i-1,j)*filter(2) img(i,j-1)*filter(4) img(i,j)*filter(5) img(i,j+1)*filter(6) img(i+1,j)*filter(8)];
        out(i,j)=max(w);
    end
end
subplot(1,2,2);
imshow(out-img, [0,1]);
title('Output Image');