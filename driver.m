function [f,xr] = driver() 
  %Funci�n que carga los datos de la funci�n e invoca las funciones del proyecto.
  
  %---------------------- Carga Datos ---------------- %
  
  t = xlsread('data.xlsx','data','A2:A21');
  
  y = xlsread('data.xlsx','data','B2:B21');
  
  M = [t,y]
  
  plot (M,'o')
  
  
 end