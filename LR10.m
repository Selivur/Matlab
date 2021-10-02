% <pz> ЛР-10 ЗДР
% </pz>
% <inputdata> 
%d a Tau y0= 1  101   68   48
% <answer>
%Y(end)= 59.9579
%min(Y)= 48
%max(Y)= 90.2733
%</answer>
clear;
xend = 12;
dx = 0.1;
main(xend, dx);
xend = 120;
dx = 1;
disp("--")
main(xend, dx);
%functions
function T = TimeRadian(x, Tau, a)
    koeff=( Tau + a )/365;
    for i=1:length(x)
        T(i)= 2*pi * ( x(i)/12 + koeff);
    end
end

function Y = Eylers(xend, x, dx,  a, y0, d, TimeRad)
    Y(1)=y0;
    for i=1:length(x)-1   
        Y(i+1)= Y(i) + dx * (0.01*((xend-x(i))/xend)*(a-Y(i))*(Y(i)-d)-15*0.01*(a-d)*(sin(TimeRad(i))*sin(d*TimeRad(i))));
    end
end

function M = main(xend, dx)
%input data
    d=1;
    a=101;
    Tau=68;
    y0=48;

    x0 = 0;

    x=x0:dx:xend;
    
    TimeRad=TimeRadian(x, Tau, a);
    Y=Eylers(xend, x, dx,  a, y0, d, TimeRad);
    %plotting
    figure;
    plot(x, Y);
    xlabel('Time')
    %show answers
    disp("Y(end)=")
    disp(Y(end))
     disp("min(Y)=")
    disp(min(Y))
     disp("max(Y)=")
    disp(max(Y))
    %Ending function
    M=0;
end

