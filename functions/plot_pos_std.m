function plot_pos_std(time, data, str)
figure("Name", str)
plot(time, data, "LineWidth", 2)
xlabel('Time[s]');
ylabel('Pos STD[m]');
legend('North', 'East', 'Down');
grid("on");
set(gca, 'FontSize', 20)
end