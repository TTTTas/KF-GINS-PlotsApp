function plot_acc_scale(time, data, str)
figure("Name", str)
plot(time, data, "LineWidth", 2);
xlabel('Time[s]');
ylabel('AccelScale[ppm]');
grid("on");
legend('X', 'Y', 'Z');
set(gca, 'FontSize', 20)
end