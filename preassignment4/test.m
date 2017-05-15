%% Testing the signed permutation and pernutation for teo vectors

load('late potential for all subjects, for frontal lobe not averaged');% load data
vector1=Lpp_S4_FC; 
vector2=Lpp_S1_FC(1:848);
n_permutations=500;

%%
[sur_mean,p_val_sign] = sign_permutation(vector1, n_permutations);

figure();
 histogram(sur_mean,30);
  hold on

stem(mean(vector1),70); hold off
title('mean of surrgate vectors')
ylabel('no of counts')
xlabel('mean')

%%

[sur_mean_diff, p_val_swap] = swap_permutation(vector1,vector2,n_permutations);

figure();
 histogram(sur_mean_diff,30);
  hold on
stem(mean(vector1)-mean(vector2),70);
hold off
title(' diffrences between mean of  surrgate vectors ')
ylabel('no of counts')
xlabel('mean')