function [ d ] = gps_dist( a_lat, a_lon, b_lat, b_lon )

	R = 6378136.6; % radius of the earth in meters

	lat1 = degtorad(a_lat);
	lon1 = degtorad(a_lon);
	lat2 = degtorad(b_lat);
	lon2 = degtorad(b_lon);

	dlon = lon2 - lon1;
	dlat = lat2 - lat1;

	a = sin(dlat / 2)^2 + cos(lat1) * cos(lat2) * sin(dlon / 2)^2;
	c = 2 * atan2( sqrt(a), sqrt(1 - a));

	d = R * c; % in meters
end

