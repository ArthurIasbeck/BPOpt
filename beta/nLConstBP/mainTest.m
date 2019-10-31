init;

global h
global hm
global hc
global d3
global r0
global h0
global r
global cb
global ct
global gama0
global rc
global l3

h = 0.1625;
hm = 0.0425;
hc = 0.084;
d3 = 0.15;
r0 = 0.02;
h0 = 0.03;
r = 0.01;
cb = 0.015;
ct = 0.03;
gama0 = atan2(hc,d3);
rc = 0.026;
l3 = sqrt(hc^2 + d3^2);

thetaR = 0;
m = 0.10;
l1 = 0.05;
theta = 30;

x = [0 0.1 0.05];
A = link4(theta,m,thetaR,l1);
B = objfun(x);
C = confuneq(x);
