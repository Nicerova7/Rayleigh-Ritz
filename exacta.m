n = 40;
x = linspace(0,1,n);

y = zeros([n,1]);


for i = 1:n
    
    y(i) = x(i)*(exp(x(i))-exp(1));
end

plot(x,y,'*');
legend('Solución aproximada','Método exacto')