echo on;
diary diary.txt;

IMG = readjpg('Sign.jpg');
size(IMG);
x=3024; y=4032;
r=zeros(x,y); g=zeros(x,y); b=zeros(x,y);
r=IMG(:,:,1); g=IMG(:,:,2); b=IMG(:,:,3);
Y=r*.299+g*.587+b*.144;
dispimg(Y);

diary off;
