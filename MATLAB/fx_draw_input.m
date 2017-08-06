clc;
clear;
close('all');
fclose('all');

% By: Mahmoud Pouremhrab
% Email: mpourmehrab@ufl.edu

%% Path management
p = pwd;
f = filesep;

addpath(genpath([p f 'trajectory-optimizer']));
Name = '13thAND16th';
load(strcat(Name,'Config'));
t0 = 0;
d0 = 1000;
V0 = 40; VcrMax = 30; Vmax = 50;
maxDecc = -2; maxAcc = 2;
G= [0,1000];

[ t1, t2, t3, V2, a1, a3, T, feas ] = NonlinLTOsolver(  d0 , V0 , VcrMax , Vmax , maxDecc , maxAcc , G, simParameters  );

% -1000+((2*(x-0)^2)/2+40(x-0)) (0,5)
% -775+(61.7448(x-0.5517)) (0.5517,7.4740)

t = t0;
V = V0;
d = -d0 ;
fprintf('%3.3f+((%3.3f*(x-%3.3f)^2)/2+%3.3f(x-%3.3f)) (%3.3f,%3.3f)\n',d,a1,t,V0,t,t,t+t1 );
t = t+t1;
V = V0+a1*t1;
d = d + (0.5*a1*(t-t0)^2+V0*t1);
fprintf('%3.3f+(%3.3f(x-%3.3f)) (%3.3f,%3.3f)\n',d,V,t,t,t+t2 );
V = V;
d = d + V * t2;
t = t + t2;
fprintf('%3.3f+((%3.3f*(x-%3.3f)^2)/2+%3.3f(x-%3.3f)) (%3.3f,%3.3f)\n',d,a3,t,V,t,t,t+t3 );
display('')




