% <pz> ЛР-11 Повороти системи координат
% </pz>
% <inputdata> 
%d a Tau y0= 1  101  240   48
% <answer>
%Max=70.778
%Min=48
%Tau=130
%</answer>
clear;
main();

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

function For_min_mass = for_min_mass(xend, x, dx,  a, y0, d)
    for Tau=0:240 
        For_min_mass(Tau+1)=min(Eylers(xend, x, dx,  a, y0, d, TimeRadian(x, Tau, a)));
    end
end
function For_max_mass = for_max_mass(xend, x, dx,  a, y0, d)
    for Tau=0:240
        mass=Eylers(xend, x, dx,  a, y0, d, TimeRadian(x, Tau, a));
        For_max_mass(Tau+1)=mass(end);
    end
end

function M = main()
%input data
    xend = 12;
    dx = 0.1;
    d=1;
    a=101;
    y0=48;
    x0 = 0;

    x=x0:dx:xend;
    %Using our functions    
    max_part_Y = for_max_mass(xend, x, dx,  a, y0, d);
    max_mass_Y=max(max_part_Y);
    min_part_Y=for_min_mass(xend, x, dx,  a, y0, d);
    min_mass_Y = min(min_part_Y);
    optimal_T=find(max_part_Y == max_mass_Y)-1;
    %-1 because in Matlab massives starts from 1, but our Tau starts from 0
    disp("Max="+max_mass_Y);
    disp("Min="+min_mass_Y);
    disp("Tau="+optimal_T);
    %plotting
    figure()
    T = 0:240;
    plot(T, min_part_Y, 'r')
    hold on
    plot(T, max_part_Y, 'g')
    hold on
    line([optimal_T, optimal_T], [min_mass_Y max_mass_Y]);
    grid on
    xlabel('Tau, days')
    hold off
end

