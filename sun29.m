% script sun29.m
# gnu octave program to simulate prevalence, sensitivity and specificity 
# using an octave surface plot, over the range of possible values
# Bert Gold, October 2020
a = 1; #integer counter and increment for true positives
b = 1; #integer counter and increment for false positives
c = 1; #integer counter and increment for true negatives
d = 1; #integer counter and increment for false negative
e = 1; #set inital value of some variables
f = [1 : 1 : 150]; #integer counter and increment for status assignment
g = [1 : 1 : 150]; #integer counter and increment for detection assignment
h = 1; #integer counter and increment for detection assignment under a given sensitivity and specificity
i = [1 : 1 : 150]; #integer counter and increment for prevalence
j = [1 : 1 : 150]; #integer counter and increment for sensitivity
k = [1 : 1 : 150]; #integer counter and increment for specificity
aff = 0; # number of affecteds assigned
nor = 0; # number of normals assigned
m = 1; # 1 stands for affected {"affect"};
n = 2; # 2 stands for normal {"normal"};
o = 3; #{"daffec"};
p = 4; #{"uaffec"};
q = 5; #{"dnorma"};
r = 6; #{"unorma"};
s = 7; #{"normal"};
t = [1 : 1 : 3307800]; # replace with 3307800 when working
kounter = 0; #initial value of fractional counter and increment for values between 0.02 and 150
sample = 150; # number of individuals tested in simulation
isample = 1/sample; # multiplicative inverse of sample
maxprev = 0.498; # maximum sample prevalence
minprev = 0.2; # minimum or initial sample prevalence
maxsens = 0.998; # set maximum test sensitivity
minsens = 0.7; # set minimum or initial test sensitivity
maxspec = 0.998; # set maximum test specificity
minspec = 0.7; # set minimum or initial test specificity
iprev = minprev;
isens = minsens;
ispec = minspec;
###############################################################
previnc = ((maxprev - minprev)/(sample)); # set prevalence increment
disp (previnc)
sensinc = ((maxsens - minsens)/(sample)); # set sensitivity increment
disp (sensinc)
specinc = ((maxspec - minspec)/(sample)); # set specificity increment
disp (specinc)
disinc = 0; # set disease increment to 0
################################
function disease
  disease = ({1 | 2})
endfunction
function status
  disease = ({3 | 4 | 5 | 6})
endfunction
################################################################
# prevalence loop
###############################################################
prev(i) = [0.2 : 0.002 : 0.498];
disp ("Current value of prev(i) is: "), disp (prev(i)) 
if (prev(i) ~= maxprev)
prev(i) = [prev(i) + previnc];
dispv = prev(i); 
i = i + 1;
disp ("Current value of prev(i) is: "), disp (dispv) 
endif
###########################################################
# sensitivity loop
##########################################################
sens(j) = [0.7 : 0.002 : 0.998];
disp ("Current value of sens(j) is:"), disp (sens(j)) 
if (sens(j) ~= maxsens)
sens(j) = [sens(j) + sensinc];
dissev = sens(j);
j = j + 1;
disp ("Current value of sens(j) is: "), disp (dissev)
endif
################################################################
# specificity loop
###############################################################
spec (k) = [0.7 : 0.002 : 0.998];
disp ("Current value of spec(k) is: "), disp (spec(k)) 	
if (spec(k) ~= maxspec)
spec(k) = [spec(k) + specinc];
disspv = spec(k);
k = k + 1;
disp ("Current value of spec(k) is: "), disp (disspv)
endif
#############################################
#permute prevalence, sensitivity and specificity values
#########################################
#A = (prev(i),sens(j),spec(k))
#B = combvec([prev(i),sens(j),spec(k)]);
#B = perms(([prev(i)]),([sens(j)]),([spec(k)]));
#B = eye(size([prev(i),sens(j),spec(k)]));
#disp ("The different permutations of prevalence, sensitivity and specificity are: "), disp (B)
#####################################
# create truth dataset
#########################
f = 1;
disease(f) = [1];
while (f <= (sample + 1))
s = (-1)^f;
if (s == -1) && (f <= (2/3)*(sample))
  disease(f) = [1];
disp ("disease state is"), disp (disease(f))
else if (s = 1) && (f <= (2/3)*(sample))
  disease(f) = [2];
disp ("disease state is"), disp (disease(f))
else if (s = 1) && (f > (2/3)*(sample))
  disease(f) = [2];
disp ("disease state is"), disp (disease(f))
endif
endif
endif
f = f + 1;
endwhile
####################################################
# count affecteds
####################################################
f = 1;
while (f < 150) #
if (disease(f) == n)#
  nor = nor + 1;
else
  aff = aff + 1;
endif
f = f + 1;
endwhile
disp ("number of normals is: "), disp (nor)
disp ("number of affecteds is: "), disp (aff)
############################################################
#begin loop to generate permutations if there is no other way
##############################################################
f = [1 : 1 : 150]; #integer counter and increment for status assignment
g = [1 : 1 : 150]; #integer counter and increment for detection assignment
i = [1 : 1 : 150]; #integer counter and increment for prevalence
k = [1 : 1 : 150]; #integer counter and increment for specificity
f = 1;
g = 1; 
i = 1; 
k = 1;
t = 1;
prev(i) = [iprev]; #increment initial prevalence by the multiplicative inverse of the sample size
sens(j) = [isens]; #increment initial sensitivity by the multiplicative inverse of the sample size
spec(k) = [ispec]; #increment initial specificity by the multiplicative inverse of the sample size
while (t < 3307800) # replace with 3307800 when working    (loop 1) 
#l = t / 450;
# prevalence loop
while (i < 150) # (loop 4)
w = [disease(f)];
if (w == [1]) # (loop 5)
if ((g/sample) < (prev(i))) # (loop 6)
if (i < sample) # (loop 7)
  status(f) = [3]; 
  a = a+1;
