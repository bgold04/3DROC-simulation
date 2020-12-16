% script dec15.m
% gnu octave program to simulate prevalence, sensitivity and specificity 
% using an octave surface plot, over the range of possible values
% Bert Gold, December 2020
a = 1; %integer counter and increment for true positives
b = 1; %integer counter and increment for false positives
c = 1; %integer counter and increment for true negatives
d = 1; %integer counter and increment for false negative
e = 1; %set inital value of some variables
f = [1 : 1 : 150]; %integer counter and increment for status assignment
ff = 150;
g = [1 : 1 : 150]; %integer counter and increment for detection assignment
h = 1; %integer counter and increment for detection assignment under a given sensitivity and specificity
i = [1 : 1 : 150]; %integer counter and increment for prevalence
j = [1 : 1 : 150]; %integer counter and increment for sensitivity
k = [1 : 1 : 150]; %integer counter and increment for specificity
aff = 0; % number of affecteds assigned
nor = 0; % number of normals assigned
l = [1 : 1 : 22351]; % go back to 22500
l = 1;
m = 1; % 1 stands for affected {"affect"};
n = 2; % 2 stands for normal {"normal"};
o = 3; %{"daffec"};
p = 4; %{"uaffec"};
q = 5; %{"dnorma"};
r = 6; %{"unorma"};
s = 7; %{"normal"};
t = [1 : 1 : 3307800]; % replace with 3307800 when working
kounter = 0; %initial value of fractional counter and increment for values between 0.02 and 150
%kounter2 = 1;
sample = 150; % number of individuals tested in simulation
isample = 1/sample; % multiplicative inverse of sample
maxprev = 0.498; % maximum sample prevalence
minprev = 0.2; % minimum or initial sample prevalence
maxsens = 0.998; % set maximum test sensitivity
minsens = 0.7; % set minimum or initial test sensitivity
maxspec = 0.998; % set maximum test specificity
minspec = 0.7; % set minimum or initial test specificity
iprev = minprev;
isens = minsens;
ispec = minspec;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
previnc = ((maxprev - minprev)/(sample)); % set prevalence increment
disp (previnc)
sensinc = ((maxsens - minsens)/(sample)); % set sensitivity increment
disp (sensinc)
specinc = ((maxspec - minspec)/(sample)); % set specificity increment
disp (specinc)
disinc = 0; % set disease increment to 0
prev(i) = [iprev]; %increment initial prevalence by the multiplicative inverse of the sample size
sens(j) = [isens]; %increment initial sensitivity by the multiplicative inverse of the sample size
spec(k) = [ispec]; %increment initial specificity by the multiplicative inverse of the sample size
% prevalence loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prev(i) = [0.2 : 0.002 : 0.498];
disp ("Current value of prev(i) is: "), disp (prev(i)) 
if (prev(i) ~= maxprev)
prev(i) = [prev(i) + previnc];
dispv = prev(i); 
i = i + 1;
disp ("Current value of prev(i) is: "), disp (dispv) 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sensitivity loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sens(j) = [0.7 : 0.002 : 0.998];
disp ("Current value of sens(j) is:"), disp (sens(j)) 
if (sens(j) ~= maxsens)
sens(j) = [sens(j) + sensinc];
dissev = sens(j);
j = j + 1;
disp ("Current value of sens(j) is: "), disp (dissev)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% specificity loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
spec(k) = [0.7 : 0.002 : 0.998];
disp ("Current value of spec(k) is: "), disp (spec(k))
if (spec(k) ~= maxspec)
spec(k) = [spec(k) + specinc];
disspv = spec(k);
k = k + 1;
disp ("Current value of spec(k) is: "), disp (disspv)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%permute prevalence, sensitivity and specificity values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%v = [[0.2 0.202 0.204 0.206 0.208 0.21 0.212 0.214 0.216 0.218 0.22 0.222 0.224 0.226 0.228 0.23 0.232 0.234 0.236 0.238 0.24 0.242 0.244 0.246 0.248 0.25 0.252 0.254 0.256 0.258 0.26 0.262 0.264 0.266 0.268 0.27 0.272 0.274 0.276 0.278 0.28 0.282 0.284 0.286 0.288 0.29 0.292 0.294 0.296 0.298 0.3 0.302 0.304 0.306 0.308 0.31 0.312 0.314 0.316 0.318 0.32 0.322 0.324 0.326 0.328 0.33 0.332 0.334 0.336 0.338 0.34 0.342 0.344 0.346 0.348 0.35 0.352 0.354 0.356 0.358 0.36 0.362 0.364 0.366 0.368 0.37 0.372 0.374 0.376 0.378 0.38 0.382 0.384 0.386 0.388 0.39 0.392 0.394 0.396 0.398 0.4 0.402 0.404 0.406 0.408 0.41 0.412 0.414 0.416 0.418 0.42 0.422 0.424 0.426 0.428 0.43 0.432 0.434 0.436 0.438 0.44 0.442 0.444 0.446 0.448 0.45 0.452 0.454 0.456 0.458 0.46 0.462 0.464 0.466 0.468 0.47 0.472 0.474 0.476 0.478 0.48 0.482 0.484 0.486 0.488 0.49 0.492 0.494 0.496 0.498] [0.7 0.702 0.704 0.706 0.708 0.71 0.712 0.714 0.716 0.718 0.72 0.722 0.724 0.726 0.728 0.73 0.732 0.734 0.736 0.738 0.74 0.742 0.744 0.746 0.748 0.75 0.752 0.754 0.756 0.758 0.76 0.762 0.764 0.766 0.768 0.77 0.772 0.774 0.776 0.778 0.78 0.782 0.784 0.786 0.788 0.79 0.792 0.794 0.796 0.798 0.8 0.802 0.804 0.806 0.808 0.81 0.812 0.814 0.816 0.818 0.82 0.822 0.824 0.826 0.828 0.83 0.832 0.834 0.836 0.838 0.84 0.842 0.844 0.846 0.848 0.85 0.852 0.854 0.856 0.858 0.86 0.862 0.864 0.866 0.868 0.87 0.872 0.874 0.876 0.878 0.88 0.882 0.884 0.886 0.888 0.89 0.892 0.894 0.896 0.898 0.9 0.902 0.904 0.906 0.908 0.91 0.912 0.914 0.916 0.918 0.92 0.922 0.924 0.926 0.928 0.93 0.932 0.934 0.936 0.938 0.94 0.942 0.944 0.946 0.948 0.95 0.952 0.954 0.956 0.958 0.96 0.962 0.964 0.966 0.968 0.97 0.972 0.974 0.976 0.978 0.98 0.982 0.984 0.986 0.988 0.99 0.992 0.994 0.996 0.998] [0.7 0.702 0.704 0.706 0.708 0.71 0.712 0.714 0.716 0.718 0.72 0.722 0.724 0.726 0.728 0.73 0.732 0.734 0.736 0.738 0.74 0.742 0.744 0.746 0.748 0.75 0.752 0.754 0.756 0.758 0.76 0.762 0.764 0.766 0.768 0.77 0.772 0.774 0.776 0.778 0.78 0.782 0.784 0.786 0.788 0.79 0.792 0.794 0.796 0.798 0.8 0.802 0.804 0.806 0.808 0.81 0.812 0.814 0.816 0.818 0.82 0.822 0.824 0.826 0.828 0.83 0.832 0.834 0.836 0.838 0.84 0.842 0.844 0.846 0.848 0.85 0.852 0.854 0.856 0.858 0.86 0.862 0.864 0.866 0.868 0.87 0.872 0.874 0.876 0.878 0.88 0.882 0.884 0.886 0.888 0.89 0.892 0.894 0.896 0.898 0.9 0.902 0.904 0.906 0.908 0.91 0.912 0.914 0.916 0.918 0.92 0.922 0.924 0.926 0.928 0.93 0.932 0.934 0.936 0.938 0.94 0.942 0.944 0.946 0.948 0.95 0.952 0.954 0.956 0.958 0.96 0.962 0.964 0.966 0.968 0.97 0.972 0.974 0.976 0.978 0.98 0.982 0.984 0.986 0.988 0.99 0.992 0.994 0.996 0.998]];
%P=perms(v);
%A = [prev(i)]
%B = [sens(j)]
%C = [sens(k)]
%[ii,jj,kk]=ndgrid(A,B,C);
%combs = [A(:), B(:), C(:)]
%iii=permute(ii,[prev(i)])
%jjj=permute(jj,[sens(j)])
%kkk=permute(kk,[spec(k)])
%out=[iii(:) jjj(:), kkk(:)];
%[prev(i), sens(j), spec(k)] = meshgrid(A,B,C);
%combs = [prev(i)(:), sens(j)(:), spec(k)(:)]
%A = (prev(i),sens(j),spec(k))
B = combvec (prev(i),sens(j),spec(k));
%B = perms((prev(i)),(sens(j)),(spec(k))));
%B = eye(size([prev(i),sens(j),spec(k)]));
disp ("The different permutations of prevalence, sensitivity and specificity are: "), disp (B)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create truth dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = 1;
disease(f) = 1;
while (f <= (sample + 1))
ss = (-1)^f;
if (ss == -1) && (f <= (2/3)*(sample))
 [disease(f)] = [1];
