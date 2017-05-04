
clear;
addpath('/Users/Jaakko/Documents/MATLAB/BCT/2017_01_15_BCT/');
load('macaque71.mat');

%%
% adjacency plot. This is the basic network visualization. Unlike in nicer
% tools this cannot automatically create other topologies than a circle
[x,y]=adjacency_plot_und(CIJ);
figure
plot(x,y,'bo--')
title('Adjacency plot');
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
saveas(gcf, 'figures/adjacencyplot.png');
close(gcf);
%%
% a nice way to visualize communities
louvain = community_louvain(CIJ);
[x y indices] = grid_communities(louvain);
figure
imagesc(CIJ(indices,indices));         
hold on;                              
plot(x,y,'r','linewidth',2);     
title('Community structure');
xlabel('node, sorted');
ylabel('node, sorted');
saveas(gcf, 'figures/communitiesplot.png');
close(gcf);
%% reordering
% the reordeding methods are very similar from plotting point of view so
% skipping the rest
[Mreordered,Mindices,cost] = reorder_matrix(CIJ,'line',1);
figure(1)
imagesc(Mreordered);
title('Reordered adjacency matrix');
xlabel('Reordered node');
ylabel('Reordered node');
saveas(gcf, 'figures/reorderingplot1.png');
close(gcf);
figure(2)
imagesc(CIJ);
title('Original adjacency matrix');
xlabel('Node');
ylabel('Node');
saveas(gcf, 'figures/reorderingplot2.png');
close(gcf);

