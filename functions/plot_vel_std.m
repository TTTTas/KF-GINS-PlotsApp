function plot_vel_std(time, data, str)
figure("Name", str)
plot(time, data, "LineWidth", 2)
xlabel('Time[s]');
ylabel('Vel STD[m/s]');
grid("on");
legend('North', 'East', 'Down');
set(gca, 'FontSize', 20)
end