% script drocweds.m
# gnu octave program to simulate CRC prevalence, sensitivity and specificity 
# using an octave surface plot, over the range of possible values
# Bert Gold, October 2020
a = 1; #integer counter and increment for true positives
b = 1; #integer counter and increment for false positives
c = 1; #integer counter and increment for true negatives
d = 1; #integer counter and increment for false negative
e = 1; #set inital value of some variables
f = 1; #integer counter and increment for disease assignment
g = 1; #integer counter and increment for detection assignment
h = 1; #integer counter and increment for detection assignment under a given sensitivity and specificity
i = [1 : 1 : 150]; #integer counter and increment for prevalence
j = [1 : 1 : 150]; #integer counter and increment for sensitivity
k = [1 : 1 : 150]; #integer counter and increment for specificity
l = 1; #graphics loop counter
aff = 0; # number of affecteds assigned
nor = 0; # number of normals assigned
m = ("affect");
n = ("normal");
o = ("daffec");
p = ("uaffec");
q = ("dnorma");
r = ("unorma");
s = ("normal");
t = [1 : 1 : 9000]; # replace with 561375500 when working
kounter = 0; #initial value of fractional counter and ioncrement for values between 0.02 and 150
sample = 150; # number of individuals tested in simulation
isample = 1/sample; # multiplicative inverse of sample
maxprev = 0.5; # maximum sample prevalence
minprev = 0.2; # minimum or initial sample prevalence
maxsens = 1.0; # set maximum test sensitivity
minsens = 0.7; # set minimum or initial test sensitivity
maxspec = 1.0; # set maximum test specificity
minspec = 0.7; # set minimum or initial test specificity
###############################################################
previnc = (maxprev - minprev)/sample; # set prevalence increment
sensinc = (maxsens - minsens)/sample; # set sensitivity increment
specinc = (maxspec - minspec)/sample; # set specificity increment
###############################################################
function disease
  disease = regexp('\w{6}')
  endfunction
function prev
 prev = (0.2 : 0.002 : 0.498); # prevalence function
 endfunction
function sens
 sens = (0.7 : 0.002 : 0.998); # sensitivity function
 endfunction
function spec
 spec = (0.7 : 0.002 : 0.998); # specificity function
 endfunction
#function tp
# tp = a ; #initial value of tp matrix 
# endfunction
#function fp
# fp(b) = [b : b : sample]; #initial value of fp matrix
# endfunction
#function tn
# tn(c) = [c : c : sample]; #initial value of tn matrix
# endfunction
#function fn
# fn(d) = [d : d : sample]; #initial value of fn matrix
#endfunction 
function meanprev
 meanprev = (sum (prev(i))) / sample; # obtain mean prevalence
 endfunction
function invprev
 invprev = (1 - meanprev); # arithmetic inverse of prevalance
 endfunction
function meansens
 meansens = (sum (sens(j))) / sample; # obtain mean sensitivity
 endfunction
function invsens
 invsens = (1 - meansens); # arithmetic inverse of sensitivity
 endfunction
function meanspec
 meanspec = (sum (spec(k))) / sample; # obtain mean specificity
 endfunction
function invspec
 invspec = (1 - meanspec); # arithmetic inverse of specificity
 endfunction
function u
  u = {prev,sens,spec}; # descriptors of prevalence, sensitivity and specificity
 endfunction
if (i < sample) 
prev(i)=[0.2 : 0.002 : 0.498];
++i;
endif
if (j < sample)
 sens(j)=[0.7 : 0.002 : 0.998];
++j;
endif
if (k < sample)
 spec(k)=[0.7 : 0.002 : 0.998];
++j;
endif
#####################################
# initialize fraction increment above minimum value
#########################
i = 1
j = 1
k = 1
# start first while loop
while (i <= 150)
if (i = 1)
  disease(i) = n;
  continue
else if (rem (i, 2) == (0))
  disease(i) = m;
  continue
else (rem (i, 3) == (0))
  disease(i) = n;
++i
end
end
# count affecteds
i = 1
while (i <= 150)
	if ((strmatch(disease(i))) == (strmatch(m)))
	aff = aff + 1;
	continue
	else ((strmatch(disease(i))) == (strmatch(n)))
	nor = nor + 1;
