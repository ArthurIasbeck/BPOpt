function gama = link4(theta,m,thetaR,l1)

global h;
global hm;
global hc;
global d3;
global r0;
global h0;
global gama0;

l0 = sqrt((h - hm - hc)^2 + (m)^2);
l2 = sqrt((l1*cos(thetaR) + d3 - m - r0)^2 + ...
    (h - hm - l1*sin(thetaR) - h0)^2);
l3 = sqrt(hc^2 + d3^2);

k1 = -2*l1*l3*sin(theta);
k2 = 2*l3*(l0 - l1*cos(theta));
k3 = l0^2 + l1^2 - l2^2 + l3^2 - 2*l0*l1*cos(theta);

phi = 2*atan((-k1 - sqrt(k1.^2 + k2.^2 - k3.^2))./(k3 - k2));

gama = pi - phi - gama0 - thetaN;