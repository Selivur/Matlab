clear;
X= [350 630 996 1121 1251 1663 1998 2386];
Y= [18 20 13 6 10 18 17 15];
XW2=[583  1045 1058 1441 1570 1803];
%XW2=[856 937 1058 1207 12017 1463];
%Initial all values
d=3;
AA=zeros(d+1,d+1);
BB=zeros(d+1,1);
YW4=zeros(size(XW2));
XW100 = X(1):10:X(length(X));
YW5=zeros(size(XW100));

for iy=0:d
    for ix=0:d  
        AA(iy+1, ix+1) = sum( X.^ix.*X.^(iy) ); %LHS
    end
    BB(iy+1, 1) = sum( Y.*X.^iy ); %RHS
end

aA=(AA^(-1))*BB;

%Work points
for i=0:d
    YW4=YW4+aA(i+1)*XW2.^i;
    YW5=YW5+aA(i+1)*XW100.^i;
end
YW4
sYW=sum(YW4)
%Plotting
plot(X,Y, 'r-*')
hold on
plot(XW100, YW5, "b-")
legend('Standart','Polyfit');