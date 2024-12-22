function edgeImage=my_laplacian(Image)
Image=im2double(rgb2gray(Image));
%BW=edge(Image,'laplacian');
H1=fspecial('laplacian',0);
R1=imfilter(Image,H1);
edgeImage=abs(R1);