% <pz> ЛР-07 Апроксимація 
% </pz>
% <inputdata> 
%X  = 350   630   996  1121  1251  1663  1998  2386
%Y  = 18  20  13   6  10  18  17  15
%для Інтерполяції XW  = 1803   583  1045  1570  1441  1058
%для Апроксимації XW2 = 1207   937  1463   856  1217  1058
%Порядок апроксимуючого поліному  d = 3
%</inputdata> 
% <answer>
%YW4 =11.9176   11.5708   11.4445   11.8123   11.8539   13.3253
%sYW4 =71.9244
%<answer>
clear;
%initial data
X= [350   630   996  1121  1251  1663  1998  2386];
Y= [18  20  13   6  10  18  17  15];
XW= [583  1045 1058 1441 1570 1803];
XW2=[856 937 1058 1207 1217 1463];

%Initial all values
d=3;
AA=zeros(d+1,d+1);
BB=zeros(d+1,1);
YW4=zeros(size(XW2));
XW100 = X(1):10:X(length(X));
YW5=zeros(size(XW100));
%function for coefficient
for iy=0:d     
    for ix=0:d  
        AA(iy+1, ix+1) = sum( X.^ix.*X.^(iy) ); %LHS
    end
    BB(iy+1, 1) = sum( Y.*X.^iy ); %RHS
end
%Massive of coefficients
aA=(AA^(-1))*BB; 

%Work points
for i=0:d
    YW4=YW4+aA(i+1)*XW2.^i;
    YW5=YW5+aA(i+1)*XW100.^i;
end
%output of YW4
YW4 
%Sum of YW1 from different types of interpolation
sYW1=sum(interp1(X, Y, XW, 'nearest'));
sYW2=sum(interp1(X, Y, XW, 'linear'));
sYW3=sum(interp1(X, Y, XW, 'spline'));
%output of sYW4
sYW4=sum(YW4)
%Y using different types of interpolation for our graphic
y_nearest=interp1(X,Y,XW100, 'nearest');
y_linear=interp1(X,Y,XW100, 'linear');
y_spline=interp1(X,Y,XW100, 'spline');
%Plotting
figure
plot(X,Y, 'm-*');
figure
plot(X,Y, 'm-*');
hold on
plot(XW100, y_nearest,  'b--');
hold on
plot(XW100, y_linear,  'k:');
hold on
plot(XW100, y_spline,  'r-.');
hold on
plot(XW100, YW5, "g-")
legend('standart','nearest','linear','spline', 'polyfit');
figure
plot(X,Y, 'm-*');
hold on
plot(XW100, YW5, "k-")
legend('standart', 'polyfit');