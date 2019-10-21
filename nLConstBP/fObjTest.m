% Primeiro fazer tudo com graus e depois mudar pra radianos

h = 0.1625;
hm = 0.0425;
hc = 0.084;
d3 = 0.15;
r = 0.02;
h0 = 0.03;

thetaR = 0;
m = 0.10;
l1 = 0.05;

thetaM = pi/180*linspace(-30,30);
% thetaM = 30;
% thetaN = atan((h - hm - hc)/m);
theta = thetaR - thetaN + thetaM;

gama = link4(theta,m,thetaR,l1);

% O código abaixo foi implementado dentro da função link 4 ================
% l0 = sqrt((h - hm - hc)^2 + (m)^2);
% l2 = sqrt((l1*cos(thetaR) + d3 - m - r)^2 + ...
%     (h - hm - l1*sin(thetaR) - h0)^2);
% l3 = sqrt(hc^2 + d3^2);
% 
% k1 = -2*l1*l3*sin(theta);
% k2 = 2*l3*(l0 - l1*cos(theta));
% k3 = l0^2 + l1^2 - l2^2 + l3^2 - 2*l0*l1*cos(theta);
% 
% if any((k1.^2 + k2.^2 - k3.^2) < 0)
%     f = Inf;
%     return;
% end
% 
% phi = 2*atan((-k1 - sqrt(k1.^2 + k2.^2 - k3.^2))./(k3 - k2));
% 
% gama0 = atan2(hc,d3);
% gama = pi - phi - gama0 - thetaN
% =========================================================================

gamaL = pi/180*linspace(-30,30);

e = (gama - gamaL).^2; % Diferença entre a aproximação linear e os valores reais
dTheta = theta(2) - theta(1); % Cálculo do incremento de theta
ie = sum(e*dTheta); % Cálculo da integral do erro
f = ie; % Valor da função objetivo