clear;
X= [350   630   996  1121  1251  1663  1998  2386];
Y= [18  20  13   6  10  18  17  15];
XW= [583  1045 1058 1441 1570 1803];

AA=zeros(6,6);

YW=0;
for iy=1:6
    for ix=1:6  
        AA(iy, ix) = sum( (X.^(ix-1)).*(X.^(iy-1)) ); %LHS
    end
    BB(iy, 1) = sum( Y.^(ix-1).*X.^(iy-1) ); %RHS
end


aA=(AA')*BB;
%Work points
BB=zeros(6,1);
for i=1:6
    YW=YW+aA(i)*XW.^(i-1);
end
YW
figure
plot(X,Y, 'm-*')
sYW=sum(YW)
plot(XW, YW, "b-")
