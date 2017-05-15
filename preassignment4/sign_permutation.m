%%unction A) a function that receives as input a vector and a value corresponding 
% to the number of permutations. The function should then, at each permutation, 
% randomly flip the sign of the values in the vector and compute the average of this surrogate vector. 
% The function should return the list of surrogate values. You have to plot the distribution of the surrogates 
% (histogram) as well as where the actual mean is (as a red vertical line). Please also report the p value computed as 
% 1 - the fraction of permutation surrogate values smaller than the actual unpermuted mean.

function [sur_mean, p_val] = calculate_signpermutation(vector, n_permutations)

sign_vector=zeros(size(vector));

for i = 1:n_permutations
   sign_vector = sign(randn(size(vector)));
   surr_vector = sign_vector .* vector;
    sur_mean(i) = mean(surr_vector);
    
end
p_val = 1 - sum(sur_mean < mean(vector)) / length(sur_mean);

end


