function compare_result(time, pva_time, data, gins, str, ylabels)
% ---------- 1. 找共同时间段 ----------
t_start = max(time(1), pva_time(1));
t_end   = min(time(end), pva_time(end));

% 截取 res 部分
idx_res = (time >= t_start & time <= t_end);
time = time(idx_res);
data = data(idx_res, :);

% 截取 pva 部分
idx_pva = (pva_time >= t_start & pva_time <= t_end);
pva_time = pva_time(idx_pva);
gins = gins(idx_pva, :);


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