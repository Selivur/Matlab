% <pz> ЛР-08 Похідна
% </pz>
% <inputdata> 
%T = 0   9  18  27  36  45  54  63  72  81  90
%H = 610.35156      3084.2041      3647.7356      3484.7473       3225.177      3098.0225      3084.2041      3069.5251      2997.5281      3022.4548      3662.1094
%</inputdata> 
% <answer>
%maxV1 =274.8725
%maxV2 =168.7436
%maxA2 =7.5892
%minV1 =-28.8411
%minV2 =-23.4755
%minA2 =-23.5842
%</answer>
clear;
%input data
T = [0   9  18  27  36  45  54  63  72  81  90];
H = [610.35156      3084.2041      3647.7356      3484.7473       3225.177      3098.0225      3084.2041      3069.5251      2997.5281      3022.4548      3662.1094];
%for graphic
Time1 = [0   9  18  27  36  45  54  63  72  81];
Time2 = [9  18  27  36  45  54  63  72  81];
%step
h=T(2)-T(1);
%verticals and Accelerations
V1 = vertical1(H, h, T);
V2 = vertical2(H,h, T);
A2 = acceleration(H, h, T);
%Output data
maxV1=max(V1)
maxV2=max(V2)
maxA2=max(A2)
minV1=min(V1)
minV2=min(V2)
minA2=min(A2)
%plotting
figure;
plot(T, H);
figure;
plot(Time1, V1, "r-*");
hold on
plot(Time2, V2, "g-o");
hold on
plot(Time2, A2, "b-");
legend('Vertical V1', 'Vertical V2', 'Аcceleration');

function Vertical1 = vertical1(H, h,T)
    for x=1:length(T)-1
        Vertical1(x)=(H(x+1)-H(x))/h;
    end
end

function Vertical2 = vertical2(H, h, T)
    for x=2:length(T)-1
        Vertical2(x-1)=(H(x+1)-H(x-1))/(2*h);
    end
end

function Acceleration = acceleration(H, h, T)
    for x=2:length(T)-1
        Acceleration(x-1)=1/(h*h)*(H(x+1)-2*H(x)+H(x-1));
    end
end