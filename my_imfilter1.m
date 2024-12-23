function result=my_imfilter1(im1)
%im=im2double(imread('D:\数字图像处理\photo\flower.jpg'));
%im1=im2double(imnoise(im,'gaussian'));
%subplot(121);
%imshow(im1);
%title('高斯噪声图像');
%NoiseI=im+0.05*randn(size(im));
%subplot(122);imshow(NoiseI);title('随机噪声图像');

im1=im2double(im1);
w=15; sigma_s=6; sigma_r=0.1;
[X,Y]= meshgrid(-w:w,-w:w);
Gs=exp(-(X.^2 +Y.^2)/(2*sigma_s^2));

%[hm1,wn1]=size(im1);result_1=zeros(hm1,wn1);
hm1=size(im1,1);
wn1=size(im1,2);
result=zeros(hm1,wn1,3);
for k=1:3
    for i=1:hm1
        for j=1:wn1
            temp1=im1(max(i-w,1):min(i+w,hm1),max(j-w,1):min(j+w,wn1),k);
            Gr=exp(-(temp1-im1(i,j,k)).^2/(2*sigma_r^2));
            W=Gr.*Gs((max(i-w,1):min(i+w,hm1))-i+w+1,(max(j-w,1):min(j+w,wn1))-j+w+1);
            result(i,j,k)=sum(W(:).*temp1(:))/sum(W(:));
        end
    end
end
%figure;
%imshow(result_1);
%title('双边滤波图像')