if (w == [1])  # (loop 8)
if ((g/sample) > (prev(i))) # (loop 9)
  status(f) = [4];
  b = b + 1;
if (w == [2]) # (loop 10)
if ((g/sample) < (prev(i))) # (loop 11)
  status(f) = [5];
  c = c+1;
if (w == [2])  # (loop 12)
if ((g/sample) > (prev(i))) # (loop 13)
  status(f) = [6];
  d = d+1;
  prev(i) = [prev(i) + previnc];
prevt(t) = [prev(i)];
f = f + 1;
g = g + 1;
i = i + 1;
end #(end loop 4)
end #(end loop 5)
end #(end loop 6)
end #(end loop 7)
end #(end loop 8)
end #(end loop 9)
end #(end loop 10)
end #(end loop 11)
end #(end loop 12)
end #(end loop 13)
# end prevalence workhorse 
# sensitivity loop
f = [1 : 1 : 150]; #integer counter and increment for status assignment
g = [1 : 1 : 150]; #integer counter and increment for detection assignment
i = [1 : 1 : 150]; #integer counter and increment for prevalence
j = [1 : 1 : 150]; #integer counter and increment for sensitivity
while j < 150 # (loop 14)
w = [disease(f)];
if (w == [1])  # (loop 15)
if (((g/sample)) < (sens(j))) # (loop 16)
if (j < sample) # (loop 17)
status(f) = [3]; 
a = a+1;
continue
if (w == [1])  # (loop 18)
if ((g/sample) > (sens(j))) # (loop 19)
status(f) = [4];
b = b + 1;
continue
if (w == [2]) # (loop 20)
if ((g/sample) < (sens(j))) # (loop 21)
status(f) = [5];
c=c+1;
continue
if (w == [2])  # (loop 22)
if ((g/sample) > (sens(j))) # (loop 23) 
status(f) = [6];
d=d+1;
sens(j) = [sens(j) + sensinc]
senst(t) = [sens(j)]
f = f + 1
g = g + 1
i = i + 1
j = j + 1
end #(end loop 14)
end #(end loop 15)
end #(end loop 16)
end #(end loop 17)
end #(end loop 18)
end #(end loop 19)
end #(end loop 20)
end #(end loop 21)
end #(end loop 22)
end #(end loop 23)
# end sensitivity workhorse
# specificity loop
f = [1 : 1 : 150]; #integer counter and increment for status assignment
g = [1 : 1 : 150]; #integer counter and increment for detection assignment
i = [1 : 1 : 150]; #integer counter and increment for prevalence
k = [1 : 1 : 150]; #integer counter and increment for specificity
while k < 150  # (loop 24) 
w = [disease(f)];
if (w == [1])   # (loop 25) 
if ((g/sample) < (spec(k))) # (loop 26) 
if (i < sample)  # (loop 27) 
status(f) = [3]; 
a = a+1;
continue
if (w == [1])   # (loop 28) 
if (((g/sample) > (spec(k))))  # (loop 29) 
status(f) = [4];
b = b + 1;
continue
if (w == [2])   # (loop 30]) 
if ((g/sample) < (spec(k)))  # (loop 31) 
status(f) = [5];
c=c+1;
continue
if (w == [2])  # (loop 32) 
if ((g/sample) > (spec(k)))  # (loop 33) 
status(f) = [6];
d=d+1;
spec(k) = [spec(k) + specinc]
spect(t) = [spec(k)]
continue
f = f + 1;
g = g + 1;
i = i + 1;
k = k + 1;
end #(end loop 24)
end #(end loop 25)
end #(end loop 26)
end #(end loop 27)
end #(end loop 28)
end #(end loop 29)
end #(end loop 30)
end #(end loop 31)
end #(end loop 32)
end #(end loop 33)
#end of individual calculations loop
#######################################
# begin graphics loop
#######################################
#if ( mod(l,1) == 0) # (begin loop 2 aka graphics loop)
tp(t) = [a];
fp(t) = [b];
fn(t) = [c];
tn(t) = [d];
ttp(t)=[a+b];
ttn(t)=[c+d];
pop(t) = [a + b + c + d];
vtpOfp(t) = [((tp(a))/(fp(b)))];
vfnOtn(t) = [((fn(c))/(tn(d)))];
prevt(t) = [a + c / (a + b + c + d)];
senst(t) = [a  / (a + c)];
spect(t) = [d / (b + d)];
#x = vtpOfp(l);
#y = vfnOtn(l);
xx = [(1 - [spect(t)])];
yy = [senst(t)];
#continue
t = t + 1;
#endif # (end loop 2 aka graphics loop)
tx = ty = linspace (-0.2, 1.2, 15)';
[xx, yy] = meshgrid (tx, ty);
tz = [prevt(t)];
mesh (xx,yy,tz);
endwhile # (end loop 1)
xlabel ("1 - specificity");
ylabel ("sensitivity");
zlabel ("prevalence");
title ("CRC prevalence ROC plot");





