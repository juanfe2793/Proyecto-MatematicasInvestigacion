function alfa = linesearch(x,g,pk,data)

%Función encargada de calcular un alfa para busqueda lineal
% Proyecto desarrollado por: Jaime Aristizabal y Juan Felipe Gómez.

iteraciones = 100;

for i=0:iteraciones
   
   alfaT = (1/2)^i;
   t = data(:,1);
   y = data(:,2);
   
   value_1 = Fx((x+alfaT*pk),y,t);
   value_2 = Fx(x,y,t) + (10e-4)*alfaT*g*pk;
   
   if value_1 < value_2
      alfa = alfaT;
      break
   end
   
   alfa = alfaT;
end
end