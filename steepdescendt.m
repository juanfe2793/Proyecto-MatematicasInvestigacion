function [Xi, iter] = steepdescendt(Xo, alfa, error, data)

convergencia = 1;
iter = 0;
Xi = Xo;

t = data(:,1);

[f, g, H] = myfun(Xo,data);

while (iter < 1000) && (convergencia >= error)
    
    %cadena = sprintf('iteracion No:', iter);
    %disp(iter)
    
    pk = -g';
    
    Xj = Xi + alfa.*pk;
    iter = iter + 1;
    
    convergencia = norm(Xj - Xi);
    disp("Convergencia")
    disp(convergencia)
    
    disp("Esto es XJ - Xi")
    disp(Xj-Xi)

    
    Xi = Xj;
    
    [f, g, H] = myfun(Xi,data);
end

fsd = (Xi(1,3)*exp(Xi(1,1).*t))+(Xi(1,4)*exp(Xi(1,2).*t));

figure(3)
plot(t,fsd)

end