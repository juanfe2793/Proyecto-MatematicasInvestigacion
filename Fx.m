function out = Fx(x,y,t)
%% Funciones M y Matriz Jacobiana
funcionMx = @Mx;
Mxt = feval(funcionMx, x, t);    
out = 0.5*(norm(y-Mxt)^2);
end

