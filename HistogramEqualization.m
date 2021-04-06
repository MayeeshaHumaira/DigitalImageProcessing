I = imread('cameraman.png');
[row, col] = size(I);
mul=row*col;
M = 2^8 -1;

X = zeros(1,256);
for i=1:row
    for j =1:col
        temp = I(i,j)+1;
        X(temp)=X(temp)+1;
    end
end

PDF = X/(256*256);
CDF = zeros(size(PDF));
CDF(1) = PDF(1);
for i  = 2 : 256
    CDF(i) = CDF(i-1) +PDF(i);
end

sk =zeros(1,256);
for i =1:256
    sk(i) = 255*CDF(i);
end


new_sk =round(sk);
img_new = uint8(zeros(row,col));
for i =1:row
    for j =1:col
        temp= I(i,j)+1;
        img_new(i,j) = new_sk(temp);
    end
end

figure;
subplot(2,2,1);
imshow(I);
subplot(2,2,3);
imshow(img_new);


subplot(2,2,2);
bar(X);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');


subplot(2,2,4);
bar(img_new);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');