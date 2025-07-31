function plot_accscale_std(time, data, str)
figure("Name", str)
plot(time, data, "LineWidth", 2)
xlabel('Time[s]');
ylabel('AccelScale STD[ppm]');
grid("on");
legend('X', 'Y', 'Z');
set(gca, 'FontSize', 20)
end