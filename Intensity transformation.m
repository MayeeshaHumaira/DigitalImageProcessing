%1. Take your RGB photo
imgB = imread('peppers_color.jpg');
img = imresize(imgB, [512 512]);

figure;
imshow(img);

%2. Make it a grayscale image, say I
I = rgb2gray(img);
figure;
imshow(I);
figure;


%3. Calculate and plot histogram of image I
[row,col]=size(I);
X = zeros(1,256);

for i=1:row
    for j =1:col
        temp = img(i,j)+1;
        X(temp)=X(temp)+1;
    end
end
bar(X);
title('Gray scale image Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');

%4. Apply Negation Transformation on I
N = uint8(zeros(row,col));
for i = 1:row
    for j = 1:col
        N(i,j) = 255 -I(i,j);
    end
end

figure;
imshow(N);
figure;


%5. Calculate and plot histogram of the negative image
[row,col]=size(N);
NX = zeros(1,256);

for i=1:row
    for j =1:col
        temp = N(i,j)+1;
        NX(temp)=NX(temp)+1;
    end
end
bar(NX);
title('Negative transformation Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');


%6. Take a threshold value input from user, say A = 127
prompt = 'What is the value of A?\n ';
A = input(prompt);

%7. Increase brightness by 50% for pixels with intensity greater than A; else decrease it by 25% of image I
B = uint8(zeros(row,col));
for i = 1:row
    for j = 1:col
        if I(i,j)>A
            temp = I(i,j);
            B(i,j)=temp +((temp / 100 ) * 50);
        else
            temp = I(i,j);
            B(i,j)=temp -((temp / 100 ) * 25);
        end
    end
end

figure;
imshow(B);
figure;

%8. Calculate and plot histogram of the thresholded image
[row,col]=size(B);
TH = zeros(1,256);

for i=1:row
    for j =1:col
        temp = B(i,j)+1;
        TH(temp)=TH(temp)+1;
    end
end
bar(TH);
title('Varying intensity of pixel Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');

%9. Apply Log Transformation on image I with c = 1.5
I2=im2double(I);
[row,col]=size(I2);
L=zeros(row,col);
c=1.5;
for i=1:row
    for j=1:col
        L(i,j)=c*log(I2(i,j)+1);
    end
end
figure;
imshow(L);
figure;

%10. Calculate and plot histogram of the log transformed image
[row,col]=size(L);
LOG = zeros(1,256);

L2 = uint8(L);
for i=1:row
    for j =1:col
        temp = L2(i,j)+1;
        LOG(temp)=LOG(temp)+1;
    end
end
bar(LOG);
title('Log transformed Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');


%11. Take gamma value input from user, say Y = 0.6
prompt = 'What is the value of Y?\n ';
Y = input(prompt);

%12. Apply Power Law Transformation on image I with c = 1.5
I3=im2double(I);
[row,col]=size(I3);
PL=zeros(row,col);
c=1.5;
for i=1:row
    for j=1:col
        PL(i,j)=c*(I3(i,j).^Y);
    end
end
figure;
imshow(PL);
figure;

%13. Calculate and plot histogram of the Power Law transformed image.
[row,col]=size(PL);
PLT = zeros(1,256);

PL2 = uint8(PL);
for i=1:row
    for j =1:col
        temp = PL2(i,j)+1;
        PLT(temp)=PLT(temp)+1;
    end
end
bar(PLT);
title('Power Law transformed Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');


%14. Understand the histograms, differences, their indications
figure;
subplot(5,2,1);
imshow(I);
subplot(5,2,3);
imshow(N);
subplot(5,2,5);
imshow(B);
subplot(5,2,7);
imshow(L);
subplot(5,2,9);
imshow(PL);


subplot(5,2,2);
bar(X);
title('Gray scale image Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');


subplot(5,2,4);
bar(NX);
title('Negative transformation Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');

subplot(5,2,6);
bar(TH);
title('Varying intensity of pixel Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');

subplot(5,2,8);
bar(LOG);
title('Log transformed Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');

subplot(5,2,10);
bar(PLT);
title('Power Law transformed Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');


