x=[-1,-1,0,0,0,0,2,3,3,1];
h=[1,2,1,2,1,0,-1];
y=conv(x,h);
openFile = fopen('HW1','w');
fprintf(openFile,'%d ',y);