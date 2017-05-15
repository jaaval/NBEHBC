
%Function B) similar than the function above, this function receives as input two vectors and 
%a value corresponding to the number of permutations. The function should then, at each permutation,swap 
%a subset of values between the two vectors and compute the mean difference. The function should return 
%the list of surrogate values. You have to plot the distribution of the surrogates (histogram) as well as where 
%the unpermuted difference of the means is (as a red vertical line). Please also report the p value computed 
%as 1- the fraction of permutation surrogate values smaller than the actual unpermuted difference of the means.

function [sur_mean_diff, p_val] = swap_permutation_v2(vector1,vector2, n_permutations)
    assert(n_permutations > 0 && rem(n_permutations,1) == 0, 'n_permutations must be a positive integer value');
    assert(~isempty(vector1) && all(size(vector1) == size(vector2)), 'input vectors must have same size');
    
    sur_mean_diff = zeros(n_permutations,1);
    
    for i = 1:n_permutations
        swap = rand(size(vector1)) < 0.5;
        surr_vect1 = [vector1(swap); vector2(~swap)];
        surr_vect2 = [vector1(~swap); vector2(swap)];
        sur_mean_diff(i) = mean(surr_vect1) - mean(surr_vect2);
    end

    p_val = 1 - sum(sur_mean_diff < (mean(vector1) - mean(vector2)) / length(sur_mean_diff));
end