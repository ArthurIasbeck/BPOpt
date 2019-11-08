init;

% Inicialização de variáveis
results = zeros(100,3);
k = 1;
% Função objetivo e restrições
f = @fObj;
c = @const;
% Restrições de desigualdade
A = [];
b = [];
% Restrições de igualdade
Aeq = [];
beq = [];
% Limites laterais
h = 0.1625;
hc = 0.084;
hm = 0.0425;
db = 0.2;
dm = 0.029;
Dm = 0.051;
rc = 0.013;

lb = [0, rc+Dm];
ub = [sqrt((db-dm)^2+(h-hm-hc)^2), db-dm];

for x01 = linspace(0,0.1,10)
    for x02 = linspace(0,0.15,10)
        % Palpite inicial
        x0 = [x01, x02];
        % Processo de otimização
        [x, fval] = fmincon(f,x0,A,b,Aeq,beq,lb,ub,c);
        results(k, 1:2) = x;
        results(k, 3) = fval;
        k = k + 1;
    end
end

disp('Fim da execução');