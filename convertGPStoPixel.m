function [ pixel_path ] = convertGPStoPixel( gps_path, corner_lats, corner_lons, img_width, img_height )

pixel_path = zeros( size( gps_path ) );

for i=1:length( gps_path )
   pixel_path(i,1) = img_width * (1-(gps_path(i,1) - corner_lats(1)) / (corner_lats(2) - corner_lats(1)) );
   pixel_path(i,2) = img_height * (1-(gps_path(i,2) - corner_lons(1)) / (corner_lons(2) - corner_lons(1)) );
    
end

end

