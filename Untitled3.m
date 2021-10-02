clear;
X= [350 630 996 1121 1251 1663 1998 2386];
Y= [18 20 13 6 10 18 17 15];
XW2= [583  1045 1058 1441 1570 1803];
d = 3;


X100 = X(1):10:(length(X));
hold on;


%legend('nearest', 'linear', 'spline'); hold off;

L = zeros(d+1,d+1);
R = zeros(d+1,1);

for Yi=1:d+1

for Xi=1:d+1
    L(Yi,Xi) = sum( (X.^(Xi-1)) .* (X .^(Yi-1)) ) ;
end
    R(Yi,1) = sum( (Y) .* (X .^(Yi-1)) );
end
    poly = L^-1*R;

yw4 = zeros(size( X100 ));
YW4 = zeros(size( XW2 ));
for i=1:d+1
    yw4 = yw4 + poly (i) *X100.^(i-1);
    YW4 = YW4 + poly (i) *XW2.^(i-1);
end

separate = YW4
together = sum(YW4)

hold on;
plot ( X100, yw4,'k-');
legend("nearest", "linear", "spline", "aproximation");
hold off