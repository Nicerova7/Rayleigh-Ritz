function z = tracubico(f,i,xx)

    global h;
    global x;
    global n;
    
    if i == 0
        z = arrayfun(f,(xx./h)) - 4*arrayfun(f,(xx+h)./h); %./ para multi y que conserve dimension
    elseif i == 1
        z = arrayfun(f,(xx-x(i+1))./h) - arrayfun(f,(xx+h)./h);
    elseif i <= n-1
        z = arrayfun(f,((xx-x(i+1))./h));
    elseif i == n
        z = arayfun(f,(xx-x(i+1))./h) - arrayfun(f,(xx-(n+2)*h)./h);
    else z = array(f,(xx-x(n+1+1))/h) - 4*arrayfun(f,(xx-(n+2)*h)./h);
    end
    
end