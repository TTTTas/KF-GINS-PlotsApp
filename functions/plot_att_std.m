function plot_att_std(time, data, str)
figure("Name", str)
plot(time, data, "LineWidth", 2)
xlabel('Time[s]');
ylabel('Att STD[deg]');
grid("on");
legend('X', 'Y', 'Z');
set(gca, 'FontSize', 20)
end