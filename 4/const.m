function [c, ceq] = const(x)

rc = 0.026;
r = 0.01;
h = 0.1625;
hm = 0.0425;
hc = 0.084;
cb = 0.015;

l1 = x(1); % Braço do motor
m = x(2); % Distância do motor até o centro da mesa

n = atan((h-hc)/m); % Ângulo entre l0 e a horizontal

c = [l1 + r - m + rc + 0.01
     l1*sin(n - pi/6) + r - hm + cb/2];
ceq = [];

