function plot_acc(time, data, str)
% velocity
figure("Name", str)
plot(time, data, "LineWidth", 2);
title('Acceleration');
legend('North', 'East', 'Down');
xlabel('Time[s]');
ylabel('Acc[m/s^2]');
grid("on");
set(gca, 'FontSize', 20)
end