clear;
X= [350   630   996  1121  1251  1663  1998  2386];
Y= [18  20  13   6  10  18  17  15];
XW= [583  1045 1058 1441 1570 1803];

YW1=interp1(X, Y, XW, 'nearest');
YW2=interp1(X, Y, XW, 'linear');
YW3=interp1(X, Y, XW, 'spline'); 
sYW1=sum(YW1)
sYW2=sum(YW2)
sYW3=sum(YW3)

t=[583  1045 1058 1441 1570 1803];

xi = [X(1):10:X(length(X))];


yin=interp1(X,Y,xi, 'nearest');

yil=interp1(X,Y,xi, 'linear');

yis=interp1(X,Y,xi, 'spline');

figure
plot(X,Y, 'm-*');
hold on
plot(xi, yin,  'b--');
hold on
plot(xi, yil,  'k:');
hold on
plot(xi, yis,  'r-.');
hold on
legend('Stand','nearest','linear','spline');
