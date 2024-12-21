function rotated_image = my_imrotate(Image, angle)  
  
% 计算图像中心点  
center = [size(Image, 2)/2, size(Image, 1)/2];  % 图像中心点坐标  
  
% 创建变换矩阵  
tform = affine2d([cosd(angle) -sind(angle) 0; sind(angle) cosd(angle) 0; center(1), center(2), 1]);  % 创建旋转矩阵，并确保它是围绕图像中心进行的  
  
% 进行图像旋转  
rotated_image = imwarp(Image, tform);  % 旋转图像  
  
end

%显示原始图像和旋转后的图像
%figure;
%subplot(1, 2, 1);
%imshow(Image);
%title('原始图像');
%subplot(1, 2, 2);
%imshow(rotated_image);
%title('旋转后的图像');