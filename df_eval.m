% Dark FACE Evaluation
% Conduct the evaluation on the Dark FACE validation set. 
% This tool is based on the eval_tools of WIDER FACE
% Shuo Yang Dec 2015
% Dejia Xu Feb 2019
%

clear;
close all;
addpath(genpath('./utils'));
% Please specify your prediction directory.
pred_dir = './data/result';
gt_dir = './data/gt';
fidin = fopen('./data/file_list.txt');
file_list = textscan(fidin,'%s','Delimiter','\n');
fclose(fidin);

% Please specify your algorithm name.

try
    algo_name = (argv(){1});
catch
    fprintf('Please specify your algorithm name, using `submission` instead');
    algo_name = 'submission';
end

try
    gt_folder = (argv(){2});
catch
    fprintf('Please specify gt_folder, using `/tools/data/gt` instead')
    gt_folder = './data/gt';
end

try
    sub_folder = (argv(){3});
catch
    fprintf('Please specify sub_folder, using `/tools/data/result` instead')
    sub_folder = './data/result';
end

cur_name = algo_name;
algo_name

pred_list = read_pred(pred_dir,file_list, sub_folder);
gt_list = read_gt(gt_dir,file_list, gt_folder);

norm_pred_list = norm_score(pred_list);

evaluation(norm_pred_list,gt_dir,cur_name, file_list, gt_list);

fprintf('Plot pr curve under overall setting.\n');

dir_int = sprintf('./baselines');

if ~exist(sprintf('./baselines/%s',cur_name),'dir')
    mkdir(sprintf('./baselines/%s',cur_name));
end

df_plot(dir_int, cur_name);
