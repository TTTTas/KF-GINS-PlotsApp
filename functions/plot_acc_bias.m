function plot_acc_bias(time, data, str)
figure("Name", str);
plot(time, data, "LineWidth", 2)
xlabel('Time[s]');
ylabel('AccelBias[mGal]');
grid("on");
legend('X', 'Y', 'Z');
set(gca, 'FontSize', 20)
end