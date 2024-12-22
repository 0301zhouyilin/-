function [edgeImage,BW]=my_prewitt(Image)
Image=im2double(rgb2gray(Image));
BW=edge(Image,'prewitt');
H1=[-1 -1 -1;0 0 0;1 1 1];H2=[-1 0 1;-1 0 1;-1 0 1];
R1=imfilter(Image,H1);R2=imfilter(Image,H2);
edgeImage=abs(R1)+abs(R2);