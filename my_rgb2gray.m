function Y=my_rgb2gray(p3)
p3=imread("flower.jpg");
R=p3(:,:,1);
G=p3(:,:,2);
B=p3(:,:,3);
Y=0.299*R+0.587*G+0.114*B;
% subplot(221),imshow(p3),title('原图');
% subplot(222),imshow(Y),title('灰度化后图');