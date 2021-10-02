clear;
X= [350 630 996 1121 1251 1663 1998 2386];
Y= [18 20 13 6 10 18 17 15];
%XW= [583  1045 1058 1441 1570 1803];
XW=[856 937 1058 1207 1217 1463];
d=3;
%Initial all values
AA=zeros(4,4);
BB=zeros(4,1);
XW100 = X(1):10:X(length(X));
YW3=zeros(size(XW100));
YW=zeros(size(XW));
%YW=0;
%YW=zeros(size(XW100) );
for iy=0:3
    for ix=0:3  
        AA(iy+1, ix+1) = sum( (X.^ix).*(X.^iy) ); %LHS
    end
    BB(iy+1, 1) = sum( Y.^ix.*X.^iy );%RHS
end
aA=(AA^(-1))*BB;
c1 = polyfit(X, Y, 3);
%Work points
for i=0:3
    %YW=YW+aA(i+1)*XW100.^i;
    %YW=YW+aA(i+1)*XW.^i;
    YW=YW+c1(d+1-i)*XW.^i;
end
YW
sYW=sum(YW)
figure
plot(X,Y, 'm-*')
hold on
plot(XW, YW, "r-")
legend('Standart','Polyfit');














