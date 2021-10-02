% <pz> ЛР-09 Інтеграл
% </pz>
% <inputdata> 
%Масив значень часу  T[sec] = 
%0    480    960   1440   1920   2400   2880   3360   3840   4320   4800   5280   5760   6240   6720   7200   7680   8160   8640   9120   9600  10080
%Масив значень потужності  P[joule] = 
%0.1998       1.0169       3.8599       7.7875      10.4876      16.4015      16.8195       9.9069        4.317       5.9598       6.0567       4.2083       3.5414        4.505       3.3083       0.5284      -1.2055      -1.7914      -1.9481      -1.9873      -1.9969      -1.9992
% <answer>
%ELeft = 4.3188e+04
%ERight = 4.2133e+04
%ETrap = 4.2660e+04
%ESimp = 4.3971e+04
%</answer>
clear;
%input data
T = [0    480    960   1440   1920   2400   2880   3360   3840   4320   4800   5280   5760   6240   6720   7200   7680   8160   8640   9120   9600  10080];
P = [0.1998       1.0169       3.8599       7.7875      10.4876      16.4015      16.8195       9.9069        4.317       5.9598       6.0567       4.2083       3.5414        4.505       3.3083       0.5284      -1.2055      -1.7914      -1.9481      -1.9873      -1.9969      -1.9992];
h=T(2)-T(1);
Left=left(P, h, T);
Right=right(P, h, T);
Trap=trap(P, h, T);
Simp=simp(P, h, T);
%plotting
figure;
plot(T, P);
ylabel('Power')
xlabel('Time')
figure;
plot(T,Left, 'r');
hold on;
plot(T,Right, 'g');
hold on;
plot(T,Trap, 'b');
hold on;
plot(T(1:2:end),Simp, 'k');
legend('Left', 'Right', 'Trapetsia', 'Simpson') 
xlabel('Time')
ylabel('Energy')
%show answers
ELeft=Left(end)
ERight=Right(end)
ETrap=Trap(end)
ESimp=Simp(end)
%functions
function E = left(P, h, T)
    for x=1:length(T)
        E(x)= h * sum(P(1:x-1));
    end
end

function E = right(P, h, T)
    for x=1:length(T)
        E(x)=h * sum(P(2:x));
    end
end

function E = trap(P, h, T)
    for x=1:length(T)
        E(x)=h / 2 * (P(1) + P(x) + 2 * sum(P(2:x-1)));
    end
end

function E = simp(P, h, T)
    i=0;
    for x=1:2:length(T)
            i=i+1;
            E(i) = h / 3 * (P(1) + P(end) + 4 * sum(P(2:2:x-1)) + 2 * sum(P(3:2:x-2)));
    end
end
