function [c,ceq] = confuneq(x)

% Notação adotada
% ds -> d*
% dl -> d' 

global h
global hm
global hc
global r
global cb
global ct
global gama0
global rc
global l3

thetaR = x(1);
m = x(2);
l1 = x(3);

hr = l1*sin(pi/6 - thetaR);
Hl = l1*sin(pi/6 + thetaR);
ds = l1*cos(pi/6 + thetaR);
dl = m - ds;

thetaM = pi/180*30;
thetaN = atan((h - hm - hc)/m);
theta = thetaR - thetaN + thetaM;
gama = link4(theta,m,thetaR,l1);
dh13 = dl*tan(gama + gama0);

Ds = dl/cos(gama + gama0);

hs = hc*Ds/l3;
dh23 = hs/cos(gama);

dh3 = dh13 + dh23;

% Nonlinear inequality constraints
% c = [m - rc - l1 - r;
%      hm  - cb/2 - hr + r;
%      Hl + r - h + hm - dh3 + ct/2];
c = [];
% Nonlinear equality constraints
ceq = [];