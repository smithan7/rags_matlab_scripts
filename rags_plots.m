clear all ;
close all ;
clc

addpath('/home/rdml/git/map_align/hardwareMats')
addpath('/home/rdml/git/map_align/hardwarePaths')

bigDiff = [];

for k = 1:3
    if k == 44 || k == 47 || k==50
        continue;
    end
    
    data = load(sprintf('path_costs%d.txt',k-1)) ;
    
    if isempty( data )
        continue;
    end
    
    diffCost = zeros(size(data)) ;
    
    for i = 1:size(data,1)
        for j = 1:size(data,2)
            diffCost(i,j) = (data(i,j) - data(i,end))/data(i,end) ;
            if diffCost(i,j) > 1e3
                diffCost(i,j) = NaN ;
            elseif diffCost(i,j) < 0
                fprintf('Entry (%d,%d): %f\n',i,j,diffCost(i,j)) ;
            end
        end
    end
    meanDiff(k,:) = mean( diffCost );
    bigDiff = vertcat(bigDiff, diffCost);
end
    
    figure
    hold on
    title('Comparison of Path Costs')
    ylabel('Path cost percent above optimal (%)')
    hb = boxplot(100*meanDiff(:,[1:3,end-1])) ;
    set(gca,'xtick',[1,2,3,4],'xticklabel',{'RAGS  ','Greedy  ','Naive A*  ','Sampled A*  '}) ;
    y_lim = get(gca,'ylim') ;
    set(gca,'ylim',[-0.1,y_lim(2)+ 0.1]) ;
    grid on
    %th = rotateticklabel(gca,45) ;
    %set(th,'fontsize',get(gca,'fontsize')) ;
    %set(gca,'xticklabel',{''}) ;
    %set(gcf,'position',[2040 520 330 420])

%     figure
%     hold on
%     title('Comparison of Path Costs')
%     ylabel('Path cost percent above optimal')
%     hb = boxplot(diffCost(:,[1:3,end-1])) ;
%     set(gca,'xtick',[1,2,3,4],'xticklabel',{'RAGS  ','Greedy  ','Naive A*  ','Sampled A*  '}) ;
%     y_lim = get(gca,'ylim') ;
%     set(gca,'ylim',[-0.001,y_lim(2)+ 0.001]) ;
%     grid on
%     %th = rotateticklabel(gca,45) ;
%     %set(th,'fontsize',get(gca,'fontsize')) ;
%     set(gca,'xticklabel',{''}) ;
%     set(gcf,'position',[2040 520 330 420])
%     pos = get(gca,'position') ;
%     pos(2) = 0.16 ;
%     set(gca,'position',pos)
    