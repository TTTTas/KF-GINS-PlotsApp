function plot_traj(blh, str, ref_pos, time)
% position
blh(:, 1) = deg2rad(blh(:, 1));
blh(:, 2) = deg2rad(blh(:, 2));

[rm, rn] = getRmRn(ref_pos(1));
h = ref_pos(3);
DR = diag([rm + h, (rn + h)*cos(ref_pos(1)), -1]);

% blh to ned
pos = zeros(size(blh));
for i = 1:size(pos, 1)
    delta_blh = blh(i, :) - ref_pos;
    delta_pos = DR * delta_blh';
    pos(i, :) = delta_pos';
end

%% plane position
figure("Name", str)
plot(pos(:, 2) * 1e3, pos(:, 1) * 1e3);
title('Position');
xlabel('East[mm]');
ylabel('North[mm]');
grid("on");
set(gca, 'FontSize', 20)
figure("Name",str)
ax1=subplot(2,1,1);
plot(time, pos(:, 1)*1e3);
ylabel('North[mm]');
grid on
ax2 = subplot(2,1,2);
plot(time, pos(:,2)*1e3);
ylabel('East[mm]');
xlabel('Time [s]')
grid on
linkaxes([ax1, ax2], 'x');
end