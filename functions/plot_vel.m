function plot_vel(time, data, str)
% velocity
figure("Name", str)
plot(time, data, "LineWidth", 2);
title('Velocity');
legend('North', 'East', 'Down');
xlabel('Time[s]');
ylabel('Vel[m/s]');
grid("on");
set(gca, 'FontSize', 20)
end