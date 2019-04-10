function df_plot(dir_ext, cur_name)

method_list = dir(dir_ext);
model_num = size(method_list,1) - 2;
model_name = cell(model_num,1);

for i = 3:size(method_list,1)
    model_name{i-2} = method_list(i).name;
end

propose = cell(model_num,1);
recall = cell(model_num,1);
name_list = cell(model_num,1);
ap_list = zeros(model_num,1);
for j = 1:model_num
    disp(sprintf('%s/%s/%s.mat',dir_ext, model_name{j}, model_name{j}));
    load(sprintf('%s/%s/%s.mat',dir_ext, model_name{j}, model_name{j}));
    propose{j} = pr_curve(:,2);
    recall{j} = pr_curve(:,1);
    ap = VOCap(propose{j},recall{j});
    ap_list(j) = ap;
    ap = num2str(ap);
    if length(ap) < 5
        name_list{j} = [model_name{j} '-' ap];
    else
        name_list{j} = [model_name{j} '-' ap(1:5)];
    end
end
[~,index] = sort(ap_list,'descend');
propose = propose(index);
recall = recall(index);
name_list = name_list(index);
% cur_name
plot_pr(propose, recall, name_list, cur_name);
end
