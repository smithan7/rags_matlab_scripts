clear all ;
close all ;
clc

addpath('/home/rdml/git/map_align/hardwareMats')
addpath('/home/rdml/git/map_align/hardwarePaths')
addpath('/home/rdml/Desktop')

%addpath('C:\Users\sgtas\OneDrive\Documents\MATLAB\RAGS\hardwarePaths')

max_diff_val = -1;
max_diff_ind = -1;

mapNum = 0;
corner_lats = zeros(2,1);
corner_lons = zeros(2,1);
if mapNum == 0
    corner_lats(1) = 44.538552;
    corner_lons(1) = -123.247446; % bottom right corner
    corner_lats(2) =  44.539847;
    corner_lons(2) = -123.251004; % top left corner
end
if mapNum == 1
    corner_lats(1) = 44.537679;
    corner_lons(1) = -123.248297; % bottom right corner
    corner_lats(2) = 44.539295;
    corner_lons(2) = -123.249711; % top left corner
end

if mapNum == 2
    corner_lats(1) = 44.537470;
    corner_lons(1) = -123.249107; % bottom right corner
    corner_lats(2) = 44.539048;
    corner_lons(2) = -123.250807; % top left corner
end

map = imread(sprintf('hardware%d.png',mapNum)) ;

[img_h, img_w, ~] = size( map );

%rags_path = load(sprintf('RAGS_path%d.txt', mapNum)) ;
data = load('rags.txt');
cntr = 0;
for i = 2:3:length( data )
    cntr = cntr + 1;
    rags_path_gps(cntr,2) = data(i);
    rags_path_gps(cntr,1) = data(i+1);
end
rags_len = path_length( rags_path_gps);
rags_path = convertGPStoPixel( rags_path_gps, corner_lons, corner_lats, img_w, img_h );

%aStar_path = load(sprintf('aStar_path%d.txt', mapNum)) 
data = load('aStar.txt') ;
cntr = 0;
for i = 2:3:length( data )
    cntr = cntr + 1;
    aStar_path_gps(cntr,2) = data(i);
    aStar_path_gps(cntr,1) = data(i+1);
end

aStar_len = path_length( aStar_path_gps);
aStar_path = convertGPStoPixel(aStar_path_gps, corner_lons, corner_lats, img_w, img_h );


fig_num = max(1,mapNum);
figure(fig_num)
imshow(map)
hold on

plot( aStar_path(:,1), aStar_path(:,2), 'k.', 'lineWidth', 5)%, 'marker', 'x', 'markerSize', 1)
plot( rags_path(:,1), rags_path(:,2), 'b:', 'lineWidth', 3)%, 'marker', '<', 'markerSize', 1)

legend1 = legend( sprintf('A-Star: %.2f',aStar_len), sprintf('RAGS: %.2f',rags_len));
set(legend1,'FontSize',14,'FontName','Times New Roman');

savefig(strcat('C:\Users\sgtas\OneDrive\Documents\MATLAB\RAGS\hardware_path_figs\', sprintf('hardware_path%d.fig', mapNum) ) )
