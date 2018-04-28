function [f, g, H] = myfun(X, data)

t = data(:,1);
y = data(:,2);
f = (X(1,3)*exp(X(1,1).*t))+(X(1,4)*exp(X(1,2).*t));

%--------------- Calculo Jacobiano ------------------------%
J = [X(1,3).*t.*exp(X(1,1).*t), X(1,4).*t.*exp(X(1,2).*t), exp(X(1,1).*t), exp(X(1,2).*t)];
J = -J;


%J = zeros(length(t), 4);    
%for i = 1:length(t)
%        J(i,:) = [-X(1,3)*t(i)*exp(X(1,1)*t(i)) -X(1,4)*t(i)*exp(X(1,2)*t(i)) -exp(X(1,1)*t(i)) -exp(X(1,2)*t(i))];
%    end
 
%-------------- Calculo Residuo -----------------------------%

%m = zeros(length(t), 4)

M=(X(1,3)*exp(X(1,1).*t))+(X(1,4)*exp(X(1,2).*t));

r = y-M;

%----------------- Calculo Gradiente ------------------------%

g = (J')*r;

%---------------- Calculo Hessiana --------------------------%
H = (J')*(J);

figure(2)
plot(t,f);
    
end