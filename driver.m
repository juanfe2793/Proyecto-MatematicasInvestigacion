function [f,xr] = driver() 
  %Función que carga los datos de la función e invoca las funciones del proyecto.
  
  %---------------------- Carga Datos ---------------- %
  
  t = xlsread('data.xlsx','data','A2:A21');
  
  y = xlsread('data.xlsx','data','B2:B21');
  
  M = [t,y]
  
  plot (M,'o')
  
  
 end