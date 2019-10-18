function f = objfun(x)

global h;
global hm;
global hc;
global d3;
global r0;
global h0; 
global gama0;

thetaR = x(1);
m = x(2);
l1 = x(3);

thetaM = pi/180*linspace(-30,30);
thetaN = atan((h - hm - hc)/m);
theta = thetaR - thetaN + thetaM;

l0 = sqrt((h - hm - hc)^2 + (m)^2);
l2 = sqrt((l1*cos(thetaR) + d3 - m - r0)^2 + ...
    (h - hm - l1*sin(thetaR) - h0)^2);
l3 = sqrt(hc^2 + d3^2);

k1 = -2*l1*l3*sin(theta);
k2 = 2*l3*(l0 - l1*cos(theta));
k3 = l0^2 + l1^2 - l2^2 + l3^2 - 2*l0*l1*cos(theta);

% É interessante que esta restrição esteja aqui porque ela não pode ser
% violada nem mesmo levemente, algo que pode acontecer quando inserimos
% restrições utilizando os métodos tradicionais (como o SQP por exemplo que
% é o método implementado pela função fmincon).
if any((k1.^2 + k2.^2 - k3.^2) < 0)
    f = Inf;
    return;
end

phi = 2*atan((-k1 - sqrt(k1.^2 + k2.^2 - k3.^2))./(k3 - k2));


gama = pi - phi - gama0 - thetaN;
gamaL = pi/180*linspace(-30,30);

e = (gama - gamaL).^2; % Diferença entre a aproximação linear e os valores reais
dTheta = theta(2) - theta(1); % Cálculo do incremento de theta
ie = sum(e*dTheta); % Cálculo da integral do erro
f = ie; % Valor da função objetivo










