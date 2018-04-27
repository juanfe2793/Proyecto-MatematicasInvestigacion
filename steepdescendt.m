function [Xi, iter] = steepdescendt(Xo, alfa, error, data)

convergencia = 1;
iter = 0;
Xi = Xo;

t = data(:,1);

while (iter < 100) && (convergencia >= error)
    
    %cadena = sprintf('iteracion No:', iter);
    %disp(iter)
    [f, g, H] = myfun(Xo,data);
    pk = g';
    
    Xj = Xi + alfa.*pk;
    iter = iter + 1;
    
    convergencia = norm(Xj - Xi);
    %disp(convergencia)
    
    disp("Esto es XJ - Xi")
    disp(Xj-Xi)
    
    Xi = Xj;
end

fsd = (Xi(1,3)*exp(Xi(1,1).*t))+(Xi(1,4)*exp(Xi(1,2).*t));

figure(3)
plot(fsd)

end