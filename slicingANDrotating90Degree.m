I1=imread('p1.jpg');
I2=imread('p2.jpg');
I1 = imresize(I1, [512 512]);
figure; imshow(I1);
I2 = imresize(I2, [512 512]);
figure; imshow(I2);


[row,col,ch]=size(I2);
divImg = uint8(zeros(row, col, ch));
part=row/6;


for i = 1:ch
    for j=0:2:4
         divImg(j*part:(j+1)*part,:,i) = I1(j*part:(j+1)*part,:,i);
    end
    for j=1:2:5
         divImg(j*part:(j+1)*part,:,i)=I2(j*part:(j+1)*part,:,i);
    end  
end

figure; imshow(divImg);
[x, y, z] = size(divImg); 
img = uint8(zeros(x, y, z));
for color = 1 : z 
    for i = 1 : x  
        for j = 1 : y 
      
              img(j,i,color) = divImg(i,j,color);
                 
         end
    end
end
   
    
figure;imshow(img);
