function [edgeImage,BW]=my_roberts(Image)
Image=im2double(rgb2gray(Image));
BW=edge(Image,'roberts');
H1=[1 0;0 -1];H2=[0 1;-1 0];
R1=imfilter(Image,H1);R2=imfilter(Image,H2);
edgeImage=abs(R1)+abs(R2);