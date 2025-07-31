function plot_gyrobias_std(time, data, str)
figure("Name", str)
plot(time, data, "LineWidth", 2)
ylabel('GyroBias STD[deg/h]');
xlabel('Time[s]');
grid("on");
legend('X', 'Y', 'Z');
set(gca, 'FontSize', 20)
end