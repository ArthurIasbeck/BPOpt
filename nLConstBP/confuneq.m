function [c,ceq] = confuneq(x)

global h;
global hm;
global hc;
global d3;
global r0;
global h0; 
global r;
global cb;
global ct;

thetaR = x(1);
m = x(2);
l1 = x(3);

hr = l1*sin(pi/6 - thetaR);
Hl = l1*sin(pi/6 + thetaR);
ds = l1*cos(pi/6 + thetaR);
dl = m - ds;
dh13 = dl*tg(gama + gama0)

% Nonlinear inequality constraints
c = [m - rc - l1 - r;
     hm  - cb/2 - hr + r;
     Hl + r - h + hm - dh3 + ct/2];
% Nonlinear equality constraints
ceq = [];