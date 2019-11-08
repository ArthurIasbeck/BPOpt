function [c, ceq] = const(x)

rc = 0.013;
r = 0.01;
h = 0.1625;
hm = 0.0425;
hc = 0.054;
cb = 0.015;

l1 = x(1); % Braço do motor
m = x(2); % Distância do motor até o centro da mesa

n = atan((h-hm-hc)/m); % Ângulo entre l0 e a horizontal

c = [l1 + r - m + rc
     l1*sin(n - pi/6) + r - hm + cb/2];
ceq = [];