++1
end
end
# start second while loop on detecteds this time
f = 1;
g = 1;
i = 1;
j = 1;
k = 1;
prev(i) = iprev + previnc #increment initial prevalence by the multiplicative inverse of the sample size
sens(j) = isens + sensinc #increment initial sensitivity by the multiplicative inverse of the sample size
spec(k) = ispec + specinc #increment initial specificity by the multiplicative inverse of the sample size
summary = {prev(i),sens(j),spec(k)}
while (t <= 9000) # replace with 3307800 when working
# prevalence loop
while prev(i) <= maxprev
if (((strmatch(disease(i))) == (strmatch(m))) & (g/sample <= prev (i)) & (i <= sample))
status(f) = o; 
a = a+1;
continue
else if (((strmatch(disease(i))) == (strmatch(m))) & ((g/sample > prev(i))))
status(f) = p;
b = b + 1;
continue
else if (((strmatch(disease(i))) == (strmatch(n))) & ((g/sample <= prev(i))))
status(f) = q;
c=c+1;
continue
else (((strmatch(disease(i))) == (strmatch(n))) & ((g/sample > prev(i)))) 
status(f) = r;
d=d+1;
prev(i) = prev(i) + previnc
# end prevalence workhorse 
# sensitivity loop
while sens(j) <= maxsens
if (((disease(i)) = m) & (g/sample <= sens(j)) & (j <= sample))
status(f) = o; 
a = a+1;
continue
else if ((disease(i) = m) & ((g/sample > sens(j))))
status(f) = p;
b = b + 1;
continue
else if (((disease(i)) = n) & ((g/sample <= sens(j))))
status(f) = q;
c=c+1;
continue
else (((disease(i)) = n) & ((g/sample > sens(j)))) 
status(f) = r;
d=d+1;
sens(j) = sens(j) + sensinc
# end sensitivity workhorse
# specificity loop
while spec(k) <= maxspec
if (((disease(i)) = m) & (g/sample <= spec(k)) & (i <= sample))
status(f) = o; 
a = a+1;
continue
elseif ((disease(i) = m) & ((g/sample > spec(k))))
status(f) = p;
b = b + 1;
continue
elseif (((disease(i)) = n) & ((g/sample <= spec(k))))
status(f) = q;
c=c+1;
continue
else (((disease(i)) = n) & ((g/sample > spec(k)))) 
status(f) = r;
d=d+1;
spec(k) = spec(k) + specinc
end
k = 1
sens(j) = sens(j) + sensinc
end
j = 1
end
i = i
prev(i) = prev(i) + sensinc
++t
end
end
end
end
# end prevalence, sensitivity, specificity determinations and implications
i = 1
j = 1
k = 1
t = 1
for i = [1 : 1 : 150]
u(t) = {prev(i), sens(j), spec(k)};
++i
++t
end
i=1
for j = [1 : 1: 150]
u(t) = {prev(i), sens(j), spec(k)};
++j
++t
end
j=1
for k = [1 : 1: 150]
u(t) = {prev(i), sens(j), spec(k)};
++k
++t
end
++g
++i
++j
++k
end
ttp=a+b
ttn=c+d
pop = (a + b + c + d); # aka sample
i = 1;
j = 1;
k = 1;
while l <= 150
prev(i) = iprev + previnc; #increment initial prevalence by the multiplicative inverse of the sample size
#sens(j) = a  / (a + c);
#spec(k) = d / (b + d);
vtpOfp(l) = ((tp(a))/(fp(b)));
vfnOtn(l) = ((fn(c))/(tn(d)));
x = vtpOfp(l);
y = vfnOtn(l);
z = prev(i);
x = linspace (-0.2, 1.2, 15);
y = linspace (-0.2, 1.2, 15);
meshgrid (x,y,z);
++i;
++j;
++k;
++l;
end
it = meshc(x,y,z);
waitfor(it);
xlabel ("ratio of true positives to false positives");
ylabel ("ratio of false negatives to true negatives");
zlabel ("prevalence");
title ("CRC prevalence ROC plot");
end;
end;
end
end;


