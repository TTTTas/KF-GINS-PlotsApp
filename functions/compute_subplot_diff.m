function stats = compute_subplot_diff()
% 计算当前子图中的两条曲线的差值统计量
% 适用：当前 gca 中只有两条有效的 line 对象

ax = gca;
lines = findobj(ax, 'Type', 'Line');

if length(lines) ~= 2
    error('当前子图必须包含且仅包含两条折线数据。');
end

% 取两条曲线（保持顺序）
line1 = lines(2);  % MATLAB findobj 倒序
line2 = lines(1);

x1 = line1.XData(:);  y1 = line1.YData(:);
x2 = line2.XData(:);  y2 = line2.YData(:);

% -------- 共同时间段 --------
starttime = max(x1(1), x2(1));
endtime   = min(x1(end), x2(end));

if starttime >= endtime
    error('两条曲线无共同时间段，无法比较。');
end

% 新时间轴：以较密的曲线为基准（更稳妥）
dt = min( mean(diff(x1)), mean(diff(x2)) );
time_interp = (starttime:dt:endtime)';

% -------- 插值 --------
y1_interp = interp1(x1, y1, time_interp, 'linear');
y2_interp = interp1(x2, y2, time_interp, 'linear');

% -------- 差值 --------
disp_error = y1_interp - y2_interp;
disp_error = disp_error(1500:end);
figure
plot(disp_error)

% -------- 误差统计 --------
stats.mean_error = mean(disp_error);
stats.std_error  = std(disp_error);
stats.max_error  = max(abs(disp_error));
stats.min_error  = min(abs(disp_error));

% 输出信息
fprintf('=============== 差值统计 ===============\n');
% fprintf('YLabel          : %s\n', stats.ylabel);
fprintf('Mean error      : %.6f\n', stats.mean_error);
fprintf('STD error       : %.6f\n', stats.std_error);
fprintf('Max abs error   : %.6f\n', stats.max_error);
fprintf('Min abs error   : %.6f\n', stats.min_error);
fprintf('=========================================\n');

end
