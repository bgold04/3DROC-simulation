% script bertdebug1.m
# gnu octave program to simulate CRC prevalence, sensitivity and specificity 
# using an octave surface plot, over the range of possible values
# Bert Gold, October 2020
#REGEX ERROR BELOW
#
#error: Invalid call to regexp.  Correct usage is:
#
# -- [S, E, TE, M, T, NM, SP] = regexp (STR, PAT)
# -- [...] = regexp (STR, PAT, "OPT1", ...)
#error: called from
#    print_usage at line 91 column 5
#    disease at line 55 column 11
#    debug1 at line 88 column 1
a = [1 : 1 : 75]; #integer counter and increment for true positives
b = [1 : 1 : 75]; #integer counter and increment for false positives
c = [1 : 1 : 75]; #integer counter and increment for true negatives
d = [1 : 1 : 75]; #integer counter and increment for false negative
e = 1; #set inital value of some variables
f = [1 : 1 : 150]; #integer counter and increment for status assignment
g = [1 : 1 : 150]; #integer counter and increment for detection assignment
h = 1; #integer counter and increment for detection assignment under a given sensitivity and specificity
i = [1 : 1 : 150]; #integer counter and increment for prevalence
j = [1 : 1 : 150]; #integer counter and increment for sensitivity
k = [1 : 1 : 150]; #integer counter and increment for specificity
l = 0; #graphics loop counter
aff = 0; # number of affecteds assigned
nor = 0; # number of normals assigned
m = {"affect"};
n = {"normal"};
o = {"daffec"};
p = {"uaffec"};
q = {"dnorma"};
r = {"unorma"};
s = {"normal"};
t = [1 : 1 : 900]; # replace with 3307800 when working
kounter = 0; #initial value of fractional counter and ioncrement for values between 0.02 and 150
sample = 150; # number of individuals tested in simulation
isample = 1/sample; # multiplicative inverse of sample
maxprev = 0.5; # maximum sample prevalence
minprev = 0.2; # minimum or initial sample prevalence
maxsens = 1.0; # set maximum test sensitivity
minsens = 0.7; # set minimum or initial test sensitivity
maxspec = 1.0; # set maximum test specificity
minspec = 0.7; # set minimum or initial test specificity
iprev = minprev;
isens = minsens;
ispec = minspec;
###############################################################
previnc = (maxprev - minprev)/sample; # set prevalence increment
sensinc = (maxsens - minsens)/sample; # set sensitivity increment
specinc = (maxspec - minspec)/sample; # set specificity increment
###############################################################
function disease
  disease = regexp{'\w{6}'}
  endfunction
function status
  status = regexp{'\w{6}'}
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
++k;
endif
#####################################
# initialize fraction increment above minimum value
#########################
f = [1 : 1 : 150]; #integer counter and increment for status assignment
# start first while loop
while (f <= 150) # (while loop a)
if (f == (1))    # (if loop b)
  disease(f) = n;
  ++f
  break
if (rem (f, 2) == (0)) # (if loop c)
  disease(f) = m;
  ++f
  break
if (rem (f, 3) == (0)) # (if loop d)
   disease(f) = n;
   ++f
   break
list_in_columns (disease(f), 6)
endif
endif
endif
endwhile
####################################################
# count affecteds
#i = [1 : 1 : 150]; #integer counter and increment for prevalence
for i = [1 : 1 : 150]; #integer counter and increment for prevalence
while (i < 150)
	if (((strcmp(disease(i),m))) == (1) )
	aff = aff + 1;
	continue
	else (((strcmp(disease(i),n))) == (1) )
	nor = nor + 1;