disp ("disease state is"), disp (disease(f))
else if (ss == 1) && (f <= (2/3)*(sample))
 [disease(f)] = [2];
disp ("disease state is"), disp (disease(f))
else if (f > (2/3)*(sample))
 [disease(f)] = [2];
disp ("disease state is"), disp (disease(f))
    end
    end
end
f = f + 1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% count affecteds
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = 1;
while (f <= 150) %
if (disease(f) == n)%
  nor = nor + 1;
else
  aff = aff + 1;
end
f = f + 1;
end
disp ("number of normals is: "), disp (nor)
disp ("number of affecteds is: "), disp (aff)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%begin loop to generate permutations if there is no other way
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = 1; %integer counter and increment for true positives
b = 1; %integer counter and increment for false positives
c = 1; %integer counter and increment for true negatives
d = 1; %integer counter and increment for false negative
e = 1; %set inital value of some variables
f = 1;
g = 1; 
h = 1;
i = 1;
j = 1;
k = 1;
t = 1;
while (t < 3307800) % (for loop 1a)
disp("The value of t at the beginning of the series, line 157, is: "), disp(t)
onefifty = (150);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end loop for samples between 1 and 149 etc.
%choose if loop of only 150 at a time
%such that l is a step function that only fills in 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Q,R]=quorem(sym(t),sym(onefifty));
if (R == 0) && (l < 22351) % begin loop 2a
disp("The value of l at the end of the series, line 166, is: "), disp(l)
pop(l) = [a + b + c + d];
prevt(l) = [(a + c)/pop(l)];
% using variable (l) for graphing
% generate every possible statistic
tp(l) = a;
fp(l) = b;
fn(l) = c;
tn(l) = d;
ttp(l)=a+b;
ttn(l)=c+d;
pop(l) = a + b + c + d;
vtpOfp(l) = tp(l)/fp(l);
vfnOtn(l) = fn(l)/tn(l);
prevt(l) = [(a + c)/(a + b + c + d)];
senst(l) = [a / (a + c)];
spect(l) = [d / (b + d)];
x = vtpOfp(l);
y = vfnOtn(l);
% set all variables back to 1
a = 1; %integer counter and increment for true positives
b = 1; %integer counter and increment for false positives
c = 1; %integer counter and increment for true negatives
d = 1; %integer counter and increment for false negative
e = 1; %set inital value of some variables
f = 1;
g = 1; 
h = 1;
i = 1;
j = 1;
k = 1;
    else
