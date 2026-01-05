function labelSubplots(posLocation, xOffset, yOffset, fz)
% labelSubplots 给当前 Figure 中的所有子图编号
% 
% 参数：
% posLocation: 编号位置，'northwest', 'northeast', 'southwest', 'southeast'
% xOffset: 横向偏移（相对于子图左/右边界，单位为轴坐标比例0~1）
% yOffset: 纵向偏移（相对于子图上/下边界，单位为轴坐标比例0~1）
%
% 示例：
% labelSubplots('northwest', 0.05, 0.05)

    if nargin < 1, posLocation = 'northwest'; end
    if nargin < 2, xOffset = 0.02; end
    if nargin < 3, yOffset = 0.02; end
    if nargin < 4, fz = 8; end

    % 获取当前 figure 中所有子图
    axesHandles = findall(gcf, 'Type', 'axes');
    
    % 排序：从上到下、从左到右
    positions = arrayfun(@(ax) get(ax, 'Position'), axesHandles, 'UniformOutput', false);
    positions = cell2mat(positions);
    % positions 列： [left bottom width height]
    [~, sortIdx] = sortrows([-positions(:,2), positions(:,1)]);  % 先按 bottom 逆序，再按 left
    axesHandles = axesHandles(sortIdx);

    % 循环给每个子图加编号
    for k = 1:length(axesHandles)
        ax = axesHandles(k);
        axes(ax);  % 激活子图

        % 计算编号位置
        switch lower(posLocation)
            case 'northwest'
                x = 0 + xOffset;
                y = 1 - yOffset;
                ha = 'left';
                va = 'top';
            case 'northeast'
                x = 1 - xOffset;
                y = 1 - yOffset;
                ha = 'right';
                va = 'top';
            case 'southwest'
                x = 0 + xOffset;
                y = 0 + yOffset;
                ha = 'left';
                va = 'bottom';
            case 'southeast'
                x = 1 - xOffset;
                y = 0 + yOffset;
                ha = 'right';
                va = 'bottom';
            otherwise
                error('未知位置，请使用 northwest/northeast/southwest/southeast');
        end

        % 添加编号
        text(x, y, ['(' char('a'+k-1) ')'], 'Units', 'normalized', ...
             'HorizontalAlignment', ha, 'VerticalAlignment', va, ...
             'FontWeight', 'bold', 'FontSize', fz);
    end
end
