% script wed.m
# gnu octave program to simulate CRC prevalence, sensitivity and specificity 
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
o = {"daffec"};
p = {"uaffec"};
q = {"dnorma"};
r = {"unorma"};
s = {"normal"};
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
specinc = ((maxspec - minspec)/(sample)); # set specificity increment
disinc = 0; # set disease increment to 0
################################
function disease
  disease = ({1 | 2})
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
A = (prev(i),sens(j),spec(k))
B = perms(A,[prev(i) : sens(j) : spec(k)]);
disp ("The different permutations of prevalence, sensitivity and specificity are: "), disp (B)
#####################################
# create truth dataset
#########################
#disease(f) = [1 : 1 : 2]; # dis function has two values, 1 if diseased, 2 if normal
f = 1;
disease(f) = [1];
while (f ~= sample)
#disease(f) = [disease(f) + disinc];
s = (-1)^f;
if (s == -1) && (f <= (2/3)*(sample))
  disease(f) = [1];
disp ("disease state is"), disp (disease(f))
else if (s = 1) && (f > (2/3)*(sample))
  disease(f) = [2];
disp ("disease state is"), disp (disease(f))
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
############################### start second while loop on detecteds this time
f = [1 : 1 : 150]; #integer counter and increment for status assignment
g = [1 : 1 : 150]; #integer counter and increment for detection assignment
i = [1 : 1 : 150]; #integer counter and increment for prevalence
k = [1 : 1 : 150]; #integer counter and increment for specificity
l = 1;
t = 1;
prev(i) = iprev; #increment initial prevalence by the multiplicative inverse of the sample size
sens(j) = isens; #increment initial sensitivity by the multiplicative inverse of the sample size
spec(k) = ispec; #increment initial specificity by the multiplicative inverse of the sample size
while (t < 3307800) # replace with 3307800 when working    (loop 1) 
# prevalence loop
while (i < 150) # (loop 4)
w = disease(f)
  if strcmp(w,m) == (1) # (loop 5)
  if (g/sample < prev (i)) # (loop 6)
  if (i < sample) # (loop 7)
  status(f) = o; 
  a = a+1;
  if strcmp(w,m) == (1)  # (loop 8)
  if (g/sample > prev(i)) # (loop 9)
  status(f) = p;
  b = b + 1;
  if strcmp(w,n) == (1)  # (loop 10)
  if (g/sample < prev(i)) # (loop 11)
  status(f) = q;
  c=c+1;
  if strcmp(w,n) == (1)  # (loop 12)
  if (g/sample > prev(i)) # (loop 13)
  status(f) = r;
  d=d+1;
  prev(i) = prev(i) + previnc;
  prev(l) = prev(i);
++f
++g
++i
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
w = disease(f)
if strcmp(w,m) == (1)  # (loop 15)
if (g/sample < sens(j)) # (loop 16)
if (j < sample) # (loop 17)
status(f) = o; 
a = a+1;
continue
if strcmp(w,m) == (1)  # (loop 18)
if (g/sample > sens(j)) # (loop 19)
status(f) = p;
b = b + 1;
continue
if strcmp(w,n) == (1)  # (loop 20)
if (g/sample < sens(j)) # (loop 21)
status(f) = q;
c=c+1;
continue
if strcmp(w,n) == (1)  # (loop 22)
if (g/sample > sens(j)) # (loop 23) 
status(f) = r;
d=d+1;
sens(j) = sens(j) + sensinc
++f
++g
++i
++j
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
w = disease(f)
if strcmp(w,m) == (1)   # (loop 25) 
if (g/sample < spec(k)) # (loop 26) 
if (i < sample)  # (loop 27) 
status(f) = o; 
a = a+1;
continue
if strcmp(w,m) == (1)   # (loop 28) 
if (g/sample > spec(k))  # (loop 29) 
status(f) = p;
b = b + 1;
continue
if strcmp(w,n) == (1)   # (loop 30]) 
if (g/sample < spec(k))  # (loop 31) 
status(f) = q;
c=c+1;
continue
if strcmp(w,n) == (1)   # (loop 32) 
if (g/sample > spec(k))  # (loop 33) 
status(f) = r;
d=d+1;
spec(k) = spec(k) + specinc
continue
++f
++g
++i
++k
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
# begin graphics loop
l = t / 450;
if ( mod(l,1) == 0) # (begin loop 2 aka graphics loop)
tp(l) = a;
fp(l) = b;
fn(l) = c;
tn(l) = d;
ttp(l)=a+b;
ttn(l)=c+d;
pop(l) = (a + b + c + d);
vtpOfp(l) = ((tp(a))/(fp(b)));
vfnOtn(l) = ((fn(c))/(tn(d)));
#prev(l) = a + c / (a + b + c + d)
sens(l) = a  / (a + c);
spec(l) = d / (b + d);
#x = vtpOfp(l);
#y = vfnOtn(l);
xx = (1 - spec(l));
yy = sens(l);
tz = prev(l);
endif # (end loop 2 aka graphics loop)
++t
endwhile # (end loop 1)
tx = ty = linspace (-0.2, 1.2, 15)';
[xx, yy] = meshgrid (tx, ty);
mesh (tx,ty,tz);
xlabel ("1 - specificity");
ylabel ("sensitivity");
zlabel ("prevalence");
title ("CRC prevalence ROC plot");




