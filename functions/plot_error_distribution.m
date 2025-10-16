function plot_error_distribution(error_data, str)
% 绘制误差正态分布图
% 输入：
%   error_data: 一维误差数据（向量）

    % 检查输入
    if nargin < 1 || isempty(error_data)
        error('请输入误差数据向量 error_data');
    end

    % 计算均值和标准差
    % mu = mean(error_data);
    % error_data = error_data - mu;
    mu = mean(error_data);
    sigma = std(error_data);

    % 绘制直方图
    figure("Name", str);
    h = histogram(error_data, 'Normalization', 'pdf', ...
        'FaceColor', [0.7 0.9 1], 'EdgeColor', 'k');
    hold on;

    % 绘制正态分布曲线
    x = linspace(min(error_data), max(error_data), 200);
    y = normpdf(x, mu, sigma);
    plot(x, y, 'r', 'LineWidth', 2);

    % 均值与标准差标注
    y_mu = normpdf(mu, mu, sigma);
    plot([mu mu], [0 y_mu], 'k--', 'LineWidth', 1.5);
    text(mu, y_mu + 0.025, sprintf('\\mu = %.2f', mu), ...
        'HorizontalAlignment', 'center', 'FontSize', 20);

    % 标注 ±σ
    plot([mu-sigma mu-sigma], [0 normpdf(mu-sigma, mu, sigma)], 'k--', 'LineWidth', 1.5);
    plot([mu+sigma mu+sigma], [0 normpdf(mu+sigma, mu, sigma)], 'k--', 'LineWidth', 1.5);
    text(mu-sigma - 1.5, 0.08, sprintf('-\\sigma = %.2f', -sigma), ...
        'HorizontalAlignment', 'center', 'FontSize', 20);
    text(mu+sigma + 1.5, 0.08, sprintf('\\sigma = %.2f', sigma), ...
        'HorizontalAlignment', 'center', 'FontSize', 20);

    % 图例与标题
    legend('误差分布', '正态拟合', 'Location', 'northeast');
    title('误差正态分布图');
    xlabel('误差值');
    ylabel('概率密度');

    % 美化
    grid on;
    box on;
    hold off;
    set(gca, 'FontSize', 20)

end