% prevalence loop
while ((a + b + c + d) < 150) % (loop 3a)
w = [disease(f)];
disp(w)
if (w == 1) % (loop 4a)
    if ((g/sample) < (prev(i))) % (loop 5a)
        if (i < sample) % (loop 6a)
            status(f) = 3; 
            a = a+1;
            g = g + 1;
            i = i + 1;
        end % (end loop 6a)
    end % (end loop 5a)
end % (end loop 4a)  
if (w == 1)  % (loop 7a)
    if ((g/sample) > (prev(i))) % (loop 8a)
            status(f) = 4;
            b = b + 1;
            g = g + 1;
            i = i + 1;
    end % (end loop 8a)
end % (end loop 7a)
if (w == 2) % (loop 9a)
    if ((g/sample) < (prev(i))) % (loop 10a)
            status(f) = 5;
            c = c+1;
            g = g + 1;
            i = i + 1;
    end % (end loop 10a)
end % (end loop 9a)
if (w == 2)  % (loop 11a)
   if ((g/sample) > (prev(i))) % (loop 12a)
            status(f) = 6;
            d = d+1;
            g = g + 1;
            i = i + 1;
   end % (end loop 12a)
end % (end loop 11a)
disp(a), disp(b), disp(c), disp(d)
  prev(i) = [prev(i) + previnc];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end first prevalence workhorse 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% begin first sensitivity loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while ((a + b + c + d) < 150) % (loop 13a)
