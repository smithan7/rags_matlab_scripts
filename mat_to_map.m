function [ lat_lon ] = mat_to_map( map_corners,mat_size, point )
	mx = point(1)/mat_size(1);
	my = point(1)/mat_size(2);

	lat_lon = [];
	lat_lon(1) = ( map_corners(1) + mx*(map_corners(3) - map_corners(1)) );
	lat_lon(2) = ( map_corners(2) + my*(map_corners(4) - map_corners(2)) );

end

