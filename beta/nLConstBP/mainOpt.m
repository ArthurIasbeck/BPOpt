init; 

% thetaR -> x(1);
% m -> x(2);
% l1 -> x(3);

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

dm = 0.05;
db = 0.2;

% x0 = [0,0,0]; % Make a starting guess at the solution
% Verificar configurações do solver, número de iterações e tolerância
options = optimoptions(@fmincon,'Algorithm','sqp');

% lb = [-2*pi, 0, 0];
% ub = [2*pi, db - dm, Inf];

lb = [0, 0];
ub = [db - dm, Inf];


x0 = lb' + (ub - lb)'.*rand(2,1);
x0(2) = 5*rand; % Evitamos com esta operação que x0(3) seja infinito

% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options) -> Forma da função
% [x,fval] = fmincon(@objfun,x0,[],[],[],[],lb,ub,... 
%    @confuneq,options);
[x,fval] = fmincon(@objfun,x0,[],[],[],[],lb,ub);
[c,ceq] = confuneq(x);% Check the constraint values at x

clc;
disp('x');
disp(x);
disp('fval');
disp(fval);
% disp('c');
% disp(c);
% Nosso problema não apresenta restrições de igualdade
% disp('ceq');
% disp(ceq);

%% Verificando o resultado obtido 

% thetaR = x(1);
% m = x(2);
% l1 = x(3);

thetaR = 20*pi/180;
m = x(1);
l1 = x(1);

thetaM = pi/180*linspace(-30,30);
thetaN = atan((h - hm - hc)/m);
theta = thetaR - thetaN + thetaM;
gama = link4(theta,m,thetaR,l1);
gamaL = pi/180*linspace(-30,30);

plot(gamaL, gamaL); hold on;
plot(gamaL, gama);