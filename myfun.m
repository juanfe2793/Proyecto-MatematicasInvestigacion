function [f, g, H] = myfun(X, data)

t = data(:,1);
f = (X(1,3)*exp(X(1,1).*t))+(X(1,4)*exp(X(1,2).*t));

J = [X(1,3).*t.*exp(X(1,1).*t), X(1,4).*t.*exp(X(1,2).*t), exp(X(1,1).*t), exp(X(1,2).*t)];
J = -J;

g = (J')*f;


H = (J')*(J);

figure(2)
plot(f);
    
end