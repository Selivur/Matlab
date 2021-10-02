T=[0    480    960   1440   1920   2400   2880   3360   3840   4320   4800   5280   5760   6240   6720   7200   7680   8160   8640   9120   9600  10080];
P=[0.1042       0.6117       2.6441       5.5888       7.7938      12.3503      12.6893       8.7763       4.6888       6.0596        5.833       4.2059       3.6882       2.8322      -0.0232       -2.215      -2.8473      -2.9725      -2.9951      -2.9992      -2.9999           -3];
h = (T(22) - T(1)) / 22;

figure (1)
plot(T,P)
grid on
ylabel('P = Power')
xlabel('T = Time')

for i = 1:22;
  E1(i) = h * sum(P(1:i-1));
end
for i = 1:22;
  E2(i) = h * sum(P(2:i));
end
for i = 1:22;
  E3(i) = h / 2 * (P(1) + P(i) + 2 * sum(P(2:i-1)));
end
for i = 1:22;
  if mod(i, 2) == 1
    E4(i) = (h / 3) * (P(1) + P(end) + 4 * sum(P(2:2:i-1)) + 2 * sum(P(3:2:i-2)));
  end
end
figure (2)
grafik = plot(T,E1); hold on;
plot(T,E2);
plot(T,E3);
plot(T(1:2:end),E4(1:2:end));
hold off;

grid on
legend('Left rectangle', 'Right rectangle', 'trap etsia', 'Simpson')
xlabel('T = Time')
ylabel('J = Energy')