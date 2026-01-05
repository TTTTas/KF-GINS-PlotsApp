function setAllLinesLineWidth(lineWidth)
% setAllLinesLineWidth 设置当前 Figure 中所有子图中线的宽度
%
% 参数：
% lineWidth: 目标线宽，例如 2

    if nargin < 1
        lineWidth = 1; % 默认线宽
    end

    % 获取当前 figure 中所有 axes（排除 colorbar 等特殊 axes）
    axesHandles = findall(gcf, 'Type', 'axes', '-not', 'Tag', 'legend');

    % 遍历每个 axes
    for k = 1:length(axesHandles)
        ax = axesHandles(k);

        % 获取 axes 中所有 line 对象
        lineHandles = findall(ax, 'Type', 'line');

        % 设置线宽
        for i = 1:length(lineHandles)
            lineHandles(i).LineWidth = lineWidth;
        end
    end
end
