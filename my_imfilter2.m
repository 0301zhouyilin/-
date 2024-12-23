function g=my_imfilter2(Image)
%Image=imread("flower.jpg");
Image=rgb2gray(Image);
FImage=fftshift(fft2(double(Image)));
[N,M]=size(FImage);
g=zeros(N,M);
r1=floor(M/2);
r2=floor(N/2);
d0=30;
n=2;

   for x=1:M
      for y=1:N
         d=sqrt((x-r1)^2+(y-r2)^2);
         h=1/(1+(d/d0)^(2*n));
         g(y,x)=h*FImage(y,x);
      end
   end
   g=ifftshift(g);
   g=uint8(real(ifft2(g)));
   %imshow(uint8(g));
end