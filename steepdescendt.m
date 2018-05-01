%function [Xi, iter] = steepdescendt(Xo, alfa, error, data)
%Algoritmo Calculo Dirección Maximo Descenso.
% Proyecto desarrollado por: Jaime Aristizabal y Juan Felipe Gómez.
  
  
  
%Se cargan las variables necesarias para el desarrollo del algoritmo
convergencia = 1;
iter = 0;
Xi = Xo;
error = 1e-6;
alfa = 1;


%--------- Calculo Inicial de la función, gradiente y Hessiana ------------
[f, g, Hn] = myfun(Xi,data);

while  (iter < 10000) && (convergencia >= error)
   
    %cadena = sprintf('iteracion No:', iter);
    %disp(iter)
    
    %-------- Configuración Dirección Máximo Descenso--------------
    pk = -g';
    disp('tamaño de g')
    disp(size(pk))
    
    %-----------Calculos de cada iteración X ----------------------------
    Xj = Xi + alfa.*pk;
    iter = iter + 1;
    
    convergencia = norm(Xj - Xi);
    disp("Convergencia")
    disp(convergencia)
    
    disp("Esto es XJ")
    disp(Xj)

    
    Xi = Xj;
    
    fsd = (Xi(1,3)*exp(Xi(1,1).*t))+(Xi(1,4)*exp(Xi(1,2).*t));
    
    %------------------------ Código para pintar la gráfica --------------
    figure(1)
    plot(t,fsd,'r')
    xlabel('t');
    ylabel('y');
    title(['Algoritmo Máximo Descenso. Iteraciones: ' num2str(iter)]);
    %grid
    hold off

    %------------- Se vuelve a calcular myfun --------------------
    
    [f, g, Hn] = myfun(Xi,data);
end


inicial = (Xo(1,3)*exp(Xo(1,1).*t))+(Xo(1,4)*exp(Xo(1,2).*t));
optimo = (Xp(1,3)*exp(Xp(1,1).*t))+(Xp(1,4)*exp(Xp(1,2).*t));


%------------- Código para gráfico inicial ----------------------

hold on
figure(1)
plot(t,inicial,'k')

%------------- Código para gráfico Optimo ----------------------

hold on
figure(1)
plot(t,optimo,'b')


%------------- Código para gráfico puntos data ----------------------

hold on
figure(1)
plot(t,y,'g:x')

%------------- Código para las leyendas.
figure(1)
legend('Xk','Xo','X*','y*')

%end