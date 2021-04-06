% Name: Mayeesha Humaira
% ID: 160204008

%Step 1 Display in put image
img =imread('input.png');
figure;
subplot(2,4,1);
imshow(img);
title('input image');
img=rgb2gray(img);
img=im2double(img);

%Step 2 Apply Laplacian Filter in image Apply Laplacian Filter in image 
S=padarray(img,[1 1],0);
f1 = [0 1 0; 1 -4 1; 0 1 0];
I1 = S;
[row, col] = size(S);
for i = 1:row-2
   for j = 1:col-2 
      N = S(i:i+2, j:j+2);
      t1 = sum(sum(N.*f1));
      I1(i+1,j+1) = t1;
    end
end
lap=I1(2:row-1,2:col-1);
subplot(2,4,2);
imshow(lap,[min(lap(:)) max(lap(:))]);
title('Laplacian filter');

%Step 3 Do necessary Operations to get the Laplacian Enhanced
enLap1=S-I1;
enLap2=S;
for i = 2:row-1
   for j = 2:col-1 
      enLap2(i,j) = enLap1(i,j);
    end
end
subplot(2,4,3);
imshow(enLap2);
title('Laplacian Enhanced');

%Step 4 Apply Sobel Filter on input Image 
f1 = [-1 0 1; -2 0 2; -1 0 1];
f2 = [-1 -2 -1; 0 0 0; 1 2 1];
I1 = S;
I2 = S;
[row, col] = size(S);

for i = 1:row-2
   for j = 1:col-2 
      N = S(i:i+2, j:j+2);
      t1 = sum(sum(N.*f1));
      t2 = sum(sum(N.*f2));
      I1(i+1,j+1) = t1;
      I2(i+1,j+1) = t2;
    end
end

sobel=sqrt((I1.^2)+(I2.^2));
sobel=sobel(2:row-1,2:col-1);
[row1,col1]=size(sobel);
for i = 1:row1
   for j = 1:col1 
      if sobel(i,j)<0.1
          sobel(i,j)=0;
   
      end
   end
end
subplot(2,4,4);
imshow(sobel);
title('Sobel Filter');

%Step 5 Apply 5*5 average filter on sobel image
q=[1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25];
S=padarray(sobel,[2 2],0);
avgSobel = S;
for i = 1:row-4
    for j = 1:col-4  
        N = S(i:i+4, j:j+4);
        t1 = sum(sum(N.*q));
        avgSobel(i+2,j+2) = t1;    
    end
end
[row1, col1] = size(avgSobel);
avgSobel=avgSobel(3:row1-2,3:col1-2);
subplot(2,4,5);
imshow(avgSobel);
title('5*5 average filter');

%Step 6 Get the product of Laplacian Enhanced and 5*5 average filter on
%shobel
f=enLap.*avgSobel;
subplot(2,4,6);
imshow(f);
title('enLap*avgSobel');

%Step 7 Add input image and output image of step 6
g=img+f;
subplot(2,4,7);
imshow(g);
title('step1+step6');

%Step 8 Apply Power Law Transform
c=1;
gamma=0.5;
h=c*(g.^gamma);
subplot(2,4,8);
imshow(h);
title('Power Law Transform');
