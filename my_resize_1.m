function enlarged_image=my_resize_1(original_image,k)
%原始图形矩阵（3*3）
original_image = [125 214 67;62 95 108;133 96 109];
%image_path = 'D:\数字图像处理\photo\flower.jpg';
original_image = im2double(original_image);
%放大倍数
%k=2;
kx=k;
ky=k;

%计算放大后的图像大小
new_height = round(size(original_image,1) * ky);
new_width = round(size(original_image,2) * kx);

%初始化放大后的图像矩阵
enlarged_image = zeros(new_height,new_width,size(original_image, 3));
image = zeros(new_height,new_width,size(original_image, 3));
%计算插值
for k = 1:size(original_image, 3)
    for i = 1:new_height
        for j = 1:new_width
            %计算在原始图像中的坐标
            x = i / ky;
            y = j / kx;
       
       x=max(1,min(x,size(original_image,1)));
       y=max(1,min(y,size(original_image,2)));
       
       %找到相邻的四个像素点的坐标
       x1 = floor(x);
       x2 = min(x1+1,size(original_image,1));
       y1 = floor(y);
       y2 = min(y1+1,size(original_image,2));
       b=x-x1;
       a=y-y1;
       
    
       %计算权重
       %weight_x1y1 = (x2 - x) * (y2 - y);
       %weight_x1y2 = (x2 - x) * (y - y1);
       %weight_x2y1 = (x - x1) * (y2 - y);
       %weight_x2y2 = (x - x1) * (y - y1);
        
        % 双线性插值
       
       v0b = original_image(x1,y1,k)+b*(original_image(x1,y2,k)-original_image(x1,y1,k));
       v1b = original_image(x2,y1,k)+b*(original_image(x2,y2,k)-original_image(x2,y1,k));
       vab = v0b+a*(v1b-v0b);
       
       
       %将插值结果放入放大后的图形矩阵中
       enlarged_image(i,j,k) = vab;
       
        end
    end
end

%显示放大后的图像
%figure;
%subplot(121);
%imshow(original_image,[]);
%title("原图");
%subplot(122);
%imshow(enlarged_image,[]);
%title("放大后图片");