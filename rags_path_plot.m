clear all ;
close all ;
clc

addpath('/home/rdml/git/map_align/hardwareMats')
addpath('/home/rdml/git/map_align/hardwarePaths')
%addpath('C:\Users\sgtas\OneDrive\Documents\MATLAB\RAGS\hardwarePaths')

max_diff_val = -1;
max_diff_ind = -1;

for mapNum =1:1
    close all ;
    if mapNum == 44 || mapNum == 47 || mapNum == 50
        continue;
    end
    map = imread(sprintf('hardware%d.png',mapNum-1)) ;
    costs = load(sprintf('path_costs%d.txt', mapNum-1)) ;
    
    %costs
    rags_costs = costs(1);
    naive_aStar_costs = costs(3);
    optimal_costs = costs(5);
    
    if abs(naive_aStar_costs - rags_costs) / optimal_costs > 0.005
        max_diff_val = abs(naive_aStar_costs - rags_costs) / optimal_costs
        max_diff_ind = mapNum
    end
    
    rags_path = load(sprintf('RAGS_path%d.txt', mapNum)) ;
    rags_path = rags_path_trimmer( rags_path );

    %greedy_path = load(sprintf('greedy_path%d.txt', mapNum)) ;
    %greedy_path = rags_path_trimmer( greedy_path );

    aStar_path = load(sprintf('aStar_path%d.txt', mapNum)) ;
    aStar_path = rags_path_trimmer( aStar_path );

    %sampledAStar_path = load(sprintf('sampled_aStar_path%d.txt', mapNum)) ;
    %sampledAStar_path = rags_path_trimmer( sampledAStar_path );

    optimal_path = load(sprintf('hindsight_optimal_path%d.txt', mapNum)) ;
    optimal_path = rags_path_trimmer( optimal_path );
    
    fig_num = max(1,mapNum);
    figure(fig_num)
    imshow(map)
    hold on

    plot( optimal_path(:,1),optimal_path(:,2), 'r', 'lineWidth', 7, 'marker', 'o', 'markerSize', 15)  
    plot( aStar_path(:,1), aStar_path(:,2), 'k--', 'lineWidth', 5, 'marker', 'x', 'markerSize', 12)
    plot( rags_path(:,1), rags_path(:,2), 'b:', 'lineWidth', 3, 'marker', '<', 'markerSize', 10)
   
    %plot( greedy_path(:,1), greedy_path(:,2), 'b', 'lineWidth', 7) 
    %plot( sampledAStar_path(:,1), sampledAStar_path(:,2), 'g', 'lineWidth', 3)

    plot(1,1,'m^', 'markerSize', 10, 'lineWidth', 7 )
    plot(length(map(1,:))/3, length(map(:,1)),'co', 'markerSize', 10, 'lineWidth', 7 )
    
    
    legend1 = legend(sprintf('Optimal: %.2f',optimal_costs'), sprintf('A-Star: %.2f',naive_aStar_costs), sprintf('RAGS: %.2f',rags_costs));
    set(legend1,'FontSize',14,'FontName','Times New Roman');
    
    savefig(strcat('C:\Users\sgtas\OneDrive\Documents\MATLAB\RAGS\path_figs\', sprintf('path%d.fig', mapNum) ) )
end
