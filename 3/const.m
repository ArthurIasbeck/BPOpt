function [c, ceq] = const(x)

rc = 0.026;
r = 0.01;

l1 = x(1); % Braço do motor
m = x(2); % Distância do motor até o centro da mesa

c = [l1 + r - m + rc + 0.01];
ceq = [];

