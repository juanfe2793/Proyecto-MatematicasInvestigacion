function [y, g, Hn, Hlm, uk] = myfun(X, data)

%Función que carga los datos de la función y calcula todo.
% Proyecto desarrollado por: Jaime Aristizabal y Juan Felipe Gómez.

t = data(:,1);
y = data(:,2);

%--------------- Calculo Jacobiano ------------------------%
J = Jx(X,t);
J = -J;

 
%-------------- Calculo Residuo -----------------------------%


M = Mx(X,t);
r = y-M;

%----------------- Calculo Gradiente ------------------------%

g = (J')*r;

%---------------- Calculo Hessiana Newton --------------------------%

 Hn = (J')*(J);

%---------------- Calculo Hessiana Levenberg-Manquardt --------------------------%

 uk=(10e-3)*max(diag(Hn));
 Hlm = Hn + uk*eye(length(Hn));
 disp(size(uk))           
%figure(2)
%plot(t,f);


    
end