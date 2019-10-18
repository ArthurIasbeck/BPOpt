x0 = [-1,1]; % Make a starting guess at the solution
options = optimoptions(@fmincon,'Algorithm','sqp');
[x,fval] = fmincon(@objfun,x0,[],[],[],[],[],[],... 
   @confuneq,options);
[c,ceq] = confuneq(x);% Check the constraint values at x

clc;
disp('x');
disp(x);
disp('fval');
disp(fval);
disp('c');
disp(c);
disp('ceq');
disp(ceq);
