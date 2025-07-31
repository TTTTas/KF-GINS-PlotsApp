function plot_height(time, data, str)
% height
figure("Name", str)
plot(time, data, "LineWidth", 2);
title('Height');
xlabel('Time[s]');
ylabel('Height[m]');
grid("on");
set(gca, 'FontSize', 20)
end