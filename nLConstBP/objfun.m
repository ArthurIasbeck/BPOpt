function f = objfun(x)

global h;
global hm;
global hc;

thetaR = x(1);
m = x(2);
l1 = x(3);

thetaM = pi/180*linspace(-30,30);
thetaN = atan((h - hm - hc)/m);
theta = thetaR - thetaN + thetaM;

gama = link4(theta,m,thetaR,l1);
gamaL = pi/180*linspace(-30,30);

% Caso não seja possível definir um 'gama' real, a função 'link4' retornará
% inifinito. Neste caso a solução deve ser penalizada ao máximo. 
if gama == Inf
    f = Inf;
    return;
end

e = (gama - gamaL).^2; % Diferença entre a aproximação linear e os valores reais
dTheta = theta(2) - theta(1); % Cálculo do incremento de theta
ie = sum(e*dTheta); % Cálculo da integral do erro
f = ie; % Valor da função objetivo










