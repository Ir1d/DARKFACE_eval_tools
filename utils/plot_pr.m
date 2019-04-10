function plot_pr(propose,recall,name_list,algo_name)
model_num = size(propose,1);
warning('off', 'all');
figure1 = figure('papertype', 'a4','paperorientation', 'landscape','Color',[1 1 1], 'renderer','painters','Position',[1 1 800 400], 'Visible','off');
axes1 = axes('Parent',figure1,...
    'LineWidth',2,...
    'FontSize',10,...
    'FontName','Times New Roman',...
    'FontWeight','bold');
box(axes1,'on');
hold on;

LineColor = colormap(hsv(model_num));
for i=1:model_num
    plot(propose{i},recall{i},...
        'MarkerEdgeColor',LineColor(i,:),...
        'MarkerFaceColor',LineColor(i,:),...
        'LineWidth',5,...
        'Color',LineColor(i,:))
    grid on;
    hold on;
end

legend1 = legend(name_list);
set(legend1,'Location','EastOutside');

xlim([0,1]);
ylim([0,1]);
xlabel('Recall');
ylabel('Precision');

% algo_name
savename = sprintf('./output/%s.png',algo_name);
savename
saveas(gcf,savename);
clear gcf;
hold off;
