function results = compute_fig_all()
% 遍历当前 figure 中所有子图，逐一计算差值统计量
% 调用 compute_subplot_diff() 完成单子图分析
%
% 返回：
%   results(k) = 某子图的统计结构体（包含 mean/std/max/min/ylabel）

fig = gcf;                 % 当前 figure
axesList = findobj(fig, 'Type', 'Axes');   % 所有子图（包括 colorbar 的 axes）

results = [];              % 初始化
count = 0;

fprintf('\n========== 分析当前 Figure 中的所有子图 ==========\n');

for i = 1:length(axesList)
    ax = axesList(i);

    % 跳过 colorbar 等非真正子图
    if isempty(findobj(ax, 'Type', 'Line'))
        continue;
    end

    % 当前子图作为激活对象
    axes(ax);

    lines = findobj(ax, 'Type', 'Line');
    if length(lines) ~= 2
        % 跳过不是两条曲线的子图
        continue;
    end

    % 调用前面写好的函数（必须在路径下）
    count = count + 1;
    fprintf('\n--- 子图 %d %s ---\n', count, gca().YLabel.String);
    compute_subplot_diff();

    % 记录结果
    % results(count) = stats;
end

fprintf('\n========== 所有子图分析完成，共 %d 个符合条件的子图 ==========\n\n', count);

end