[disease(f)] = w; % w =[disease(f)];
if (w == 1) % (loop 14a)
    if ((g/sample) < (sens(j))) % (loop 15a) 
        if (j < sample) % (loop 16a)
            status(f) = 3; 
            a = a+1;
            g = g + 1;
            j = j + 1;
        end % end loop 16a    
    end % end loop 15a
end % end loop 14a
if (w == 1) % (loop 17a)
    if ((g/sample) > (sens(j))) % (loop 18a)
            status(f) = 4;
            b = b + 1;
            g = g + 1;
            j = j + 1;
    end % end loop 18a
end % end loop 17a
if (w == 2) % (loop 19a)
    if ((g/sample) < (sens(j))) % (loop 20a)
            status(f) = 5;
            c=c+1;
            g = g + 1;
            j = j + 1;
        end % end loop 20a
end %end loop 19a
if (w == 2) % (loop 21a)
    if ((g/sample) > (sens(j))) % (loop 22a) 
            status(f) = 6;
            d=d+1;
            g = g + 1;
            j = j + 1;
    end % end loop 22a
end % end loop 21a
disp(a), disp(b), disp(c), disp(d)
disp(status(f))
sens(j) = [sens(j) + sensinc];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end sensitivity workhorse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% specificity loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while ((a + b + c + d) < 150) % (loop 23a) 
[disease(f)] = w;
if (w == 1) % loop 24a
    if ((g/sample) < (spec(k))) %loop 25a
        if (k < sample)  % (loop 26a) 
            status(f) = 3; 
            a = a+1;
            g = g + 1;
            k = k + 1;   
        end % end loop 26a
    end % end loop 25a
end % end loop 24a
if (w == 1) % (loop 27a) 
    if ((g/sample) > (spec(k)))  % (loop 28a) 
            status(f) = 4;
            b = b + 1;
            g = g + 1;
            k = k + 1; 
    end % (end loop 28a)
end % (end loop 27a)
if (w == 2) % (loop 29a)
    if ((g/sample) < (spec(k)))  % (loop 30a) 
            status(f) = 5;
            c=c+1;
            g = g + 1;
            k = k + 1; 
    end % (end loop 30a)
end % (end loop 29a)
if (w == 2) % (loop 31a)
    if ((g/sample) > (spec(k)))  % (loop 32a) 
            status(f) = 6;
            d=d+1;
            g = g + 1;
            k = k + 1; 
spec(k) = [spec(k) + specinc];
    end % (end loop 32a)
end % end loop 31a
disp(a), disp(b), disp(c), disp(d)
spec(k) = [spec(k) + specinc];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end specificity workhorse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
onefifty = (150);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end loop for samples between 1 and 149 etc.
%choose if loop of only 150 at a time
%such that l is a step function that only fills in 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Q,R]=quorem(sym(t),sym(onefifty));
end % end loop 23a
end % end loop 13a
f = f + 1;
end % end loop 3a
disp("the t value at line 344 is: "), disp(t)
l = l + 1;
end % ( end l loop, loop 2a )
t = t + 1;
end % (end loop 1a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%end loops that calculate and assign at 150 intervals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%end all individual calculations loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% begin meat of graphics loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%xx = transpose(x); does not work
%yy = transpose(y); does not work
%zz = transpose(z); does not work
%mesh((1 - spect(l)),senst(l),prevt(l)); does not work
x = senst(l);
y = 1 - spect(l);
z = prevt(l);
mesh(x,y,z); % does not work
axis([-0.1 1.0 -0.1 1.0 0.1 0.55])
xlabel ("1 - specificity");
ylabel ("sensitivity");
zlabel ("prevalence");
title ("CRC prevalence ROC plot");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function disease = dis(f)
%  dis(f) = ({ 1 | 2 });
%end 
%function status
%  status = ({ 3 | 4 | 5 | 6 });
%end
%function prevl = preva(l)
%  preva(l) = [0.2 : 0.002 : 0.498];
%end
%function specl = speci(l)
%  speci(l) = [0.7 : 0.002 : 0.998];
%end
%function sensl = sensi(l)
% sensi(l) = [0.7 : 0.002 : 0.998];
%end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
