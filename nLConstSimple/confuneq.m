function [c,ceq] = confuneq(x)
% Nonlinear inequality constraints
c = [-x(1) + 1;
     -x(2)];
% Nonlinear equality constraints
ceq = [];