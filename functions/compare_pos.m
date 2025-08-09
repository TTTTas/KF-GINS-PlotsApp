function compare_pos(time, pva_time, res_blh, pva_blh, ref_pos, str)
[rm, rn] = getRmRn(ref_pos(1));
h = ref_pos(3);
DR = diag([rm + h, (rn + h)*cos(ref_pos(1)), -1]);
% blh to ned
res_pos = zeros(size(res_blh));
pva_pos = zeros(size(pva_blh));
for i = 1:size(res_pos, 1)
    delta_blh = res_blh(i, :) - ref_pos';
    delta_pos = DR * delta_blh';
    res_pos(i, :) = delta_pos';
end
for i = 1:size(pva_pos, 1)
    delta_blh = pva_blh(i, :) - ref_pos';
    delta_pos = DR * delta_blh';
    pva_pos(i, :) = delta_pos';
end

figure("Name", str);
sub1 = subplot(3, 1, 1);
hold on
plot(time, res_pos(:, 1) * 1e3, "LineWidth", 2);
plot(pva_time, pva_pos(:, 1) * 1e3, "LineWidth", 2);
legend('KF-GINS', 'GINS');
ylabel('North[mm]');
grid("on");
set(gca, 'FontSize', 20)

sub2 = subplot(3,1,2);
plot(time, res_pos(:, 2) * 1e3, "LineWidth", 2);
hold on
plot(pva_time, pva_pos(:, 2) * 1e3, "LineWidth", 2);
legend('KF-GINS', 'GINS');
ylabel('East[mm]');
grid("on");
set(gca, 'FontSize', 20)

sub3 = subplot(3,1,3);
plot(time, res_pos(:, 3) * 1e3, "LineWidth", 2);
hold on
plot(pva_time, pva_pos(:, 3) * 1e3, "LineWidth", 2);
xlabel('Time[s]');
legend('KF-GINS', 'GINS');
ylabel('Height[mm]');
grid("on");
set(gca, 'FontSize', 20)

linkaxes([sub1, sub2, sub3], 'x')
end