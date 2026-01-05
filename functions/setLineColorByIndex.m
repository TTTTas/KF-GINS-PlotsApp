function setLineColorByIndex(colorMap, lineIndex, lineWidth, markerSize)
% setLineStyleAllSubplots 修改 figure 中子图线条样式
%
% 参数：
% colorMap   : 颜色，可以是 RGB 三元组、内置字符或 '#RRGGBB' 字符串
% lineIndex  : 指定子图中的第几条 line（1开始），0 表示修改所有 line
% lineWidth  : 线宽（可选）
% markerSize : marker 大小（可选）
%
% 示例：
% setLineStyleAllSubplots('#00215b', 2, 2, 8)  % 设置每个子图第2条线颜色、线宽、marker大小
% setLineStyleAllSubplots([1 0 0], 0, 1.5)    % 设置每个子图所有线的颜色和线宽

    if nargin < 2, lineIndex = 0; end
    if nargin < 3, lineWidth = []; end
    if nargin < 4, markerSize = []; end

    % 颜色转换：如果是 '#RRGGBB'
    if ischar(colorMap) && colorMap(1) == '#'
        colorMap = reshape(sscanf(colorMap(2:end),'%2x')/255, 1, 3);
    end

    % 获取当前 figure 中所有 axes（排除 legend）
    axesHandles = findall(gcf, 'Type', 'axes', '-not', 'Tag', 'legend');

    for k = 1:length(axesHandles)
        ax = axesHandles(k);
        lineHandles = findall(ax, 'Type', 'line');
        lineHandles = flipud(lineHandles);  % 保持绘图顺序

        if lineIndex == 0
            % 修改所有 line
            targetLines = lineHandles;
        elseif lineIndex <= length(lineHandles)
            targetLines = lineHandles(lineIndex);
        else
            targetLines = [];
        end

        % 修改属性
        for i = 1:length(targetLines)
            if ~isempty(colorMap)
                targetLines(i).Color = colorMap;
            end
            if ~isempty(lineWidth)
                targetLines(i).LineWidth = lineWidth;
            end
            if ~isempty(markerSize)
                targetLines(i).MarkerSize = markerSize;
            end
        end
    end
end
