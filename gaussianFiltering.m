% Id: 160204008
%Name: Mayeesha Humaira
% Part:B Assignment on Filtering

%Step 1  take any image you wanttake any image you want
A=imread('coins.png');
figure;
imshow(A);


%Step 2  give the value of sigma as input
prompt = 'Enter the Sigma value:\n';
sigma = input(prompt);

%step 3
I = double(A);
%Design the Gaussian Kernel
%Window size 3*3 kernel as -1 to 1(-sz:sz)
sz = 1;
[x,y]=meshgrid(-sz:sz,-sz:sz);
M = size(x,1)-1;
N = size(y,1)-1;
Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel= exp(Exp_comp)/(2*pi*sigma*sigma);
%Initialize
Output=zeros(size(I));

%step 4 boundary issues must be handled properly in your code
%Pad the vector with zeros
I = padarray(I,[sz sz]);
%Convolution
for i = 1:size(I,1)-M
    for j =1:size(I,2)-N
        Temp = I(i:i+M,j:j+M).*Kernel;
        Output(i,j)=sum(Temp(:));
    end
end
%Image without Noise after Gaussian blur
Output = uint8(Output);
figure;
imshow(Output);