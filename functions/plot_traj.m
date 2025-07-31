function plot_traj(blh, str, ref_pos)
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
end