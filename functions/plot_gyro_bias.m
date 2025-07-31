function plot_gyro_bias(time, data, str)
figure("Name", str);
plot(time, data, "LineWidth", 2)
xlabel('Time[s]');
ylabel('GyroBias[deg/h]');
grid("on");
legend('X', 'Y', 'Z');
set(gca, 'FontSize', 20)
end