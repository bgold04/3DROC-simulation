As of November 25, 2020:
So, the point is to set up 3 functions, prevalence (prev(i))sensitivity (sens(j))and specificity (spec(k)) and see how they behave in different sized cohortsand with realistic assignments of ranges.
So, I want to permute over the realistic ranges and compute values foreach sensitivity, specificy and prevalence. I have chosen 150 tranches ofeach.  That's all working now, but I can't get the permutations to work.
Specifically, the interpreter does not like:
#############################################
#permute prevalence, sensitivity and specificity values
#########################################
A = (prev(i),sens(j),spec(k))
B = perms(A,[prev(i) : sens(j) : spec(k)]);
disp ("The different permutations of prevalence, sensitivity and specificity are: "), disp (B)
##################################### 
