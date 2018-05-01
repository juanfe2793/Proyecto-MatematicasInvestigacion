function [data,t,y,Xo] = driver() 
  %Funci�n que carga los datos de la funci�n e invoca las funciones del proyecto.
  % Proyecto desarrollado por: Jaime Aristizabal y Juan Felipe G�mez.
  
  %---------------Limpiar todo-----------------------%
  
  clc, clear all, close all
  
  %---------------------- Carga Datos ---------------- %
  
  data = dlmread('data.csv',';');
  Xo = [-1, -2, 1, -1];
  Xp = [-4 -5 4 -4];
  t = data(:,1);
  y = data(:,2);
  %optimo = (4*exp(-4*t))-(4*exp(-5*t));
  %inicial = (exp(-t))-(exp(-2*t));
 
 
  %figure(1)
  %plot(t, inicial)
  
  eleccion = input('Indique el Algoritmo que desea usar \n1. Direcci�n M�ximo Descenso\n2. Algoritmo de Newton\n3. Algoritmo de Levenberg-Manquardt\n>>>>>>>>>>')

switch eleccion
        case 1
            steepdescendt;
        case 2
            newton;
        case 3
            levenberg;
            
end
  
  
  %plot(t, optimo)
 end