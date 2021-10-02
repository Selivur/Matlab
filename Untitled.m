clear;

X=100;
dX = [0.0009, 0.009, 0.09, 0.9];

f1 = @(x) x.^4 +80*x.^3 +2246*x.^2 +24880*x +77625;
syms t;
Diff1=diff( t^4 +80*t^3 +2246*t^2 +24880*t +77625)*dX(1)
Diff2=diff( t^4 +80*t^3 +2246*t^2 +24880*t +77625)*dX(2)
Diff3=diff( t^4 +80*t^3 +2246*t^2 +24880*t +77625)*dX(3)
Diff4=diff( t^4 +80*t^3 +2246*t^2 +24880*t +77625)*dX(4)
t=100;

solve0=f1(100);
solve1_1=f1(100+dX(1));
solve1_2=f1(100+dX(2));
solve1_3=f1(100+dX(3));
solve1_4=f1(100+dX(4));

ab1=abs(solve0-solve1_1);
ab2=abs(solve0-solve1_2);
ab3=abs(solve0-solve1_3);
ab4=abs(solve0-solve1_4);

Result1=eval(Diff1);
Result2=eval(Diff2);
Result3=eval(Diff3);
Result4=eval(Diff4);

rel1=solve1_1/solve0;
rel2=solve1_2/solve0;
rel3=solve1_3/solve0;
rel4=solve1_4/solve0;

mas = 0:0.01:5;
func=(abs( f1(100)-f1(100+mas) ) );
figure(1); plot(mas, func);
