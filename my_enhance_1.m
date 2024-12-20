function NewImage=my_enhance_1(Image)
%图像对比度增强--分段线性变换
Image=im2double(rgb2gray(imread('D:\数字图像处理\photo\flower.jpg')));
Image=im2double(rgb2gray(Image));
[h,w]=size(Image);
imshow(Image);title('原始图像');
NewImage=zeros(h,w);
a=30/256; b=100/256; c=75/256; d=200/256;  %参数设置------------------
for x=1:w
   for y=1:h
      if Image(y,x)<a
          NewImage(y,x)=Image(y,x)*c/a;
      elseif Image(y,x)<b
          NewImage(y,x)=(Image(y,x)-a)*(d-c)/(b-a)+c;
      else 
           NewImage(y,x)=(Image(y,x)-b)*(1-d)/(1-b)+d;
      end
   end
end

figure;
imshow(NewImage);%title('分段线性灰度级变换图像');