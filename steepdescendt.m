%function [Xi, iter] = steepdescendt(Xo, alfa, error, data)
%Algoritmo Calculo Direcci�n Maximo Descenso.
% Proyecto desarrollado por: Jaime Aristizabal y Juan Felipe G�mez.
  
  
  
%Se cargan las variables necesarias para el desarrollo del algoritmo
convergencia = 1;
convergencia_2 = 1;
iter = 0;
Xi = Xo;
error = 5e-6;
max_iter = 10000;
%alfa=1;

%--------- Calculo Inicial de la funci�n, gradiente y Hessiana ------------
[y, g] = myfun(Xi,data);

F(:,1) = Fx(Xi,data(:,2),data(:,1));
G(:,1) = norm(g);

while  (iter < max_iter) && (convergencia >= error) && (convergencia_2 >= error)
   
    
    %-------- Configuraci�n Direcci�n M�ximo Descenso--------------
    pk = -g';
    %disp('tama�o de g')
    %disp(size(pk))
    %---------------- Calculo del Alfa ----------------------------------
    %alfa = linesearch(Xi,g,pk,data);
    alfa = 1;
    %-----------Calculos de cada iteraci�n X ----------------------------
    Xj = Xi + alfa.*pk;
    iter = iter + 1;
    
    %convergencia = Fx(Xj,data(:,2),data(:,1));
    convergencia = norm(g);
    convergencia_2 = (norm(Xj-Xi)/norm(Xi));
    disp("Convergencia y Convergencia_2")
    disp(convergencia)
    disp(convergencia_2)
    
    %disp("Esto es XJ")
    %disp(Xj)

    
    Xi = Xj;
    
    fsd = (Xi(1,3)*exp(Xi(1,1).*t))+(Xi(1,4)*exp(Xi(1,2).*t));

    %------------------------ C�digo para pintar la gr�fica --------------
    figure(1)
    plot(t,fsd,'r')
    xlabel('t');
    ylabel('y');
    title(['Algoritmo M�ximo Descenso. Iteraciones: ' num2str(iter)]);
    %grid
    hold off

    
    
    
    %------------- Se vuelve a calcular myfun --------------------
    
    [f, g] = myfun(Xi,data);
    
    F(:,iter+1) = Fx(Xj,data(:,2),data(:,1));
    G(:,iter+1) = norm(g);
    
    %--------- Header para la tabla ------------------

    %fprintf('Iter  |          x              |         |f(x)|            |    |x_k - x_(k-1)  | \n');
    %fprintf('-----------------------------------------------------------------------------------\n');
    %fprintf('  %2i  |  % 1.12e   |  % 1.12e    |  % 1.12e    \n',iter,Xi,abs(fsd),num2str(convergencia));  % print output matrix

end

disp(['>>Se encontr� una funci�n objetivo cercana a cero!!!: Se usaron ' num2str(iter) ' iteraciones!']);
        disp(['El Vector X encontrado que soluciona el problema de m�nimos cuadrados es: ' mat2str(Xi)]);




inicial = (Xo(1,3)*exp(Xo(1,1).*t))+(Xo(1,4)*exp(Xo(1,2).*t));
optimo = (Xp(1,3)*exp(Xp(1,1).*t))+(Xp(1,4)*exp(Xp(1,2).*t));


%------------- C�digo para gr�fico inicial ----------------------

hold on
figure(1)
plot(t,inicial,'k')

%------------- C�digo para gr�fico Optimo ----------------------

hold on
figure(1)
plot(t,optimo,'b')


%------------- C�digo para gr�fico puntos data ----------------------

hold on
figure(1)
plot(t,y,'g:x')

%------------- C�digo para las leyendas.
figure(1)
legend('Xk','Xo','X*','y*')

%----------------------------------------------------------------
%------------- C�digo para gr�fico inicial ----------------------

figure(2)
plot(F,'k:o')

%------------- C�digo para gr�fico Optimo ----------------------

hold on
figure(2)
plot(G,'b')


%------------- C�digo para gr�fico puntos data ----------------------

%hold on
%figure(2)
%plot(t,y,'g:x')

%------------- C�digo para las leyendas.
figure(2)
xlabel('Iteraciones');
ylabel('X');
title('Soluci�n al sistema en cada iteraci�n');
legend('F(x)', '||g||')


%------------- C�digo para guardar las tablas
csvwrite('Tabla_F(x)_Steepdescent_Alfa_1.csv',F);
csvwrite('Tabla_G_Steepdescent_Alfa_1.csv',G);