function [f,xr] = newton(func,deri,x0) 

% Aquí se utiliza el método de Newton para encontrar una x * tal que | f (x *) | = 0 
% para un número máximo de iteraciones.

% Entradas:
%
% string func        La función objetivo M(x,t)= x3*exp(x1t)  +  x4*exp(x2t)
% string deri        string with the derivity of the function to evaluate
%                    in term of x
% float  x0          the initial point
% int    max_i       maximun number of iterations
% float  tol         tolerance of the Newton's method

% Output:
%
% A table with the result of the execution with this format:
%
%                     i   |     xi      |  abs(f(xi))
%                   -----------------------------------
%                         |             |

global x_init

fprintf('Iter  |          x              |         |f(x)|            |    |x_k - x_(k-1)| \n');
fprintf('-----------------------------------------------------------------------------------\n');
    %This is the header of the output matrix
              
x_     = x_init;
for i=0:max_i   % This is the statement to begin the iterative process
    
    f   =   eval(func);         %  Function evaluation
    df  =   eval(deri);         %  Derivative evaluation
        
    x_    = x;

    if(abs(f) < tol),                       %This is the stopping criteria  
        fprintf('Solution found!!!\n\n'); 
        fprintf('The solution found: x = %e\n', x); 
        break; 
    end; 
    
    deltax  =   -f/df;           % Find the Newton step. 
    x       =   x + deltax;      % Update x
    
    
    error = abs(x - x_ );        
    fprintf('  %2i  |  % 1.12e   |  % 1.12e    |  % 1.12e    \n',i,x,abs(f),error);  % print output matrix

end 

if i==max_i, 
    fprintf('The solution was not found after %d iterations.\n', max_i); 
end 
    