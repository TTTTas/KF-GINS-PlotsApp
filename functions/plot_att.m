function plot_att(time, data, str)
% attitude
figure("Name", str)
plot(time, data, "LineWidth", 2);
title('Attitude');
legend('Roll', 'Pitch', 'Yaw');
xlabel('Time[s]');
ylabel('Att[deg]');
grid("on");
set(gca, 'FontSize', 20)
end