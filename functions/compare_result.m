function compare_result(time, pva_time, data, gins, str, ylabels)
figure("Name", str)
sub1 = subplot(3, 1, 1);
plot(time, data(:, 1), "LineWidth", 2);
hold on
plot(pva_time, gins(:, 1), "LineWidth", 2)
legend('KF-GINS', 'GINS');
ylabel(ylabels(1));
grid("on");
set(gca, 'FontSize', 20)
legend('KF-GINS', 'GINS');

sub2 = subplot(3, 1, 2);
plot(time, data(:, 2), "LineWidth", 2);
hold on
plot(pva_time, gins(:, 2), "LineWidth", 2)
legend('KF-GINS', 'GINS');
ylabel(ylabels(2));
grid("on");
set(gca, 'FontSize', 20)

sub3 = subplot(3, 1, 3);
plot(time, data(:, 3), "LineWidth", 2);
hold on
plot(pva_time, gins(:, 3), "LineWidth", 2)
legend('KF-GINS', 'GINS');
xlabel('Time[s]');
ylabel(ylabels(3));
grid("on");
set(gca, 'FontSize', 20)

linkaxes([sub1, sub2, sub3], 'x');
end