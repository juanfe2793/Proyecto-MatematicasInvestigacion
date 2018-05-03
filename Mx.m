function y = Mx(x,t)
% Esta es la implementacion de Mx
% El resultado es un vector de la evaluacion de x en el tiempo t

    y = x(3)*exp(x(1)*t) + x(4)*exp(x(2)*t);
end

