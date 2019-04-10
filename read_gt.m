function gt_list = read_gt(file_dir, file_list, gt_folder)
event_num = 1;
event_list = {1};
gt_list = cell(event_num,1);

for i = 1:event_num
    fprintf('Reading gt\n');
    img_list = strrep(file_list{i}, './data/gt/', gt_folder);
    img_num = size(img_list,1);
    bbx_list = cell(img_num,1);
    for j = 1:img_num
        if ~exist(sprintf('%s',img_list{j}),'file')
            fprintf('Can not find the gt file %s \n',img_list{j});
            break;
        end
        
        fid = fopen(sprintf('%s',img_list{j}),'r');
        tmp = textscan(fid,'%s','Delimiter','\n');
        tmp = tmp{1};
        fclose(fid);
        try
            bbx_num = tmp{1,1};
            bbx_num = str2num(bbx_num);
            bbx = zeros(bbx_num,4);
            if bbx_num ==0
                continue;
            end
            for k = 1:bbx_num
                raw_info = str2num(tmp{k+1,1});
                bbx(k,1) = raw_info(1);
                bbx(k,2) = raw_info(2);
                bbx(k,3) = raw_info(3);
                bbx(k,4) = raw_info(4);
            end
            bbx_list{j} = bbx;
        catch
            fprintf('Invalid format %s %s\n',event_list{i},img_list{j});
        end
    end
    gt_list{i} = bbx_list;
    return
end
