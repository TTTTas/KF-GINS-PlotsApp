function plot_gyroscale_std(time, data, str)
figure("Name", str)
plot(time, data, "LineWidth", 2)
ylabel('GyroScale STD[ppm]');
xlabel('Time[s]');
grid("on");
legend('X', 'Y', 'Z');
set(gca, 'FontSize', 20)
end