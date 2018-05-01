function [f, g, Hn] = myfun(X, data)

%Función que carga los datos de la función y calcula todo.
% Proyecto desarrollado por: Jaime Aristizabal y Juan Felipe Gómez.

t = data(:,1);
y = data(:,2);
f = (X(1,3)*exp(X(1,1).*t))+(X(1,4)*exp(X(1,2).*t));

%--------------- Calculo Jacobiano ------------------------%
J = [X(1,3).*t.*exp(X(1,1).*t), X(1,4).*t.*exp(X(1,2).*t), exp(X(1,1).*t), exp(X(1,2).*t)];
J = -J;

 
%-------------- Calculo Residuo -----------------------------%


M=(X(1,3)*exp(X(1,1).*t))+(X(1,4)*exp(X(1,2).*t));

r = y-M;

%----------------- Calculo Gradiente ------------------------%

g = (J')*r;

%---------------- Calculo Hessiana Newton --------------------------%

 Hn = (J')*(J);

%---------------- Calculo Hessiana Levenberg-Manquardt --------------------------%

 uk=1e-6
 Hlm = Hn + uk*eye(length(Hn));
            
%figure(2)
%plot(t,f);


    
end