function NewImage=my_histeq(Image)
%统计图像直方图
Image=rgb2gray(Image);
histgram = imhist(Image);
[h w] = size(Image);
NewImage = zeros(h,w);
s = zeros(256);s(1)=histgram(1);
%计算新的灰度值
for t=2:256
    s(t)=s(t-1)+histgram(t);
end
for x=1:w
    for y=1:h
        NewImage(y,x)=s(Image(y,x)+1)/(w*h);  %%
    end
end
%imshow(Image);title('灰度图像');
%figure;imhist(Image);title('灰度图像直方图');
%axis tight;
%imshow(NewImage);%title('直方图均衡化处理后图像');
%figure;imhist(NewImage);title('直方图均衡化处理后图像的直方图');
%axis tight;