end
end
# start second while loop on detecteds this time
f = [1 : 1 : 150]; #integer counter and increment for status assignment
g = [1 : 1 : 150]; #integer counter and increment for detection assignment
i = [1 : 1 : 150]; #integer counter and increment for prevalence
k = [1 : 1 : 150]; #integer counter and increment for specificity
prev(i) = iprev + previnc; #increment initial prevalence by the multiplicative inverse of the sample size
sens(j) = isens + sensinc; #increment initial sensitivity by the multiplicative inverse of the sample size
spec(k) = ispec + specinc; #increment initial specificity by the multiplicative inverse of the sample size
while (t <= 3307800) # replace with 3307800 when working    [loop 1]
# prevalence loop
while prev(i) <= maxprev # [loop 2]
if ((strcmp(disease(i),m)) == (1) ) # [loop 3]
if (g/sample <= prev (i)) # [loop 4]
if (i <= sample) # [loop 5]
status(f) = o; 
a = a+1;
continue
continue
continue
if ((strcmp(disease(i),m)) == (1) ) # [loop 6]
if (g/sample > prev(i)) # [loop 7]
status(f) = p;
b = b + 1;
continue
if ((strcmp(disease(i),n)) == (1) ) # [loop 8]
if (g/sample <= prev(i)) # [loop 9]
status(f) = q;
c=c+1;
continue
continue
if ((strcmp(disease(i),n)) == (1) ) # [loop 10]
if (g/sample > prev(i)) # [loop 11]
status(f) = r;
d=d+1;
prev(i) = prev(i) + previnc
++i
++g
continue #[continue loop 2]
continue #[continue loop 3]
continue #[continue loop 4]
continue #[continue loop 5]
continue #[continue loop 6]
continue #[continue loop 7]
continue #[continue loop 8]
continue #[continue loop 9]
continue #[continue loop 10]
continue #[continue loop 11]
end #[end loop 2]
end #[end loop 3]
end #[end loop 4]
end #[end loop 5]
end #[end loop 6]
end #[end loop 7]
end #[end loop 8]
end #[end loop 9]
end #[end loop 10]
end #[end loop 11]
# end prevalence workhorse 
# sensitivity loop
g = [1 : 1 : 150]; #integer counter and increment for detection assignment
i = [1 : 1 : 150]; #integer counter and increment for prevalence
j = [1 : 1 : 150]; #integer counter and increment for sensitivity
while sens(j) <= maxsens # [loop 12]
if ((strcmp(disease(i),m)) == (1) ) # [loop 13]
if (g/sample <= sens(j)) # [loop 14]
if (j <= sample) # [loop 15]
status(f) = o; 
a = a+1;
continue
if ((strcmp(disease(i),m)) == (1) ) # [loop 16]
if (g/sample > sens(j)) # [loop 17]
status(f) = p;
b = b + 1;
continue
if ((strcmp(disease(i),n)) == (1) ) # [loop 18]
if ((g/sample <= sens(j))) # [loop 19]
status(f) = q;
c=c+1;
continue
if ((strcmp(disease(i),n)) == (1) ) # [loop 20]
if (g/sample > sens(j)) # [loop 21] 
status(f) = r;
d=d+1;
sens(j) = sens(j) + sensinc
++g
++i
++j
continue #[continue loop 12]
continue #[continue loop 13]
continue #[continue loop 14]
continue #[continue loop 15]
continue #[continue loop 16]
continue #[continue loop 17]
continue #[continue loop 18]
continue #[continue loop 19]
continue #[continue loop 20]
continue #[continue loop 21]
end #[end loop 12]
end #[end loop 13]
end #[end loop 14]
end #[end loop 15]
end #[end loop 16]
end #[end loop 17]
end #[end loop 18]
end #[end loop 19]
end #[end loop 20]
end #[end loop 21]
# end sensitivity workhorse
# specificity loop
f = [1 : 1 : 150]; #integer counter and increment for status assignment
g = [1 : 1 : 150]; #integer counter and increment for detection assignment
i = [1 : 1 : 150]; #integer counter and increment for prevalence
k = [1 : 1 : 150]; #integer counter and increment for specificity
while spec(k) <= maxspec  # [loop 22] 
if ((strcmp(disease(i),m)) == (1) )  # [loop 23] 
if (g/sample <= spec(k)) # [loop 24] 
if (i <= sample)  # [loop 25] 
status(f) = o; 
a = a+1;
continue
if ((strcmp(disease(i),m)) == (1) )  # [loop 26] 
if (g/sample > spec(k))  # [loop 27] 
status(f) = p;
b = b + 1;
continue
if ((strcmp(disease(i),n)) == (1) )  # [loop 28] 
if (g/sample <= spec(k))  # [loop 29] 
status(f) = q;
c=c+1;
continue
if ((strcmp(disease(i),n)) == (1) )  # [loop 30] 
if (g/sample > spec(k))  # [loop 31] 
status(f) = r;
d=d+1;
spec(k) = spec(k) + specinc
continue
++f
++g
++i
++k
continue #[continue loop 22]
continue #[continue loop 23]
continue #[continue loop 24]
continue #[continue loop 25]
continue #[continue loop 26]
continue #[continue loop 27]
continue #[continue loop 28]
continue #[continue loop 29]
continue #[continue loop 30]
continue #[continue loop 31]
end #[end loop 22]
end #[end loop 23]
end #[end loop 24]
end #[end loop 25]
end #[end loop 26]
end #[end loop 27]
end #[end loop 28]
end #[end loop 29]
end #[end loop 30]
end #[end loop 31]
#end of individual calculations loop
# begin graphics loop
if (l == (0) ) # begin loop 32
break
if ( rem ( (t / 450) == (0) )) # begin loop 33
break
endif # end zero if which is loop 32
++t
continue
endif # [continue loop 33]
while ( l <= 7350) # [begin loop 34] 
ttp(l)=a+b;
ttn(l)=c+d;
pop(l) = (a + b + c + d);
vtpOfp(l) = ((tp(a))/(fp(b)));
vfnOtn(l) = ((fn(c))/(tn(d)));
prev(l) - a + c / (a + b + c + d)
sens(l) = a  / (a + c);
spec(l) = d / (b + d);
x = vtpOfp(l);
y = vfnOtn(l);
z = prev(l);
l=l+450
endwhile
x = linspace (-0.2, 1.2, 15);
y = linspace (-0.2, 1.2, 15);
meshgrid (x,y,z);
it = meshc(x,y,z);
waitfor(it);
xlabel ("ratio of true positives to false positives");
ylabel ("ratio of false negatives to true negatives");
zlabel ("prevalence");
title ("CRC prevalence ROC plot");
end
end
exit
exit
