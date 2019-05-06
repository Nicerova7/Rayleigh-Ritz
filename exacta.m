
x = linspace(0,1,50);

y = zeros([50,1]);


for i = 1:50
    
    y(i) = x(i)*(exp(x(i))-exp(1));
end

plot(x,y,'b--o');
