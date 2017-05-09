
close all
clear all
clc

lat1 = 44.631767;
lon1 = -123.141590; % bottom right corner
lat0 = 44.634827;
lon0 = -123.148355; % top left corner

start_lat = 44.631960;
start_lon = -123.142032;
goal_lat = 44.632152;
goal_lon = -123.147309;

list = [44.6324,-123.148;
44.6327,-123.147;
44.6333,-123.144;
44.6326,-123.146;
44.6321,-123.148;
44.6328,-123.146;
44.6346,-123.144;
44.6344,-123.143;
44.6326,-123.143;
44.6336,-123.142;
44.6323,-123.147;
44.634,-123.147;
44.6341,-123.143;
44.6321,-123.143;
44.6329,-123.145;
44.6334,-123.143;
44.632,-123.145;
44.6329,-123.145;
44.6331,-123.143;
44.6323,-123.146;
44.633,-123.145;
44.6345,-123.142;
44.6319,-123.147;
44.6343,-123.145;
44.6322,-123.143;
44.6318,-123.142;
44.6336,-123.143;
44.6319,-123.146];

figure
hold on 
plot( lon1, lat1, 'bx');
plot( lon0, lat0, 'bx');

plot( start_lon, start_lat, 'go')
plot( goal_lon, goal_lat, 'ro')

for i = 1:length(list)
    plot( list(i,2), list(i,1), 'kx')
end