function [NewImage1,NewImage2]=my_enhance_2(Image)
%非线性灰度变换-对数变换和指数变换
%Image=(rgb2gray(imread('D:\数字图像处理\photo\flower.jpg')));
Image=rgb2gray(Image);
Image=double(Image);
NewImage1=46*log(Image+1);   %对数函数
NewImage2=185*exp(0.325*(Image-255)/30)+1;  %指数函数

% imshow(Image,[]);title('原图灰度图像');
% figure；imshow(NewImage1,[]);%title('对数变换');
%imshow(NewImage2,[]);%title('指数变换');
