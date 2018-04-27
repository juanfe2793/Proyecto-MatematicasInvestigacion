function [f,xr] = driver() 
  %Funci�n que carga los datos de la funci�n e invoca las funciones del proyecto.
  
  %---------------------- Carga Datos ---------------- %
  
  data = dlmread('data.csv',';');
  Xo = [-1, -2, 1, -1];
  t = data(:,1);
  optimo = (4*exp(-4*t))-(4*exp(-5*t));
  %inicial = (exp(-t))-(exp(-2*t));
  figure(1)
  %plot(t, inicial)
  plot(t, optimo)
 end