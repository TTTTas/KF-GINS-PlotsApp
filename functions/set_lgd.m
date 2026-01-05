function set_lgd(r)
    lgd = legend;
    lgd.Orientation = 'horizontal';
    lgd.Location = 'northoutside';
    pos = lgd.Position;     % [x y width height]
    pos(2) = pos(2) + r; % 上移一点
    lgd.Position = pos;
    lgd.EdgeColor = 'none';             % 设置边框无颜色
end