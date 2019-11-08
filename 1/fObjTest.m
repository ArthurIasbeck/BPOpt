clc; clear;

x = [0.073479 0.064205]; 

l1 = x(1); % Braço do motor
m = x(2); % Distância do motor até o centro da mesa

nData = 100;
l3 = 0.15; % Metade do comprimento da mesa
h = 0.1625; % Altura da mesa
hm = 0.0425;
thetaMValues = linspace(-pi/6,pi/6,nData); % Angulos que o motor assume
gamaValues = zeros(nData,1); % Vetor que guarda os valores de inclinação da mesa

n = atan((h-hm)/m); % Ângulo entre l0 e a horizontal
l0 = sqrt((h - hm)^2 + m^2);
l2 = sqrt((l0 - l1)^2 + l3^2 - 2*l3*(l0-l1)*cos(n));

for j = 1:nData
    thetaM = thetaMValues(j);
    theta = thetaM;
    k1 = -2*l1*l3*sin(theta);
    k2 = 2*l3*(l0 - l1*cos(theta));
    k3 = l0^2 + l1^2 - l2^2 + l3^2 - 2*l0*l1*cos(theta);
    phi = 2*atan((-k1 - sqrt(k1^2 + k2^2 - k3^2))/(k3 - k2));
    gama = pi - n - phi;
    gamaValues(j) = gama;
end

linGama = linspace(-pi/6,pi/6,nData)'; % Reta de 45º que relaciona theta e gamma

e = (gamaValues - linGama).^2; % Diferença entre a aproximação linear e os valores reais
dTheta = thetaMValues(2) - thetaMValues(1); % Cálculo do incremento de theta
ie = sum(e*dTheta); % Cálculo da integral do erro
f = ie; % Valor da função objetivo

% Apresentação gráfica dos resultados
figure;
plotI(thetaMValues*180/pi, gamaValues*180/pi, '-'); hold on;
plotI(thetaMValues*180/pi, linGama*180/pi, '-');
xlabelI('$\theta$ ($^o$)');
ylabelI('$\gamma$ ($^o$)');
cropPlotI;
printI('bracoOtimizado');

% Relatório
fprintf('Braço do motor = %f cm \n', l1*100);
fprintf('Braço auxiliar = %f cm \n', l2*100);
fprintf('Posição do motor = %f cm \n', m*100);
fprintf('Valor da função objetivo = %f \n', f);