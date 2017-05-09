function [ path ] = rags_path_trimmer( path )

flag = -1;

for i=length(path):-1:1
    if path(i,1) == 0 && path(i,2) == 0
        flag = i;
        break;
    end
end


if flag > 0
    path = path(flag:end, :);
end



