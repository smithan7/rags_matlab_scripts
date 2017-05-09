function [ len ] = path_length( path )
    len = 0;
    for i=2:length(path)
        len = len + gps_dist(path(i,2), path(i,1), path(i-1,2), path(i-1,1));
    end
end

