function J = Jx(X,t)
% Esta es la implementacion de Mx
% El resultado es un vector de la evaluacion de x en el tiempo t
    J = [X(1,3).*t.*exp(X(1,1).*t), X(1,4).*t.*exp(X(1,2).*t), exp(X(1,1).*t), exp(X(1,2).*t)];
end

