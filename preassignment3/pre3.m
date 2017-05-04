
%% load stuff

clear;
addpath('/Users/Jaakko/Documents/MATLAB/BCT/2017_01_15_BCT/');
load('macaque71.mat');

%% network measures
% network seems to be a binary directed network

% degree and similarity
[id,od,degrees] = degrees_dir(CIJ);
[is,os,strength] = strengths_dir(CIJ);
j_degrees = jdegree(CIJ);
gt = gtom(CIJ,1);
eno = edge_nei_overlap_bd(CIJ);

% density
density = density_dir(CIJ);

% clustering and related stuff
c_coef = clustering_coef_bd(CIJ);
transit = transitivity_bd(CIJ);
local_eff = efficiency_bin(CIJ,1);
components = get_components(CIJ);
% there is a shitton of different community algorithms. I'll just use louvain here
communities = community_louvain(CIJ);

% assortativity etc
assort = assortativity_bin(CIJ, 1); % out-in correlation
rc = rich_club_bd(CIJ);
cp = core_periphery_dir(CIJ);
corek10 = kcore_bd(CIJ,10); % core k=10

% there is no trivial way to visualize paths and walks so we dont calculate them
distances = distance_bin(CIJ);
charpl = charpath(distances,0,0);

% diffusion and stuff
mfpt = mean_first_passage_time(CIJ);
diffeff = diffusion_efficiency(CIJ);

% centrality, only the measures that do not require community structure
between = betweenness_bin(CIJ);
ebetween = edge_betweenness_bin(CIJ);
kcc = kcoreness_centrality_bd(CIJ);
flowcoef = flow_coef_bd(CIJ);
shortcuts = erange(CIJ);

% motifs
[~, structmots] = motif3struct_bin(CIJ);
[~, funcmots] = motif3funct_bin(CIJ);

%% visualizations

% degrees
plot_nw_data(id, 'in degree', 'in degree');
plot_nw_data(od, 'out degree', 'out degree');
% strengths
plot_nw_data(is, 'in str', 'in strength');
plot_nw_data(os, 'out str', 'out strength');
%jdegree
figure();
imagesc(j_degrees);
title('Joint degree');
c=colorbar('Ticks', [min(j_degrees(:)), max(j_degrees(:))]);
xlabel('In connections');
ylabel('Out connections');
c.Label.String='Nodes';
saveas(gcf, 'figures/jdegree.png');
close(gcf);
%gtom
figure;
imagesc(gt);
title('Topological overlap')
xlabel('Node');
ylabel('Node');
c=colorbar;
saveas(gcf, 'figures/gtom.png');
close(gcf);
%edgeoverlap
figure;
imagesc(eno);
title('Neighbor overlap');
xlabel('Node');
ylabel('Node');
c=colorbar;
saveas(gcf, 'figures/neighbor_overlap.png');
close(gcf);
%clustering
plot_nw_data(c_coef, 'clustering', 'clustering');
plot_nw_data(local_eff, 'local efficiency', 'local efficiency');
plot_nw_data(communities, 'Louvain communities', 'communities')
%rich club
figure();
subplot(3,1,1)
stem(rc)
xlabel('degree')
ylabel('rich club coeff');
title('rich club coefficent');
subplot(3,1,2)
histogram(rc);
xlabel('rich club coeff')
ylabel('num of nodes');
subplot(3,1,3)
boxplot(rc)
ylabel('rich club coeff');
saveas(gcf, 'figures/rich_club.png');
close(gcf);
%core periphery
plot_nw_data(cp, '0=periphery, 1=core', 'Core periphery');
% kcore
figure();
imagesc(corek10);
title('kCore k=10');
c=colorbar('Ticks', [min(corek10(:)), max(corek10(:))]);
xlabel('Node');
ylabel('Node');
saveas(gcf, 'figures/kcore10.png');
close(gcf);
% distances
figure();
imagesc(distances);
title('distances between nodes');
c=colorbar('Ticks', [min(distances(:)), max(distances(:))]);
xlabel('Node');
ylabel('Node');
saveas(gcf, 'figures/distances.png');
close(gcf);
% MFPT
figure();
imagesc(mfpt);
title('Mean first passage time');
xlabel('node');
ylabel('node');
c = colorbar;
c.Label.String = 'mftp';
saveas(gcf, 'figures/mftp.png');
close(gcf);
% betweeness
plot_nw_data(between, 'Betweenness', 'Betweennes');

figure();
imagesc(ebetween);
ylabel('node');
xlabel('node');
title('edge betweenness centrality');
colorbar
saveas(gcf, 'figures/ebetween.png');
close(gcf);

plot_nw_data(kcc, 'Closeness', 'Closeness');

plot_nw_data(flowcoef, 'Flow coefficient', 'Flow coefficient');

figure();
imagesc(shortcuts);
ylabel('node');
xlabel('node');
title('Shortcuts');
colorbar
saveas(gcf, 'figures/shortcuts.png');
close(gcf);

% motifs

figure();
imagesc(structmots);
ylabel('node');
xlabel('motif');
title('Structural motifs');
colorbar
saveas(gcf, 'figures/structmotifs.png');
close(gcf);

figure();
imagesc(funcmots);
ylabel('node');
xlabel('motif');
title('Functional motifs');
colorbar
saveas(gcf, 'figures/funcmotifs.png');
close(gcf);